<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="ownQuestionList" scope="request"/>
<c:set var="titleName" value="고객문의" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>사장님 ${titleName }</title>
	<jsp:include page="/WEB-INF/view/owner/layout/prestyle.jsp" />
</head>

<body>
     <!-- Sidebar -->
	 <jsp:include page="/WEB-INF/view/owner/layout/header.jsp" />
     <!-- End of Sidebar -->

     <!-- Begin Page Content -->
     <div class="container-fluid">
		 <div class="table-responsive">
           <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
               <thead>
                   <tr>
                       <th>순번</th>
                       <th>식당이름</th>                       
                       <th>문의제목</th>
                       <th>전화번호</th>
                       <th>문의 날짜</th>
                       <th>상세보기</th>
                   </tr>
               </thead>
               <tbody>
					<c:forEach var="item" varStatus="statusResult" items="${ownQuestionList}">
						<tr>

							<td>${paging.getTotalRecordCount()-((paging['pageNo']-1) * paging['recordCountPerPage'] + statusResult.index)}</td>							
							<td>${item.restaurantName }</td>
							<td>${item.questionTitle }</td>
							<td>${item.memberTel }</td>
							<td>${item.createDate }</td>
							<td> <a href="ownQuestionDetail.do?questionNo=${item.questionNo }" class="btn btn-outline-primary">상세보기</a> </td>	
						</tr>
					</c:forEach>
               </tbody>
           </table>
       </div>
       
     </div>
     <!-- /.container-fluid -->

     <!-- Footer -->
	 <jsp:include page="/WEB-INF/view/owner/layout/footer.jsp" />
     <!-- End of Footer -->

	<jsp:include page="/WEB-INF/view/owner/layout/prescript.jsp" />
</body>


</html>