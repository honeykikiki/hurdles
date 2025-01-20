package kr.or.ddit.controller.pay;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.service.cart.CartService;
import kr.or.ddit.service.cart.ICartService;
import kr.or.ddit.service.coupon.CouponService;
import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.service.member.MemberService;
import kr.or.ddit.service.pay.PayService;
import kr.or.ddit.util.Utils;
import kr.or.ddit.vo.CartVo;
import kr.or.ddit.vo.CouponVo;
import kr.or.ddit.vo.MemberVo;
import kr.or.ddit.vo.MileageVo;
import kr.or.ddit.vo.OrdersVo;
import kr.or.ddit.vo.PayVo;

@WebServlet("/site/kakaoPay.do")
public class KakaopayController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private static final String ADMIN_KEY = "a4afe86afec691a68a6fbe160877e410";

	ICartService cartService = CartService.getInstance();
	PayService payService = PayService.getInstance();
	IMemberService memberService = MemberService.getInstance();
	CouponService couponService = CouponService.getInstance();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		String command = req.getParameter("command");
		if (command.equals("ready")) {
			
			//장바구니 번호 받기
			String[] cartNoArray = req.getParameterValues("cartNo");
			System.out.println(Arrays.toString(cartNoArray));
			
			HttpSession session = req.getSession();
			if(cartNoArray != null) {
				session.setAttribute("cartNoArray", cartNoArray);
			}
			
			//ORDERS INSERT
			
			
			String memberNoStr = req.getParameter("memberNo");
			int memberNo = Integer.parseInt(memberNoStr);
			
			String ordersAdd1 = req.getParameter("sample6_address");
			String ordersAdd2 = req.getParameter("sample6_detailAddress");
			String couponNo = req.getParameter("couponNo");
			
			session.setAttribute("memberNo", memberNo);
			session.setAttribute("ordersAdd1", ordersAdd1);
			session.setAttribute("ordersAdd2", ordersAdd2);
			session.setAttribute("couponNo", couponNo);
			
			//ORDERS_PRODUCT INSERT
			String ordersProductQtyStr = req.getParameter("quantity");
			int ordersProductQty = Integer.parseInt(ordersProductQtyStr);
			
			session.setAttribute("ordersProductQty", ordersProductQty);
			
			
			//쿠폰금액,마일리지 차감,적립
			String couponValueStr = req.getParameter("couponValue");
			int couponValue = Integer.parseInt(couponValueStr);
			System.out.println("couponValue"+couponValue);
			
			
			MemberVo member = new MemberVo();
			member.setMemberNo(memberNo);
			int memberMileage = memberService.getMileage(member);
			
			String mileageUseStr = req.getParameter("mileageUse");
			int mileageUse = Integer.parseInt(mileageUseStr);
			
			String expectedMileageStr = req.getParameter("expectedMileage");
			int expectedMileage = Integer.parseInt(expectedMileageStr);
			
			int updateMileage = memberMileage - mileageUse + expectedMileage;
			System.out.println(updateMileage);
			session.setAttribute("updateMileage", updateMileage);
			
			//PAY INSERT
			String payTotalPrice = req.getParameter("totalPrice");
			
			
			String payPriceStr = req.getParameter("total_amount");
			int payPrice = Integer.parseInt(payPriceStr);
			
			
			session.setAttribute("payPlus", expectedMileage);
			session.setAttribute("payMinus", mileageUse);
			session.setAttribute("payCoupon", couponValue);
			session.setAttribute("payPrice", payPrice);
			session.setAttribute("payTotalPrice", payTotalPrice);
			
		
			
			
			// 카카오페이 로직
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready"); // url 준비
			HttpURLConnection con = (HttpURLConnection) url.openConnection(); // url로 통신 시작
			con.setRequestMethod("POST"); // POST 방식으로 요청
			con.setRequestProperty("Authorization", "KakaoAK " + ADMIN_KEY); // 요청 헤더 정의
			con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8"); // 요청 헤더 정의
			con.setDoInput(true); // inputstream 으로 응답 헤더와 메시지를 읽겠다
			con.setDoOutput(true); // outputstream 으로 POST 방식의 요청을 하겠다

			Map<String, String> params = new HashMap<String, String>(); // 파라미터 설정
			params.put("cid", "TC0ONETIME");
			params.put("partner_order_id", req.getParameter("partner_order_id"));
			params.put("partner_user_id", req.getParameter("partner_user_id"));
			String itemName = "";
			String quantity = "";
			for (String str : req.getParameterValues("item_name"))
				itemName += str;
			for (String str : req.getParameterValues("quantity"))
				quantity += str;
			params.put("item_name", itemName); // "["sdsdd", "asddsd"]"
			params.put("quantity", quantity); // "[1232, 123123]"
			params.put("total_amount", req.getParameter("total_amount"));
			params.put("tax_free_amount", req.getParameter("tax_free_amount"));
			params.put("approval_url", req.getParameter("approval_url"));
			params.put("cancel_url", req.getParameter("cancel_url"));
			params.put("fail_url", req.getParameter("fail_url"));

			String string_params = new String(); // 보낼 파라미터
			for (Map.Entry<String, String> elem : params.entrySet()) {
				string_params += (elem.getKey() + "=" + elem.getValue() + "&"); // 파라미터 전송 준비
			}

			OutputStream out = con.getOutputStream(); // 요청 스트림 생성
			out.write(string_params.getBytes()); // 파라미터를 바이트로 요청
			out.flush(); // 스트림 버퍼 비우기
			out.close(); // 스트림 닫기

			// 응답받은 메시지의 길이만큼 버퍼를 생성하여 읽어들인다 (응답 스트림)
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()), con.getContentLength());
			String successUrl = null; // 준비 성공 시 연결할 url
			String tid = null; // 준비 성공시 받을 결제 고유 번호

			try { // 응답받은 json 파싱작업
				JSONParser parser = new JSONParser();
				JSONObject res = (JSONObject) parser.parse(in);
				successUrl = (String) res.get("next_redirect_pc_url");
				tid = (String) res.get("tid");
				//HttpSession session = req.getSession();
				session.setAttribute("tid", tid);
				session.setAttribute("partner_order_id", req.getParameter("partner_order_id"));
				session.setAttribute("partner_user_id", req.getParameter("partner_user_id"));
				System.out.println(successUrl);
				System.out.println(tid);
				//req.setAttribute("cartNo", cartNoArray);
			} catch (ParseException e) {
				e.printStackTrace();
			} finally {
				in.close(); // 응답 스트림 닫기
			}

			System.out.print(con.getResponseCode() + " ");
			System.out.println(con.getResponseMessage());
			System.out.println(con.getRequestMethod());

			/*
			 * try { dispatch(request, response, "success.jsp"); } catch (Exception e) {
			 * e.printStackTrace(); }
			 */
			
			resp.sendRedirect(successUrl); // 결제창으로 넘어가는 url
		} else if (command.equals("approval")) { // 결제 승인 통신
			HttpSession session = req.getSession();
			
			
			// 결제 성공시 결제 성공된 장바구니 번호 삭제

			String[] cartNoArray = (String[]) session.getAttribute("cartNoArray");
			int[] cartRemoveIds = new int[cartNoArray.length];
			for(int i=0; i<cartNoArray.length; i++) {
				cartRemoveIds[i] = Integer.parseInt(cartNoArray[i]);
				CartVo cartInfo = cartService.getCartByCartNo(cartRemoveIds[i]);
				// 오더프러덕트 주문한 상품 만큼 추가
			}
						
			int cartDeleteCount = cartService.delete(cartRemoveIds);
			System.out.println(cartDeleteCount+"개 삭제되었습니다");
			
			// 결제 성공시 orders INSERT
			int ordersNo = (int) session.getAttribute("ordersNo");
			int memberNo = (int) session.getAttribute("memberNo");
			String ordersAdd1 = (String) session.getAttribute("ordersAdd1");
			String ordersAdd2 = (String) session.getAttribute("ordersAdd2");
			
			OrdersVo ordersVo = new OrdersVo();
			ordersVo.setOrdersNo(ordersNo);
			ordersVo.setMemberNo(memberNo);
			ordersVo.setOrdersAdd1(ordersAdd1);
			ordersVo.setOrdersAdd2(ordersAdd2);
			System.out.println(ordersVo);
			
			//결제 성공시 pay INSERT
			int payPlus = Utils.parseInt(session.getAttribute("payPlus") + "", 0);
			int payMinus = Utils.parseInt(session.getAttribute("payMinus") + "", 0);
			int payCoupon = Utils.parseInt(session.getAttribute("payCoupon") + "", 0);
			int totalPrice = Utils.parseInt(session.getAttribute("payTotalPrice") + "", 0);
			int total_amount = Utils.parseInt(session.getAttribute("payPrice") + "", 0);
					
			
			PayVo payVo = new PayVo();
			payVo.setPayNo(payService.getPayNo());
			payVo.setOrdersNo(ordersNo);
			payVo.setPayPlus(payPlus);
			payVo.setPayMinus(payMinus);
			payVo.setPayCoupon(payCoupon);
			payVo.setPayTotalPrice(totalPrice);
			payVo.setPayPrice(total_amount);
			
			int payInsert = payService.payInsert(payVo);
			// 사용한 쿠폰 - couponNo
			int couponNo = Utils.parseInt(session.getAttribute("couponNo") + "", 0);
			
			if (payInsert == 1) {
				
				if(couponNo != 0) {
				
					CouponVo cv = new CouponVo();
					cv.setMemberNo(memberNo);
					cv.setCouponNo(couponNo);
					cv.setPayNo(payVo.getPayNo());
				
					couponService.use(cv);
				}
				
			}

			// 결제 성공시 마일리지 업데이트
			int updateMileage = (int) session.getAttribute("updateMileage");
			
			MemberVo memberVo = new MemberVo();
			memberVo.setMemberNo(memberNo);
			memberVo.setMemberMileage(updateMileage);
			
			int updateMileageCnt = memberService.mileageUpdate(memberVo);
			System.out.println(updateMileageCnt + "개 마일리지 업데이트");
			
			// 마일리지내역 INSERT
			if(payPlus > 0) {
				MileageVo mileageVo = new MileageVo();
				mileageVo.setMemberNo(memberNo);
				mileageVo.setMileageUsed("1");
				mileageVo.setMileagePoint(payPlus);
				// 마일리지 서비스 불러서 insert
				
			}
			
			if(payMinus > 0) {
				MileageVo mileageVo = new MileageVo();
				mileageVo.setMemberNo(memberNo);
				mileageVo.setMileageUsed("0");
				mileageVo.setMileagePoint(payMinus);
			}
			
			
			String cid = "TC0ONETIME";
			String tid = (String) session.getAttribute("tid");
			String pg_token = req.getParameter("pg_token");
			String partner_order_id = (String) session.getAttribute("partner_order_id");
			String partner_user_id = (String) session.getAttribute("partner_user_id");
			// System.out.println("pg_token" + " : " + pg_token);
			// System.out.println("partner_order_id : " + partner_order_id);
			// System.out.println("partner_user_id : " + partner_user_id);
			URL url = new URL("https://kapi.kakao.com/v1/payment/approve");
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Authorization", "KakaoAK " + ADMIN_KEY);
			con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
			con.setDoInput(true);
			con.setDoOutput(true);

			Map<String, String> params = new HashMap<String, String>();
			params.put("cid", cid);
			params.put("tid", tid);
			params.put("pg_token", pg_token);
			params.put("partner_order_id", partner_order_id);
			params.put("partner_user_id", partner_user_id);

			String string_params = new String();
			for (Map.Entry<String, String> elem : params.entrySet()) {
				string_params += (elem.getKey() + "=" + elem.getValue() + "&");
			}

			System.out.println("string_params : " + string_params);

			OutputStream out = con.getOutputStream();
			out.write(string_params.getBytes());
			out.flush();
			out.close();

			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			JSONParser parser = null;
			JSONObject res = null;
			try {
				parser = new JSONParser();
				res = (JSONObject) parser.parse(in);
				System.out.println("결제 승인 결과 : " + res.toJSONString());
			} catch (ParseException e) {
				e.printStackTrace();
			} finally {
				in.close();
			}

			System.out.print(con.getResponseCode() + " ");
			System.out.println(con.getResponseMessage());
			System.out.println(con.getRequestMethod());
			

			Map<String, Object> result = new HashMap<String, Object>();
			result.put("itemName", res.get("item_name"));
			// result.put("amount", res.get("amount"));
			result.put("total", ((Map<String, Object>) res.get("amount")).get("total"));
			result.put("approvedAt", res.get("approved_at"));

			req.setAttribute("result", result);

			req.setAttribute("approvalRes", res.toJSONString()); // 응답받은 json 파싱해서 request 속성 설정
			
			try {

				dispatch(req, resp, "/pay/approvalRes.jsp"); // 결제 승인 시 응답받은 json을 파싱한걸 가지고 forward
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			//세션 비우기
			session.removeAttribute("cartNoArray");
			session.removeAttribute("ordersNo");
			session.removeAttribute("memberNo");
			session.removeAttribute("ordersAdd1");
			session.removeAttribute("ordersAdd2");
			session.removeAttribute("couponNo");
			session.removeAttribute("ordersProductQty");
			session.removeAttribute("updateMileage");
			session.removeAttribute("payPlus");
			session.removeAttribute("payMinus");
			session.removeAttribute("payCouPon");
			session.removeAttribute("payPrice");
			session.removeAttribute("payTotalPrice");
			session.removeAttribute("tid");
			session.removeAttribute("partner_order_id");
			session.removeAttribute("partner_user_id");
			session.removeAttribute("cartNo");
			session.removeAttribute("result");
			session.removeAttribute("approvalRes");
		}
	}

	private void dispatch(HttpServletRequest req, HttpServletResponse resp, String url) throws Exception {
		RequestDispatcher dispatch = req.getRequestDispatcher(url);
		dispatch.forward(req, resp);
	}

}
