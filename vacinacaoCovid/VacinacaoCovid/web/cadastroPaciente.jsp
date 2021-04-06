<%-- 
    Document   : cadastroPaciente
    Created on : 5 de abr de 2021, 22:33:27
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
        
        <vacinacao:carregapacientes/>
        <vacinacao:carregaprofissionais/>
        <vacinacao:carregavacinas/>
        
        <form method="post" action="PacienteServlet" onsubmit="confirmar()">
            <div>
                <label for="nome">
                    Nome:
                </label>
                <input name="nome" id="nome" type="text" value="${(param.redirect != null && param["redirect"] eq "atualiza") ? paciente.nome: ''}">
            </div>


            <div>
                <label for="dataNascimento">
                    Data de Nascimento: 
                </label>
                <input name="dataNascimento" id="dataNascimento" type="text"value="${(param.redirect != null && param["redirect"] eq "atualiza") ? paciente.dataNascimento : ''}">
            </div>

            <div>
                <label for="caracteristicasIndividuais">
                    Caracteristicas Individuais:
                </label>
                <input name="caracteristicasIndividuais" id="caracteristicasIndividuais" type="text" value="${(param.redirect != null && param["redirect"] eq "atualiza") ? paciente.caracteristicasIndividuais : ''}">
            </div>

            <div>
                <label for="grupo">
                    Grupo:
                </label>
                <select id="grupo" name="grupo">
                    <c:forEach var="grupo" items="${grupos}">                        
                        <option value="${grupo.id}">${grupo.nome}</option>
                    </c:forEach>
                </select>
            </div>


            <div>
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

            </div>

            <input type="hidden" name="${(param.redirect != null && param.redirect eq 'atualiza') ? 'atualizar' : ''}" value="1"/>
            <input name="id" id="id" type="hidden" value="${(param.redirect != null && param["redirect"] eq "atualiza") ? produto.codigo : ''}">
            <footer>
                <button id="submit-button" type="submit">
                    ${(param.redirect != null && param.redirect eq 'atualiza') ? 'Atulizar' : 'Cadastrar'}
                </button>
            </footer>
        </form>
        <script>
            function confirmar(event) {
                event.preventDefault()
                const profissional = document.querySelector('#profissional').value
                const vacina = document.querySelector('#vacina').value
                if (confirm(`Confirma os dados da aplicação: Profissional: ${profissional} | Vacina: ${vacina}?`)) {
                    document.querySelector('form').submit()
                }
            }
        </script>
    </body>
</html>
