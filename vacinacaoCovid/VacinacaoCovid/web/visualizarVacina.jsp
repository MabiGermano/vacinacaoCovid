<%-- 
    Document   : vizualizarVacina
    Created on : 2 de mar de 2021, 23:57:18
    Author     : maria.santos
--%>

<%@page import="br.recife.edu.ifpe.model.classes.Vacina"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profissional</title>
    </head>
    <body>
         <h1>Vacina Cadastrado</h1>
        
        <%
            Vacina vacina = (Vacina)request.getAttribute("vacina");
            if(vacina != null){
        %>
        <div class="modal-info">
            <div>
                <label>ID:</label>
                <span><%=vacina.getId()%></span>
            </div>

            <div>
                <label>Nome:</label>
                <span><%=vacina.getNome()%></span>
            </div>

            <div>
                <label>Fabricante:</label>
                <span><%=vacina.getFabricante()%></span>
            </div> 
            
            <div>
                <label>Tempo entre aplicações:</label>
                <span><%=vacina.getTempoEntreAplicacoes()%></span>
            </div> 
            
            <div>
                <label>Quantidade de aplicações:</label>
                <span><%=vacina.getQuantidadeAplicacoes()%></span>
            </div> 
        </div>
        <%
            }
        %>
    </body>
</html>
