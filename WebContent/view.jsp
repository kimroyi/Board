<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.Board"%>
<%@ page import="board.BoardDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="css/bootstrap.css" rel="stylesheet">
<title>게시판</title>
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
		
	%>
	<nav class="navbar navbar-dark bg-dark">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="index.jsp">게시판</a>
	  </div>
	</nav>
	<br>

	<div class="container">
		<div class="row">
			<table class="table table-default table-sm table-bordered" style="text-align:center;">
				<thead>
			    	<tr>
			     		<th colspan="3" style="backgraound-color:#E4E5E9; text-align:center;">게시판 글 보기</th>
			    	</tr>
				</thead>
			  	<tbody>
		  	  		<tr>
			    		<td style="width:20%;">글 제목</td>
			    		<td colspan="2"><%=board.getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></td>
			    	</tr>
			    	<tr>
			    		<td style="width:20%;">작성자</td>
			    		<td colspan="2"><%=board.getWriter()%></td>
			    	</tr>
				    <tr>
			    		<td style="width:20%;">작성일자</td>
			    		<td colspan="2"><%=board.getRegdt()%></td>
			    	</tr>
			    	<tr>
			    		<td style="width:20%;">내용</td>
			    		<td colspan="2" style="height:350px;text-align:left;'"><%=board.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></td>
			    	</tr>
			  	</tbody>
			</table>
			<div class="d-grid gap-2 d-md-block justify-content-md-end">
			  <a class="btn btn-primary me-md-2" href="update.jsp?idx=<%=idx%>">수정</a> 
			  <a class="btn btn-primary" href="delete_action.jsp?idx=<%=idx%>" onclick="return confirm('정말로 삭제하시겠습니까?')">삭제</a> 
			  <a class="btn btn-primary" href="list.jsp">목록</a> 
			</div>
		</div>
	</div>

	
	<%@ include file="/inc/inc_close.jsp" %>