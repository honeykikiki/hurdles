<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//controller에서 저장한 값 꺼내기 - insert, delete, update 시 공통으로 사용하는 페이지
int res = (Integer)request.getAttribute("result");
if(res > 0){
%>	
	{
		"flag" : "수량이 변경되었습니다"
	}
<% }else{ %>
	
	{
		"flag" : "실패"
	}
<%	
}
%>