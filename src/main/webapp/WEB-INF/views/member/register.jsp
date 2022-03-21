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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
		                <input type="text" required class="u_id" id="u_id" name="userId" oninput="checkId()">
		            </div>
		            <span class="chk"></span>
		            <div class="pwd">
		                <label>비밀번호</label>
		                <input type="password" required class="pass"  id="u_pwd" name="userPw" oninput="checkPwd()"> 
		            </div>
		            <div class="pwd">
		                <label>비밀번호 확인</label>
		                <input type="password" required class="pass"  name="userPw" id="repwd" oninput="checkPwd()"> 
		            </div>
		            <span class="chk2"></span>
		            <div class="pwd">
		                <label>이름</label>
		                <input type="text" id="u_name" name="userName" oninput="checkPwd()"> 
		            </div>
		            <div class="name">
		                <label>이메일</label>
		                <input type="text" id="u_email" name="userEmail">
		            </div>
		        </div>
		        <div class="bwrap">
			        <input type="button" class="reg_btn"onClick='fn_register_submit()' value="가입">
			        <input type="button" class="list_btn" onClick='fn_cancel()' value="취소">
		        </div>
		        
				
				
	    	</div>
        </div>
        
    </form>
<script>

function fn_register_submit(){
    if($("#u_name").val()==''){
    	alert("이름을 입력하세요")
    	return false;
    	}
    var form = document.getElementById("register");
    
    form.action = "<c:url value='/member/insert.do'/>";
    form.submit();
    
}
function fn_cancel(){
    
    var form = document.getElementById("register");
    
    form.action = "<c:url value='/board/boardList.do'/>";
    form.submit();
    
}
//아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
var idCheck = 0;
var pwdCheck = 0;
//아이디 체크하여 가입버튼 비활성화, 중복확인.
function checkId() {
    var inputed = $('.u_id').val();
    $(".chk").text("");
    $.ajax({
        data : {
            userId : inputed
        },
        url : "checkId.jy",
        success : function(data) {
            if(inputed=="" && data.replace('\r\n','')=='0') {
                $(".reg_btn").prop("disabled", true);
                $(".reg_btn").css("background-color", "#aaaaaa");
                $("#u_id").css("background-color", "#FFCECE");
                idCheck = 0;
            } else if (data.replace('\r\n','') == '0') {
                $("#u_id").css("background-color", "#B0F6AC");
                idCheck = 1;
                if(idCheck==1 && pwdCheck == 1) {
                    $(".reg_btn").prop("disabled", false);
                    $(".reg_btn").css("background-color", "#1b4d9f");
                    signupCheck();
                } 
            } else if (data.replace('\r\n','') == '1') {
            	$(".chk").text("아이디가 이미 있습니다.");
                $(".reg_btn").prop("disabled", true);
                $(".reg_btn").css("background-color", "#aaaaaa");
                $("#u_id").css("background-color", "#FFCECE");
                idCheck = 0;
            } 
        }
    });
}
//재입력 비밀번호 체크하여 가입버튼 비활성화 또는 맞지않음을 알림.
function checkPwd() {
    var inputed = $('.pass').val();
    var reinputed = $('#repwd').val();
    if(reinputed=="" && (inputed != reinputed || inputed == reinputed)){
        $(".reg_btn").prop("disabled", true);
        $(".reg_btn").css("background-color", "#aaaaaa");
        $("#repwd").css("background-color", "#FFCECE");
    }
    else if (inputed == reinputed) {
        $("#repwd").css("background-color", "#B0F6AC");
        pwdCheck = 1;
        if(idCheck==1 && pwdCheck == 1) {
            $(".reg_btn").prop("disabled", false);
            $(".reg_btn").css("background-color", "#1b4d9f");
        }
    } else if (inputed != reinputed) {
    	$(".chk2").text("비밀번호가 일치하지 않습니다.");
        pwdCheck = 0;
        $(".reg_btn").prop("disabled", true);
        $(".reg_btn").css("background-color", "#aaaaaa");
        $("#repwd").css("background-color", "#FFCECE");
        
    }
}
</script>
</div>
</body>
</html>
