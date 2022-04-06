<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.Board" %>
<%@ page import="java.util.ArrayList" %>
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
	<nav class="navbar navbar-dark bg-dark">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="index.jsp">게시판</a>
	  </div>
	</nav>
	<br>

	<div class="container">
		<div class="row">
			<table class="table table-default table-sm table-bordered table-hover" style="text-align:center; cursor:pointer;">
			  <thead>
			  	<tr>
			    	<th>글번호</th>
			    	<th>제목</th>
			    	<th>작성자</th>
			    	<th>작성일</th>
			  	</tr>
			  </thead>
			  <tbody>
			  	<%
			  		BoardDAO boardDAO = new BoardDAO();
			  		ArrayList<Board> list = boardDAO.getList();
			  		for(int i = 0; i < list.size(); i++){
			  	%>
			    <tr onclick="view_board(<%=list.get(i).getIdx()%>);">
			    	<td><%=list.get(i).getIdx()%></td>
			    	<td><%=list.get(i).getTitle()%></td>
			    	<td><%=list.get(i).getWriter()%></td>
			    	<td><%=list.get(i).getRegdt()%></td>
			    	
			    </tr>
			  	<%		
			  		}
			  	%>

			  </tbody>
			</table>
			<div class="d-grid gap-2 d-md-block">
				<a class="btn btn-primary" href="write.jsp">글쓰기</a>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		function view_board(idx){
			location.href="view.jsp?idx="+idx;
		};
	</script>
	
	<%@ include file="inc/inc_close.jsp" %>
