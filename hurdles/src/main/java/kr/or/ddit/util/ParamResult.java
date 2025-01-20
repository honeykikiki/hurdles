package kr.or.ddit.util;

import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.http.HttpServletRequest;

public class ParamResult {
	private int code;
	private String message;
	private Map<String, String> errors; // 누락된 파라미터 정보를 저장

	public ParamResult() {
		this.code = 0;
		this.message = "";
	}

	public static ParamResult valid(HttpServletRequest request, String[] requiredParams) {
		ParamResult result = new ParamResult();
		result.errors = new HashMap<>();

		for (String param : requiredParams) {
			String value = request.getParameter(param);
			if (value == null || value.equals("")) {
				result.errors.put(param, "필수 파라미터가 누락되었습니다.");
				result.code = 1;
			}
		}

		if (!result.errors.isEmpty()) {
			result.message = "다음 파라미터가 누락되었습니다: " + result.errors.keySet();
		}

		return result;
	}

	public int getCode() {
		return code;
	}

	public String getMessage() {
		return message;
	}

	public Map<String, String> getErrors() {
		return errors;
	}

}