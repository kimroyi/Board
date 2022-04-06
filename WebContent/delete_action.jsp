<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="board.Board"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
		int idx = 0;
		if (request.getParameter("idx") != null) {
			idx = Integer.parseInt(request.getParameter("idx"));
		}
		if (idx == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 게시물입니다.')");
			script.println("location.href='list.jsp'");
			script.println("</script>");
		}
		Board board = new BoardDAO().getBoard(idx);
		
		BoardDAO boardDAO = new BoardDAO();
		int result = boardDAO.delete(idx);
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("alert('글 삭제 실패!')");
			script.println("history.back()");
			script.println("</script>");
		}else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
		}
	%>
	
<%@ include file="/inc/inc_close.jsp" %>