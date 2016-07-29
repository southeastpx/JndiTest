<%@page import="javax.sql.*,java.sql.*"%>
<%@page import="com.pauu.jndi.bean.MyBean"%>
<%@page import="javax.naming.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Results</h2>
    <%
    Context initContext = new InitialContext();
    Context envContext  = (Context)initContext.lookup("java:/comp/env");
    DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
    Connection conn = ds.getConnection();
    String sql = "select * from emp";
    PreparedStatement st = conn.prepareStatement(sql);
    ResultSet rs = st.executeQuery();
    while(rs.next()){
        out.println("ename:"+rs.getString(1)+" job:"+rs.getInt(2)+"<br>");
    }
    if(rs!=null){
        try{
            rs.close();
        }catch (Exception e) {
            e.printStackTrace();
        }
        rs = null;
    }
    if(st!=null){
        try{
            st.close();
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    if(conn!=null){
        try{
            conn.close();
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
    %>
</body>
</html>