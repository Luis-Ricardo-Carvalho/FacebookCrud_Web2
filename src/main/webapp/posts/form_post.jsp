<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-icons.css">
	<title>Cadastro de Post</title>
</head>
<body>
	<div class="container">		
		<div class="row">
			<div class="col-md-3"></div>
			
			<div class="col-md-6">
				<form action="${pageContext.request.contextPath}/posts/save" method="GET">
					<h1>${post eq null ? "Cadastro" : "Atualização"} de Post</h1>
					
					<div class="mb-3">
						<a class="bi bi-card-text text-decoration-none"
						href="${pageContext.request.contextPath}/posts"> Posts</a>
					</div>
					
					<input type="hidden"
					name="post_id" value="${post != null ? post.getId() : ''}">
					
					<div class="mb-3">
						<label for="content_id" class="form-label">
							Conteúdo do Post
						</label>
						<textarea id="content_id"
						name="content" class="form-control"
						placeholder="Digite o conteúdo do post"
						rows="4" required>${post != null ? post.getContent() : ''}</textarea>
					</div>
					
					<div class="mb-3">
						<label for="post_date_id" class="form-label">
							Data do Post
						</label>
						<input type="date" id="post_date_id"
						name="post_date" class="form-control"
						value="${postDateFormatted}" required>
					</div>
					
					<div class="mb-3">
						<label for="user_id_id" class="form-label">
							Usuário
						</label>
						<select id="user_id_id" name="user_id" class="form-select" required>
							<option value="">Selecione um usuário</option>

							<c:forEach var="usuario" items="${usuarios}">
								<option value="${usuario.getId()}"
									${post != null && post.getUser() != null && post.getUser().getId() == usuario.getId() ? "selected" : ""}>
									ID ${usuario.getId()} - ${usuario.getName()}
								</option>
							</c:forEach>
						</select>
					</div>
					
					<div class="d-flex gap-2">
						<button type="submit" class="btn btn-primary">
							${post eq null ? "Cadastrar" : "Atualizar"}
						</button>
						
						<a href="${pageContext.request.contextPath}/posts" class="btn btn-secondary">
							Cancelar
						</a>
					</div>
				</form>
			</div>
			
			<div class="col-md-3"></div>
		</div>
	</div>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>