<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 	MemberDAO memberDAO = new MemberDAO();
// 	MemberBean member = new MemberBean();
// 	member.setMember_id(request.getParameter("member_id"));
	
// 	memberDAO.OverLapId(member);
// 	String member_id = request.getParameter("member_id");
// 	out.println(member_id);
	
	request.setCharacterEncoding("UTF-8");
	String member = "";
	member = (String)session.getAttribute("check");	
%>
<%=member %>



