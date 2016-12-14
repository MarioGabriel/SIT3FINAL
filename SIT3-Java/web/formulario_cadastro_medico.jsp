<%-- 
    Document   : formulario_cadastro_medico
    Created on : Nov 23, 2016, 6:44:32 PM
    Author     : thiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link type="text/css" rel="Stylesheet" href="style1.css"/>
<jsp:useBean id="hospital" class="hospitais.Hospital" scope="session"/>
<!DOCTYPE html>
<html>
<body>

<h1>Cadastro de M&eacute;dico</h1>

 <form method="post" action="confirmacao_cadastro_medico.jsp">
  <fieldset>
    <legend>Dados do m&eacute;dico:</legend>
    <br>Nome do m&eacute;dico:<br>
    <input type="text" name="nome"><br><br>
    Especialidade:<br>
    <input type="text" name="especialidade"><br><br>
    Telefone:<br>
    <input type="text" name="telefone"><br><br>
    CRM:<br>
    <input type="number" name="CRM"  min="1000" max="9999999999">
    <br><br>
    Hospital: <br>
    <%= hospital.retornaSelectDeHospitais() %>
           <br>
    <br><input type="submit" value="Enviar">
  </fieldset>
</form> 

</body>
</html>