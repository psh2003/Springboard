<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="${path}/resources/css/board_register.css">
</head>
    
<body>
<div>
    <form id="register" name="register" method="post">
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
	        <h1>회원가입</h1>
	        
	    	<div class="login">
		        <div class="iwrap">
		            <div class="id">
		                <label>아이디</label>
		                <input type="text" id="u_id" name="userId">
		            </div>
		            <div class="pwd">
		                <label>비밀번호</label>
		                <input type="password" id="u_pwd" name="userPw"> 
		            </div>
		            <div class="pwd">
		                <label>이름</label>
		                <input type="text" id="u_name" name="userName"> 
		            </div>
		            <div class="name">
		                <label>이메일</label>
		                <input type="text" id="u_email" name="userEmail">
		            </div>
		        </div>
		        <div class="bwrap">
			        <a href='#' class="reg_btn"onClick='fn_register_submit()'>가입</a>
			        <a href='#' class="list_btn" onClick='fn_cancel()'>취소</a> 
		        </div>
		        
				
				
	    	</div>
        </div>
        
    </form>
<script>

function fn_register_submit(){
    
    var form = document.getElementById("register");
    
    form.action = "<c:url value='/member/insert.do'/>";
    form.submit();
    
}
function fn_cancel(){
    
    var form = document.getElementById("register");
    
    form.action = "<c:url value='/board/boardList.do'/>";
    form.submit();
    
}
</script>
</div>
</body>
</html>
