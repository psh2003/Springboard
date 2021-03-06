<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시글 상세</title>
<link rel="stylesheet" href="${path}/resources/css/board_view.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>

<body>
    <form id="viewForm" name="viewForm" method="post">
        <%-- <div>
            <h2>글쓰기</h2>
            <div>
                <table>
                    <tr>
                        <th>제목</th>
                        <td><input style="width: 500px" type="text" id="title" name="title" value="${result.title }"/></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td><textarea style="width: 500px" rows="10" cols="10" id="content" name="content"><c:out value="${result.content }"/></textarea></td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td><input style="width: 500px" type="text" id="writer" name="writer" value="${result.writer }"/></td>
                    </tr>
                </table>
                <div>
                    <a href='#' onClick='fn_update()'>수정</a>
                    <a href='#' onClick='fn_cancel()'>목록</a>
                    <a href='#' onClick='fn_relay()'>답변</a>                    
                </div>
            </div>
        </div>
        <input type='hidden' id='code' name='code' value='${result.code }' /> --%>
        <h1>게시글 상세</h1>
	    <table>
	        <caption>게시글 상세 게시판입니다.</caption>
	        <tbody>
	            <tr>
	                <th>제목</th>
	                <c:choose>
		                <c:when test="${sessionScope.userName==result.writer}">
		                	<td><input type="text" id="title" name="title" value="${result.title }"/></td>
		                </c:when>
		                <c:when test="${sessionScope.userName!=result.writer}">
		                	<td><input type="text" id="title" name="title" value="${result.title }" disabled="disabled"/></td>
		                </c:when>
	                </c:choose>
	            </tr>
	            <tr>
	                <th>내용</th>
	                <c:choose>
		                <c:when test="${sessionScope.userName==result.writer}">
	                		<td class="content"><textarea rows="10" cols="10" id="content" name="content"><c:out value="${result.content }"/></textarea></td>
	                	</c:when>
	                	<c:when test="${sessionScope.userName!=result.writer}">
		                	<td class="content"><textarea rows="10" cols="10" id="content" name="content" disabled="disabled"><c:out value="${result.content}"/></textarea></td>
		                </c:when>
	                </c:choose>
	            </tr>
	            <tr>
	                <th>작성자</th>
	                <td><input id="writer" name="writer" value="${result.writer }" readonly onfocus="this.blur()"></td>
	                
	            </tr>
	        </tbody>
	    </table>
	    <div>
	    	<c:if test="${sessionScope.userName==result.writer}">
            	<a href='#' class="write_btn" onClick='fn_update()'>수정</a>
            	<a href='#' class="write_btn" onClick='fn_delete()'>삭제</a>
	        </c:if>
	        
	        <a href='#' class="write_btn" onClick='fn_cancel()'>목록</a>
	        <!-- <a href='#' class="write_btn" onClick='fn_relay()'>답변</a> -->                    
        </div>
        <input type='hidden' id='code' name='code' value='${result.code }' />
    </form>
<script>
//목록
function fn_cancel(){
    
    var form = document.getElementById("viewForm");
    
    form.action = "<c:url value='/board/boardList.do'/>";
    form.submit();
    
}
 
//수정
function fn_update(){
    
    var form = document.getElementById("viewForm");
    var title = $('#title').val();
    var content = $('#content').val();
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
    	var con = confirm("수정하시겠습니까?");
    	if(con==true){
    		form.action = "<c:url value='/board/updateboard.do'/>";
    	    form.submit();
    	    alert("수정 되었습니다.");
    	}
    	else{
    		return;
    	}
    }
}
 
//답변
function fn_relay(){
    
    var form = document.getElementById("viewForm");
    
    form.action = "<c:url value='/board/relayForm.do'/>";
    form.submit();
    
}
//삭제
function fn_delete(){
    
    var form = document.getElementById("viewForm");
    var title = $('#title').val();
    var content = $('#content').val();
  	var con = confirm("삭제하시겠습니까?");
  	if(con==true){
  		form.action = "<c:url value='/board/deleteboard.do'/>";
  	    form.submit();
  	    alert("삭제 되었습니다.");
  	}
  	else{
  		return;
  	}
    
}
</script>
</div>
</body>
</html>
