<%@page import="vo.VisitVo"%>
<%@page import="dao.VisitDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("utf-8");
    int idx = Integer.parseInt(request.getParameter("idx"));
    String c_pwd = request.getParameter("c_pwd");
      
    String res = "no";
    
    //결과전송
    out.print(res);

%>    


