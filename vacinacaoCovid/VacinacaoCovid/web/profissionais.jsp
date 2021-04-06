<%-- 
    Document   : profissionais
    Created on : 3 de mar de 2021, 22:24:23
    Author     : maria.santos
--%>

<%@page import="br.recife.edu.ifpe.model.repositorios.RepositorioProfissionalEnfermagem"%>
<%@page import="br.recife.edu.ifpe.model.classes.ProfissionalEnfermagem"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profiossionais</title>
        <link rel="stylesheet" href="global.css">
    </head>
    <body>

        <%
            String mensagem = (String) session.getAttribute("msg");
            if (mensagem != null) {
                out.println("<h2>" + mensagem + "</h2>");
                session.removeAttribute("msg");
            }
        %>


        <main>
            <button id="openCreateModal" onclick="modalopen()">Novo Profissional</button>
            <div id="modal" class="modal" style="position: absolute; top: 200px; left: 500px; border: 1px black solid">

                <%@include file="cadastroDeProfissional.jsp" %>

                <br/>
                <footer>
                    <button class="close-button" onclick="modalclose()">Fechar</button>
                </footer>
            </div>

            <div id="modal2" class="modal" style="position: absolute; top: 200px; left: 500px; border: 1px black solid">

                <%@include file="visualizarProfissional.jsp" %>

                <br/>
                <footer>
                    <button class="close-button" onclick="modal2close()">Fechar</button>
                </footer>
            </div>

            <%
                List<ProfissionalEnfermagem> profissionais = RepositorioProfissionalEnfermagem.getCurrentInstance().readAll();
            %>

            <table id="mainTable" border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Coren</th>
                        <th>anoFormacao</th>
                        <th>contato</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (ProfissionalEnfermagem pe : profissionais) {
                    %>
                    <tr>
                        <td><%=pe.getId()%></td>
                        <td><%=pe.getNome()%></td>
                        <td><%=pe.getCoren()%></td>
                        <td><%=pe.getAnoFormacao()%></td>
                        <td><%=pe.getContato()%></td>
                        <td>
                            <a href="ProfissionalEnfermagemServlet?id=<%=pe.getId()%>&redirect=visualiza">Visualizar</a>
                            |
                            <a href="ProfissionalEnfermagemServlet?id=<%=pe.getId()%>&redirect=atualiza">Alterar</a>
                            |
                            <a href="#" onclick="deletar(<%=pe.getId()%>)">Deletar</a>
                        </td>

                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </main>


        <!-- Scripts de ação -->

        <script>

            var modal = document.getElementById("modal");
            var modal2 = document.getElementById("modal2");
            const main = document.querySelector('main');
            const table = document.querySelector('#mainTable');
            const openModalButton = document.querySelector('#openCreateModal');

            <%
                String redirect = request.getParameter("redirect");

                if (redirect == null) {
            %>
            main.removeChild(modal);
            main.removeChild(modal2);
            <%
            } else if (redirect.equals("visualiza")) {
            %>
            table.classList.add('hide');
            openModalButton.classList.add('hide');
            main.removeChild(modal);
            <%
            } else {
            %>
            table.classList.add('hide');
            openModalButton.classList.add('hide');
            main.removeChild(modal2);
            <%
                }
            %>
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

            function deletar(id) {
                fetch("ProfissionalEnfermagemServlet?id=" + id, {method: 'delete'})
                        .then(res => location.reload());
            }
        </script>

    </body>
</html>
