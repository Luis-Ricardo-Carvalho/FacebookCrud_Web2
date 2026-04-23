<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-icons.css">
<title>Posts</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-1"></div>
			
			<div class="col-md-10">
				<h1>Lista de Posts</h1>
				
				<div class="mb-3">
					<a class="bi bi-house text-decoration-none"
					href="${pageContext.request.contextPath}/"> Home</a>
				</div>
	
				<table class="table table-striped table-hover">
				  <thead>
				    <tr>
				      <th scope="col">#</th>
				      <th scope="col">Conteúdo</th>
				      <th scope="col">Data do Post</th>
				      <th scope="col">ID do Usuário</th>
				      <th scope="col">Ações</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:forEach var="post" items="${posts}">
					    <tr>
					      <td>${post.getId()}</td>
					      <td>${post.getContent()}</td>
					      <td>${post.getPostDate()}</td>
					      <td>${post.getUser().getId()}</td>
					      <td>
					      	<a class="bi bi-pencil-square me-2"
					      	href="${pageContext.request.contextPath}/posts/update?postId=${post.getId()}"></a>
					      	
					      	<a class="bi bi-trash"
					      	href="${pageContext.request.contextPath}/posts/delete?postId=${post.getId()}"></a>
					      </td>
					    </tr>
				  	</c:forEach>
				  </tbody>
				</table>
				
				<a href="${pageContext.request.contextPath}/posts/new"
				class="btn btn-primary">
				Cadastrar Post</a>
				
			</div>
			
			<div class="col-md-1"></div>
		</div>
	</div>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>