<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="${path}/resources/css/board_login.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<%@ include file="../include/header.jsp" %>
<script>

function fn_register(){
    
    var form = document.getElementById("loginForm");
    
    form.action = "<c:url value='/member/write.do'/>";
    form.submit();
    
}
function fn_cancel(){
    
    var form = document.getElementById("loginForm");
    
    form.action = "<c:url value='/board/boardList.do'/>";
    form.submit();
    
}
/* $(document).ready(function(){
    $("#btnLogin").click(function(){
        // 태크.val() : 태그에 입력된 값
        // 태크.val("값") : 태그의 값을 변경 
        var userId = $("#userId").val();
        var userPw = $("#userPw").val();
        if(userId == ""){
            alert("아이디를 입력하세요.");
            $("#userId").focus(); // 입력포커스 이동
            return; // 함수 종료
        }
        if(userPw == ""){
            alert("비밀번호를 입력하세요.");
            $("#userPw").focus();
            return;
        }
        // 폼 내부의 데이터를 전송할 주소
        document.loginForm.action="${path}/login/loginCheck.do"
        // 제출
        document.loginForm.submit();
    });
}); */

function fn_login(){
	<c:choose>
    
		<c:when test="${msg == 'failure'}">
	    	<c:set var="loginchk" value="no" />
	    </c:when>
	</c:choose>
	var loginchk1 = '<c:out value="${loginchk}"/>';
    var form = document.getElementById("loginForm");
    var userId = $("#userId").val();
    var userPw = $("#userPw").val();
    if(userId == ""){
        alert("아이디를 입력하세요.");
        $("#userId").focus(); // 입력포커스 이동
        return; // 함수 종료
    }
    else if(userPw == ""){
        alert("비밀번호를 입력하세요.");
        $("#userPw").focus();
        return;
    }
    if(loginchk1=="no"){
    	alert("아이디 또는 비밀번호가 일치하지 않습니다.");
    	form.action = "<c:url value='/login/loginCheck.do'/>";
        form.submit();
    	
    }
    else{
    	alert("로그인 성공");
    	form.action = "<c:url value='/board/boardList.do'/>";
        form.submit();
    }
    form.action = "<c:url value='/login/loginCheck.do'/>";
    form.submit();
    
}
function enterkey() {
	var form = document.getElementById("loginForm");
	if (window.event.keyCode == 13) {
    	form.fn_login();
    }
}
</script>
</head>
<body>

<div>
    <form id="loginForm" name="loginForm" method="post">
        <!-- <div>
            <h2>글쓰기</h2>
            <div>
                <table>
                    <tr>
                        <th>제목</th>
                        <td><input style="width: 500px" type="text" id="title" name="title" /></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td><textarea style="width: 500px" rows="10" cols="10" id="content" name="content"></textarea></td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td><input style="width: 500px" type="text" id="writer" name="writer" /></td>
                    </tr>
                </table>
                <div>
                    <a href='#' onClick='fn_addtoBoard()'>글 등록</a>
                    <a href='#' onClick='fn_cancel()'>목록</a>
                </div>
            </div>
        </div> -->
        <div class="lwrap">
	        <h1>로그인</h1>
	        <div class="bwrap"><a href='#' class="list_btn" onClick='fn_cancel()'>뒤로가기</a></div>
	    	<div class="login">
		        <div class="iwrap">
		            <div class="id">
		                <label>아이디</label>
		                <input type="text" id="userId" name="userId">
		            </div>
		            <div class="pwd">
		                <label>비밀번호</label>
		                <input type="password" id="userPw" name="userPw" onkeypress="if(event.keyCode==13){fn_login();return}"> 
		            </div>
		        </div>
		        <div>
		        	<button type="button" class="login_btn"  id="btnLogin" onClick='fn_login()'>로그인</button>
					<%-- <c:if test="${msg == 'failure'}">
	                	<script>
	                		alert("아이디 또는 비밀번호가 일치하지 않습니다.");
	                	</script>
	                </c:if>
	                <c:if test="${msg == 'success'}">
	                	<script>
	                		alert("로그인 성공");
	                	</script>
	                </c:if> --%>
					<a href="#" class="reg_btn" onClick='fn_register()'>회원가입</a>
		        </div>    
				
	    	</div>
        </div>
        
    </form>

</div>
</body>
</html>
