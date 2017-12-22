<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function send(f) {
	var name = f.name.value;
	var content = f.content.value;
	var pwd = f.pwd.value;
	
	if(name==''){
		alert('작성자명을 입력하세요');
		f.name.focus();
		return;
	}
	
	if(content==''){
		alert('내용을 입력하세요');
		f.content.focus();
		return;
	}
	
	if(pwd==''){
		alert('비밀번호를 입력하세요');
		f.pwd.focus();
		return;
	}
	//  URL=> /visit/insert.do
	f.method = "POST"; //전송방식	
	f.action = "insert.do";//전송할 객체 또는 페이지
	f.submit();//해당 action으로 지정된객체로 form data전송
	
	
	
}


</script>

</head>
<body>

<form>
  <table border="1" align="center">
  <caption>::::방명록 쓰기::::</caption>
  <tr>
     <th>작성자</th>
     <td><input name="name"></td>
  </tr>
  
  <tr>
     <th>내용</th>
     <td>
       <textarea name="content" rows="5" cols="40"></textarea>
     </td>
  </tr>
  
  <tr>
     <th>비밀번호</th>
     <td><input type="password" name="pwd"></td>
  </tr>
  
  <tr>
     <td colspan="2" align="center">
         <input type="button" value="등록하기" 
                onclick="send(this.form);">
         <input type="button" value="목록보기" 
                onclick="javascript:location.href='list.do'">
     </td>
  </tr>
    
  </table>

</form>

</body>
</html>



