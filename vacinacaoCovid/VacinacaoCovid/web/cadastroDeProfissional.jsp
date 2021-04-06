<%-- 
    Document   : cadastroProfissional
    Created on : 3 de mar de 2021, 22:33:15
    Author     : maria.santos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profisional</title>
    </head>
    <body>
        <h1>${(param.redirect != null && param.redirect eq 'atualiza') ? 'Alteração' : 'Cadastro'} de profissional</h1>

        <form method="post" action="ProfissionalEnfermagemServlet">
            <div>
                <label for="nome">
                    Nome:
                </label>
                <input name="nome" id="nome" type="text" value="${(param.redirect != null && param["redirect"] eq "atualiza") ? profissional.nome: ''}">
            </div>

            <div>
                <label for="coren">
                    Coren:
                </label>
                <input name="coren" id="coren" type="text" value="${(param.redirect != null && param["redirect"] eq "atualiza") ? profissional.coren: ''}">
            </div>

            <div>
                <label for="anoFormacao">
                    Ano de formação:
                </label>
                <input name="anoFormacao" id="anoFormacao" type="text" value="${(param.redirect != null && param["redirect"] eq "atualiza") ? profissional.anoFormacaoa: ''}">
            </div>
            
            <div>
                <label for="contato">
                    Contato:
                </label>
                <input name="contato" id="contato" type="text" value="${(param.redirect != null && param["redirect"] eq "atualiza") ? profissional.Contato: ''}">
            </div>
            
            
            <input name="id" id="id" type="hidden" value="${(param.redirect != null && param["redirect"] eq "atualiza") ? profissional.id: ''}">
            <input type="hidden" name="${(param.redirect != null && param.redirect eq 'atualiza') ? 'atualizar' : ''}" value="1"/>
            
            <footer>
                <button id="submit-button" type="submit">
                    ${(param.redirect != null && param.redirect eq 'atualiza') ? 'Atulizar' : 'Cadastrar'}
                </button>
            </footer>
        </form>        
    </body>
</html>
