<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-icons.css">
	<title>Cadastro de Usuário</title>
</head>
<body>
	<div class="container">		
		<div class="row">
			<div class="col-md-3"></div>
			
			<div class="col-md-6">
				<form action="/facebook/users/save" method="GET">
					<h1>${usuario eq null ? "Cadastro" : "Atualização"} de Usuário</h1>
					
					<div class="mb-3">
						<a class="bi bi-person"
						href="${pageContext.request.contextPath}/users">Usuários</a>
					</div>
					
					<input type="hidden"
					name="user_id" value="${usuario.getId()}">
					
					<div class="mb-3">
						<label for="user_name_id" class="form-label">
							Nome Usuário
						</label>
						<input type="text" id="user_name_id"
						name="user_name" class="form-control"
						placeholder="Nome" value="${usuario.getName()}">
					</div>
					
					<div class="mb-3">
						<label class="form-label">
							Gênero Usuário
						</label>
						<div class="form-check">
							<input class="form-check-input"
							type="radio" name="user_gender"
							value="M" id="user_gender_m"							
							${usuario.getGender().equals("M") ? "checked": ""}>
							<label for="user_gender_m"
							class="form-check-label">
							Masculino</label>
						</div>
						<div class="form-check">
							<input class="form-check-input"
							type="radio" name="user_gender"
							value="F" id="user_gender_f"							
							${usuario.getGender().equals("F") ? "checked": ""}>
							<label for="user_gender_f"
							class="form-check-label">
							Femenino</label>
						</div>
					</div>					
					
					<div class="mb-3">
						<label for="user_email_id" class="form-label">
							Email Usuário
						</label>
						<input type="email" id="user_email_id"
						name="user_email" class="form-control"
						placeholder="Email" value="${usuario.getEmail()}">
					</div>
								
					<div class="mb-3">
						<label for="user_pw_id" class="form-label">
							Senha
						</label>
						<input type="password" id="user_pw_id"
						name="user_pw" class="form-control"
						placeholder="Senha">
					</div>
					
					<button type="submit" class="btn btn-primary">
						${usuario eq null ? "Cadastrar" : "Atualizar"}
					</button>
				</form>
			</div>
			
			<div class="col-md-3"></div>
		</div>
	</div>
</body>
</html>