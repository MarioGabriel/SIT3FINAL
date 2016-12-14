<%-- 
    Document   : login
    Created on : Dec 4, 2016, 5:17:00 PM
    Author     : mario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link type="text/css" rel="Stylesheet" href="style1.css"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Senha</title>
    </head>
    <body>
        
    <form method="post" action="confirmacao_alteracao_senha.jsp">
     <fieldset>
       <legend>Dados:</legend>
       <br>Nome de Usuário:<br>
       <input type="text" name="username" required><br><br>
       <br>Senha antiga:<br>
       <input type="password" name="senha" required><br><br>
       <br>Senha nova:<br>
       <input type="password" name="senhaNova" required><br><br>
       
       <br><input type="submit" value="Continuar">
     </fieldset>
   </form> 
        <hr style="height:2px; border:none; color:#000; background-color:#000; margin-top: 0px; margin-bottom: 0px;"/>
         <h3><a href="index.jsp">Voltar</a></h3>
    </body>
</html>