<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="${path}/resources/css/board_list.css">
	<script>
//글쓰기
function fn_write(){
    
	<c:choose>
	    <c:when test="${sessionScope.userId == null}">
	    	<c:set var="st" value="logout" />
	    </c:when>
	</c:choose>
	var st1 = '<c:out value="${st}"/>';
    var form = document.getElementById("boardForm");
	if (st1=="logout"){
		alert("로그인을 해주세요");
		form.action = "<c:url value='/login/login.do'/>";
	    form.submit();
	}
	else{
		form.action = "<c:url value='/board/writeForm.do'/>";
	    form.submit();
	}
}
 
//글조회
function fn_view(code){
    
    var form = document.getElementById("boardForm");
    var url = "<c:url value='/board/viewContent.do'/>";
    url = url + "?code=" + code;
    
    form.action = url;    
    form.submit(); 
}

</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div>
    <form id="boardForm" name="boardForm" method="post">

        <%-- <table>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>날짜</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="result" items="${list }" varStatus="status">
                    <tr>
                        <td><c:out value="${result.code }"/></td>
                        <td><a href='#' onClick='fn_view(${result.code})'><c:out value="${result.title }"/></a></td>
                        <td><c:out value="${result.writer }"/></td>
                        <td><c:out value="${result.reg_datetime }"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table> --%>
        <div class="boardlist">
	        <table class="tb">
	            <caption>게시판 목록입니다.</caption>
	            <thead>
	                <tr>
	                    <td>게시판 목록</td>
	                </tr>
	            </thead>
	            <tbody>
	            	<c:forEach var="result" items="${list}" varStatus="status">
		                <tr>
		                    <td class="bnum"><c:out value="${result.code }"/></td>
		                    <td class="title"><a href='#'  class="title" onClick='fn_view(${result.code})'><c:out value="${result.title }"/></a></td>
		                    <td class="date"><c:out value="${result.reg_datetime }"/></td>
		                    <td class="process"><c:out value="${result.writer }"/></td>
		                </tr>
	                </c:forEach>
	            </tbody>
	        </table>
	        <div>            
            	<a href='#' class="write_btn" onClick='fn_write()'>글쓰기</a>           
        	</div>
    	</div>
        
    </form>
</div>
</body>
</html>