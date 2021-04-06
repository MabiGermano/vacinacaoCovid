<%-- 
    Document   : cadastroDeVacina
    Created on : 3 de mar de 2021, 23:51:27
    Author     : maria.santos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vacina</title>
    </head>
    <body>
        <h1>${(param.redirect != null && param.redirect eq 'atualiza') ? 'Alteração' : 'Cadastro'} de vacina</h1>

        <form method="post" action="VacinaServlet">
            <div>
                <label for="nome">
                    Nome:
                </label>
                <input name="nome" id="nome" type="text" value="${(param.redirect != null && param["redirect"] eq "atualiza") ? profissional.nome: ''}">
            </div>

            <div>
                <label for="fabricante">
                    Fabricante:
                </label>
                <input name="fabricante" id="fabricante" type="text" value="${(param.redirect != null && param["redirect"] eq "atualiza") ? profissional.fabricante: ''}">
            </div>

            <div>
                <label for="tempoEntreAplicacoes">
                    Tempo entre aplicações:
                </label>
                <input name="tempoEntreAplicacoes" id="tempoEntreAplicacoes" type="text" value="${(param.redirect != null && param["redirect"] eq "atualiza") ? profissional.tempoEntreAplicacoes: ''}">
            </div>
            
            <div>
                <label for="quantidadeAplicacoes">
                    Quantidade de aplicações:
                </label>
                <input name="quantidadeAplicacoes" id="quantidadeAplicacoes" type="text" value="${(param.redirect != null && param["redirect"] eq "atualiza") ? profissional.quantidadeAplicacoes: ''}">
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
