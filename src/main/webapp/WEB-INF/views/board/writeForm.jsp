<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시글 작성</title>
<link rel="stylesheet" href="${path}/resources/css/board_write.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
    
<body>
<div>
    <form id="writeForm" name="writeForm" method="post">
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
		<h1>게시글 작성</h1>
		    <table>
		        <caption>게시글 작성 화면입니다.</caption>
		        <tbody>
		            <tr>
		                <th>제목</th>
		                <td><input type="text" id="title" name="title" /></td>
		            </tr>
		            <tr>
		                <th>내용</th>
		                <td class="content"><textarea rows="10" cols="10" id="content" name="content"></textarea></td>
		            </tr>
		            <tr>
		                <th>작성자</th>
		                <td> <input id="writer" name="writer" value="${sessionScope.userName}" readonly="readonly"> </td>
		            </tr>
		        </tbody>
		    </table>
		    <div>
	            <a href='#' class="list_btn" onClick='fn_addtoBoard()'>글 등록</a>
	            <a href='#' class="list_btn" onClick='fn_cancel()'>목록</a>
            </div>
    </form>
<script>
//글쓰기
function fn_addtoBoard(){
    var title = $('#title').val();
    var content = $('#content').val();
    var form = document.getElementById("writeForm");
    if(title==""){
    	alert("제목을 입력하세요");
    	$('#title').focus();
    	return;
    }
    else if(content==""){
    	alert("내용을 입력하세요");
    	$('#content').focus();
    	return;
    }else{
    	var con = confirm("등록하시겠습니까?");
    	if(con==true){
    		form.action = "<c:url value='/board/write.do'/>";
    	    form.submit();
    	    alert("등록 되었습니다.");
    	}
    	else{
    		return;
    	}
    }
    
    
}
 
//목록
function fn_cancel(){
    
    var form = document.getElementById("writeForm");
    
    form.action = "<c:url value='/board/boardList.do'/>";
    form.submit();
    
}

</script>
</div>
</body>
</html>
