<%@page import="com.pauu.jndi.bean.MyBean"%>
<%@page import="javax.naming.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>test jndi</h1>
	<hr/>
	<%
    Context initCtx = new InitialContext();
   	MyBean bean = (MyBean) initCtx.lookup("java:comp/env/bean/MyBeanFactory");
    %>
    foo:<%=bean.getFoo() %><br>
    bar:<%=bean.getBar() %>
</body>
</html>