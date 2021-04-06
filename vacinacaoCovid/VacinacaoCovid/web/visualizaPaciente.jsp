<%-- 
    Document   : visualizaPaciente
    Created on : 6 de abr de 2021, 02:47:28
    Author     : maria.santos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="vacinacao" uri="br.recife.edu.ifpe.customtags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Paciente</title>
    </head>
    <body>
        <h1>Funcionario Cadastrado</h1>
        

    <c:if test="${paciente != null}">


        <div class="modal-info">
            <div>
                <label>Nome:</label>
                <span>${paciente.nome}</span>
            </div>
            <div>
                <label>Data de Nascimento:</label>
                <span>${paciente.dataNascimento}</span>
            </div>
            <div>
                <label>Caracteristicas individuais:</label>
                <span>${paciente.caracteristicasIndividuais}</span>
            </div>
            <div>
                <label>Grupo:</label>
                <span>${paciente.grupo}</span>
            </div>

            <div>

                <c:forEach var="aplicacao" items="${paciente.aplicacoes}">                        
                    <div>
                        <label>Aplicador:</label>
                        <span>${aplicacao.aplicador.nome}</span>
                    </div>
                    <div>
                        <label>Vacina</label>
                        <span>${aplicacao.vacina.nome}</span>
                    </div>
                    <div>
                        <label>Descrição</label>
                        <span>${aplicacao.descricao}</span>
                    </div>
                    
                </c:forEach>

            </div>

        </div>
    </c:if>
</body>
</html>
