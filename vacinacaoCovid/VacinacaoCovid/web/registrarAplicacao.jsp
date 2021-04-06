<%-- 
    Document   : registrarAplicacao
    Created on : 6 de abr de 2021, 01:46:50
    Author     : maria.santos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="vacinacao" uri="br.recife.edu.ifpe.customtags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar aplicação</title>
    </head>
    <body>
        
        <vacinacao:carregapacientes/>
        <vacinacao:carregaprofissionais/>
        <vacinacao:carregavacinas/>
        
        <form>
            <div>
                <label for="paciente">
                    Paciente:
                </label>
                <select name="paciente" id="paciente">
                    <c:forEach var="paciente" items="${pacientes}">                        
                        <option value="${paciente.id}">${paciente.nome}</option>
                    </c:forEach>
                </select>
            </div>
            <div>
                <label for="profissional">
                    Profissional:
                </label>
                <select name="profissional" id="profissional">
                    <c:forEach var="profissional" items="${profissionais}">                        
                        <option value="${profissional.id}">${profissional.nome}</option>
                    </c:forEach>
                </select>
            </div>
            <div>
                <label for="vacina">
                    Vacina:
                </label>
                <select name="vacina" id="vacina">
                    <c:forEach var="vacina" items="${vacinas}">                        
                        <option value="${vacina.id}">${vacina.nome}</option>
                    </c:forEach>
                </select>
            </div>

            <div>
                <label for="vacina">
                    Descricão:
                </label>
                <textarea id="descricao" name="descricao" ></textarea>
            </div>

        </form>

        <script>
            function salvar() {
                const pacienteId = document.querySelector('#paciente').value
                const profissionalId = document.querySelector('#profissional').value
                const vacinaId = document.querySelector('#vacina').value
                const descricao = document.querySelector('#descricao').value
                fetch(`PacienteServlet?
                        pacienteId=${codigoPaciente}&
                        profissionalId=${profissionalId}&
                        vacinaId=${vacinaId}&
                        descricao=${descricao}`, {method: "put"})
                        .then(function () {
                            location.reload();
                        });
            }

        </script>
    </body>
</html>
