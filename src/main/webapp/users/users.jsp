<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-icons.css">
<title>Usuários</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-1"></div>
			
			<div class="col-md-10">
				<h1>Lista de Usuários</h1>
				
				<div class="mb-3">
					<a class="bi bi-house"
					href="${pageContext.request.contextPath}/">Home</a>
				</div>
	
				<table class="table table-striped table-hover">
				  <thead>
				    <tr>
				      <th scope="col">#</th>
				      <th scope="col">Nome</th>
				      <th scope="col">Sexo</th>
				      <th scope="col">Email</th>
				      <th scope="col">Ações</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:forEach var="usuario" items="${usuarios}">
					    <tr>
					      <td>${usuario.getId()}</td>
					      <td>${usuario.getName()}</td>
					      <td>${usuario.getGender()}</td>
					      <td>${usuario.getEmail()}</td>
					      <td>
					      	<a class="bi bi-pencil-square"
					      	href="${pageContext.request.contextPath}/users/update?userId=${usuario.getId()}"></a>
					      	
					      	<a class="bi bi-trash"
					      	href="${pageContext.request.contextPath}/users/delete?userId=${usuario.getId()}"></a>
					      </td>
					    </tr>
				  	</c:forEach>
				  </tbody>
				</table>
				
				<a href="${pageContext.request.contextPath}/users/form_user.jsp"
				class="btn btn-primary">
				Cadastrar Usuário</a>
				
			</div>
			
			<div class="col-md-1"></div>
		</div>
	</div>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>