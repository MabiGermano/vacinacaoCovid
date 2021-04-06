<%-- 
    Document   : cadastroDeGrupo
    Created on : 2 de mar de 2021, 22:42:53
    Author     : maria.santos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grupo</title>
    </head>
    <body>
        <h1>${(param.redirect != null && param.redirect eq 'atualiza') ? 'Alteração' : 'Cadastro'} de grupo</h1>

        <form method="post" action="GrupoServlet">
            <div>
                <label for="denominacao">
                    Denominação:
                </label>
                <input name="denominacao" id="denominacao" type="text" value="${(param.redirect != null && param["redirect"] eq "atualiza") ? grupo.denominacao: ''}">
            </div>

            <div>
                <label for="idadeMinima">
                    Idade Minima:
                </label>
                <input name="idadeMinima" id="idadeMinima" type="text" value="${(param.redirect != null && param["redirect"] eq "atualiza") ? grupo.idadeMinima: ''}">
            </div>

            <div>
                <label for="idadeMaxima">
                    Idade Máxima:
                </label>
                <input name="idadeMaxima" id="idadeMaxima" type="text" value="${(param.redirect != null && param["redirect"] eq "atualiza") ? grupo.idadeMaxima: ''}">
            </div>
            
            <input name="id" id="id" type="hidden" value="${(param.redirect != null && param["redirect"] eq "atualiza") ? grupo.id: ''}">
            <input type="hidden" name="${(param.redirect != null && param.redirect eq 'atualiza') ? 'atualizar' : ''}" value="1"/>
            
            <footer>
                <button id="submit-button" type="submit">
                    ${(param.redirect != null && param.redirect eq 'atualiza') ? 'Atulizar' : 'Cadastrar'}
                </button>
            </footer>
        </form>        
    </body>
</html>
