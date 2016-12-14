<%-- 
    Document   : confirmacao_avaliacao_medico
    Created on : 06/12/2016, 22:35:28
    Author     : samue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link type="text/css" rel="Stylesheet" href="style1.css"/>
<jsp:useBean id="medico_comentario" class="medico.MedicoDO" scope="session"/>
<jsp:useBean id="medicos" class="medico.Medico" scope="session"/>
<jsp:setProperty property="*" name="medico_comentario"/> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Avaliacao do Médico</title>
    </head>
    <body>
        <h1>Seu comentario foi incluido com sucesso! <a href ="index.jsp "> <br> Clique aqui </a> para voltar. </h1>
        <% 
            String username = (String)session.getAttribute("username");
            medicos.incluirComentario(medico_comentario.getNome(), medico_comentario.getComentario(),username);
        %>
        
    </body>
</html>
