<%-- 
    Document   : vacinas
    Created on : 3 de mar de 2021, 22:11:37
    Author     : maria.santos
--%>


<%@page import="br.recife.edu.ifpe.model.classes.Vacina"%>
<%@page import="br.recife.edu.ifpe.model.repositorios.RepositorioVacina"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vacinas</title>
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

                <%@include file="cadastroDeVacina.jsp" %>

                <br/>
                <footer>
                    <button class="close-button" onclick="modalclose()">Fechar</button>
                </footer>
            </div>

            <div id="modal2" class="modal" style="position: absolute; top: 200px; left: 500px; border: 1px black solid">

                <%@include file="visualizarVacina.jsp" %>

                <br/>
                <footer>
                    <button class="close-button" onclick="modal2close()">Fechar</button>
                </footer>
            </div>

            <%
                List<Vacina> vacinas = RepositorioVacina.getCurrentInstance().readAll();
            %>

            <table id="mainTable" border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Fabricante</th>
                        <th>Tempo entre Aplicações</th>
                        <th>Quantidade de Aplicações</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Vacina v : vacinas) {
                    %>
                    <tr>
                        <td><%=v.getId()%></td>
                        <td><%=v.getNome()%></td>
                        <td><%=v.getFabricante()%></td>
                        <td><%=v.getTempoEntreAplicacoes()%></td>
                        <td><%=v.getQuantidadeAplicacoes()%></td>
                        <td>
                            <a href="VacinaServlet?id=<%=v.getId()%>&redirect=visualiza">Visualizar</a>
                            |
                            <a href="VacinaEnfermagemServlet?id=<%=v.getId()%>&redirect=atualiza">Alterar</a>
                            |
                            <a href="#" onclick="deletar(<%=v.getId()%>)">Deletar</a>
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
                fetch("VacinaServlet?id=" + id, {method: 'delete'})
                        .then(res => location.reload());
            }
        </script>

    </body>
</html>
