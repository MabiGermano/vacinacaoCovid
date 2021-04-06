<%-- 
    Document   : updateForm
    Created on : 2 de mar de 2021, 22:44:42
    Author     : maria.santos
--%>

<%@page import="br.recife.edu.ifpe.model.classes.Grupo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grupo</title>
    </head>
    <body>
         <h1>Grupo Cadastrado</h1>
        
        <%
            Grupo grupo = (Grupo)request.getAttribute("grupo");
            if(grupo != null){
        %>
        <div class="modal-info">
            <div>
                <label>ID:</label>
                <span><%=grupo.getId()%></span>
            </div>

            <div>
                <label>Denominação:</label>
                <span><%=grupo.getDenominacao()%></span>
            </div>

            <div>
                <label>Idade Minima:</label>
                <span><%=grupo.getIdadeMinima()%></span>
            </div> 
            
            <div>
                <label>Idade Máxima:</label>
                <span><%=grupo.getIdadeMaxima()%></span>
            </div> 
        </div>
        <%
            }
        %>
    </body>
</html>
