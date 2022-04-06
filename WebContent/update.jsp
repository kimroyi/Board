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
			<div class="col"> 
				<form id="frm" method="post" action="update_action.jsp">
					<input type="hidden" id="idx" name="idx" value="<%=idx%>">
					<table class="table" style="text-align:center; border: 1px solid #F5F5F5;">
						<thead>
					    	<tr>
					     		<th colspan="2" style="backgraound-color:#E4E5E9; text-align:center;">게시판 글 수정</th>
					    	</tr>
						</thead>
					  	<tbody>
				  	  		<tr>
					    		<td><input type="text" class="form-control" id="writer" name="writer" placeholder="작성자" maxlength="20" autocomplete="off" value=<%=board.getWriter()%>></td>
					    	</tr>
					    	<tr>
					    		<td><input type="text" class="form-control" id="title" name="title" placeholder="제목" maxlength="50" autocomplete="off" value=<%=board.getTitle()%>></td>
					    	</tr>
					    	<tr>
					    		<td><textarea class="form-control" id="content" name="content" placeholder="내용" rows="3" maxlength="2048" style="height:350px;" autocomplete="off"><%=board.getContent()%></textarea></td>
					    	</tr>
					  	</tbody>
					</table>
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<input type="submit" class="btn btn-primary pull-right" value="수정">
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<%@ include file="/inc/inc_close.jsp" %>