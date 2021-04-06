<%-- 
    Document   : pacientes
    Created on : 6 de abr de 2021, 02:10:45
    Author     : maria.santos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="vacinacao" uri="br.recife.edu.ifpe.customtags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pacientes</title>
    </head>
    <body>
        
        <vacinacao:carregapacientes/>
        
        <main>
            <button id="openCreateModal" onclick="modalopen()">Novo Paciente</button>
            <div id="modal" class="modal" style="position: absolute; top: 200px; left: 500px; border: 1px black solid">

                <%@include file="cadastroPaciente.jsp" %>

                <br/>
                <footer>
                    <button class="close-button" onclick="modalclose()">Fechar</button>
                </footer>
            </div>

            <div id="modal2" class="modal" style="position: absolute; top: 200px; left: 500px; border: 1px black solid">

                <%@include file="visualizaPaciente.jsp" %>

                <br/>
                <footer>
                    <button class="close-button" onclick="modal2close()">Fechar</button>
                </footer>
            </div>


            <h1>Pacientes</h1>
            <ifpe:carregapacientes/>

            <table id="tabela">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Data de Nascimento</th>
                        <th>Caracteristicas individuais</th>
                        <th>Grupo</th>
                        <th>Ações</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="paciente" items="${pacientes}">
                        <tr>
                            <td>${paciente.nome}</td>
                            <td>${paciente.dataNacimento}</td>
                            <td>${paciente.caracteristicasIndividuais}</td>
                            <td>${paciente.grupo}</td>
                            <td>${paciente.grupo}</td>
                            <td>
                                <a href="PacienteServlet?id=${paciente.id}&redirect=visualiza">Visualizar</a>
                                |
                                <a href="PacienteServlet?id=${paciente.id}&redirect=atualiza">Alterar</a>
                            </td>

                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </main>

        <script>

            var modal = document.getElementById("modal");
            var modal2 = document.getElementById("modal2");
            const main = document.querySelector('main');
            const table = document.querySelector('#mainTable');
            const openModalButton = document.querySelector('#openCreateModal');

            const urlParams = new URLSearchParams(window.location.search);
            const redirect = urlParams.get('redirect');

            if (redirect == null) {

                main.removeChild(modal);
                main.removeChild(modal2);

            } else if (redirect.equals("visualiza")) {

                table.classList.add('hide');
                openModalButton.classList.add('hide');
                main.removeChild(modal);

            } else {

                table.classList.add('hide');
                openModalButton.classList.add('hide');
                main.removeChild(modal2);

            }

            function modalclose() {
                table.classList.remove('hide');
                openModalButton.classList.remove('hide');
                main.removeChild(modal);
            }

            function modal2close() {
                table.classList.remove('hide');
                openModalButton.classList.remove('hide');
                main.removeChild(modal2);
            }

            function modalopen() {
                table.classList.add('hide');
                openModalButton.classList.add('hide');
                main.appendChild(modal);
            }

            function deletar(codigo) {
                fetch("FuncionarioServlet?codigo=" + codigo, {method: 'delete'})
                        .then(res => location.reload());
            }
        </script>
    </body>
</html>
