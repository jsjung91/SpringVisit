<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- JSTL(JSP Standard Tag Library) 이용 -->    
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 
      href="${ pageContext.request.contextPath }/resources/css/mystyle.css">
<%-- 
<script type="text/javascript" 
        src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script> --%>
<script type="text/javascript">

var g_idx;

function del(f) {
	
	var c_pwd = f.c_pwd.value;//사용자가 입력한 비밀번호
	g_idx   = f.idx.value;//삭제할 게시물번호
	
	if(c_pwd ==''){
		alert('비빌번호를 입력하세요');
		return;
	}
	
	//Ajax통해서 비밀번호 맞는지 여부 체크
	var url = "check_password.do";  
	
	//비밀번호에 한글또는 특수문자가 포함되어있으면 인코딩해서 전송
	var param = "idx="+g_idx+"&c_pwd="+ encodeURIComponent(c_pwd);
	sendRequest(url, param, resultDeleteFn, "GET");

}

function resultDeleteFn() {
	
	if(xhr.readyState==4 && xhr.status==200){
		//서버에서 보내준 데이터 수신
		var data = xhr.responseText;
		
		if(data.indexOf('no') !=-1){
			alert('비밀번호가 맞지않습니다');
			return;
		}
		//삭제확인작업
		if(confirm('정말삭제?')==false){
			return;
		}
	 
		//자바스크립트을 이용해서 삭제처리
		location.href='delete.do?idx='+ g_idx;     
	}
}

function modify(f) {
	
	var c_pwd = f.c_pwd.value;//사용자가 입력한 비밀번호
	g_idx   = f.idx.value;//수정할 게시물번호
	
	if(c_pwd ==''){
		alert('비빌번호를 입력하세요');
		return;
	}
	//Ajax통해서 비밀번호 맞는지 여부 체크
	var url = "check_password.do";  
	//비밀번호에 한글또는 특수문자가 포함되어있으면 인코딩해서 전송
	var param = "idx="+g_idx+"&c_pwd="+ encodeURIComponent(c_pwd);
	sendRequest(url, param, resultModifyFn, "GET");
	
}

//수정시 암호확인결과 콜백함수
function resultModifyFn(){
	
	if(xhr.readyState==4 && xhr.status==200){
		
		var data = xhr.responseText;
		
		if(data.indexOf('no') !=-1 ){
			alert('비밀번호가 틀립니다');
			return;
		}
		
		//수정폼 호출(VisitModifyFormAction)
		location.href="modify_form.do?idx="+ g_idx;
		
	}
}

function search() {
	var search = document.getElementById("search").value;
	var search_text = document.getElementById("search_text").value;
	if( search!="all" &&  search_text==""){
		alert('검색내용을 입력하세요!!');
		return;
	}
	
	location.href="list.do?search=" + search 
			     +"&search_text=" + encodeURIComponent(search_text);
}

window.onload=function(){
  var search_array = ["all","content","name","content_name"];
  var search = document.getElementById("search");
  
  for(var i=0;i<search_array.length;i++){
	  
	  if(search_array[i]=='${ param.search }'){
		  search[i].selected = true;
		  break;
	  }
  }
	
};

</script>
</head>
<body>

<%-- 현재웹컨텍스트경로 : ${ pageContext.request.contextPath } --%>

<div id="main_box">
	<h1>::::방명록 목록보기::::</h1>
	<!-- 글쓰기 버튼 -->
	<div align="center">
	   <input type="button"  value="글쓰기"  
	          onclick="javascript:location.href='insert_form.do' ">
	   <br>       
	   <!-- 검색 -->
	   <select id="search">
	       <option value="all">전체보기</option>
	       <option value="content">내용</option>
	       <option value="name">작성자</option>
	       <option value="content_name">내용+작성자</option>
	   </select>
	   <input id="search_text"  value="${ param.search_text }">
	   <input type="button" value="검색" onclick="search();">       
	</div>
	<hr>
	
	<!-- list에 값이 비어있냐? : empty list -->
	<c:if test="${ empty requestScope.list }">
	  <div align="center">등록된 게시물이 없습니다</div>
	</c:if>
	
	
	<!-- 내용  -->
	<c:forEach var="vo" items="${ list }">
		<form>
		    <!-- 서버로전송할 또는 자바스크립트에서 체크할 값을
		         히든태그로 숨겨놓는다
		      -->
		    <input type="hidden" name="idx" value="${ vo.idx }" >
		    
		    
			<div class="content_box">
				<div class="content">${ vo.content }</div>
				<div class="name">작성자:${ vo.name }</div>
				<div class="regdate">작성일자:${ vo.regdate }</div>
				<div class="job">
				   비밀번호(${ vo.pwd }):<input type="password" name="c_pwd">
				   <input type="button"  value="삭제" 
				          onclick="del(this.form);">
				   <input type="button"  value="수정" 
				          onclick="modify(this.form);">
				</div>
			</div>
			<hr>
		</form>
	</c:forEach>
</div>
</body>
</html>