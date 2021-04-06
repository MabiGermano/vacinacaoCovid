<%-- 
    Document   : vizualizarProfissional
    Created on : 2 de mar de 2021, 22:44:42
    Author     : maria.santos
--%>

<%@page import="br.recife.edu.ifpe.model.classes.ProfissionalEnfermagem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profissional</title>
    </head>
    <body>
         <h1>Profissional Cadastrado</h1>
        
        <%
            ProfissionalEnfermagem profissional = (ProfissionalEnfermagem)request.getAttribute("profissionalEnfermagem");
            if(profissional != null){
        %>
        <div class="modal-info">
            <div>
                <label>ID:</label>
                <span><%=profissional.getId()%></span>
            </div>

            <div>
                <label>Nome:</label>
                <span><%=profissional.getNome()%></span>
            </div>

            <div>
                <label>Coren:</label>
                <span><%=profissional.getCoren()%></span>
            </div> 
            
            <div>
                <label>Ano de formação:</label>
                <span><%=profissional.getAnoFormacao()%></span>
            </div> 
            
            <div>
                <label>Contato:</label>
                <span><%=profissional.getContato()%></span>
            </div> 
        </div>
        <%
            }
        %>
    </body>
</html>
