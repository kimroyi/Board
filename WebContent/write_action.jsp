<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="board" class="board.Board" scope="page"/>
<jsp:setProperty property="title" name="board"/>
<jsp:setProperty property="content" name="board"/>
<jsp:setProperty property="writer" name="board"/>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
		if (board.getTitle() == null || board.getContent() == null || board.getWriter() == null ) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다. 확인 바랍니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			board.BoardDAO BoardDAO = new board.BoardDAO();
			int result = BoardDAO.write(board.getTitle(), board.getWriter(), board.getContent());
			if (result == -1){
				PrintWriter script = response.getWriter();
				script.println("alert('글쓰기 실패!')");
				script.println("history.back()");
				script.println("</script>");
			}else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'index.jsp'");
				script.println("</script>");
			}
		}
	%>
	
<%@ include file="/inc/inc_close.jsp" %>