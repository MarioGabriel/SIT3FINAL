<%-- 
    Document   : confirmacao_avaliacao_hospital
    Created on : 06/12/2016, 18:54:41
    Author     : samue
--%>
<link type="text/css" rel="Stylesheet" href="style1.css"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="hospital_comentario" class="hospitais.HospitalDO" scope="session"/>
<jsp:useBean id="hospital" class="hospitais.Hospital" scope="session"/>
<jsp:setProperty property="*" name="hospital_comentario"/> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Avaliacao de hospital</title>
    </head>
    <body>
        <h1>Seu comentario foi enviado para avaliação! <a href ="index.jsp "> <br> Clique aqui </a> para voltar. </h1>
                <% 
                    
                    String username = (String)session.getAttribute("username");
                    
                    
                    hospital.incluirComentario(hospital_comentario.getNome(), hospital_comentario.getComentario(),username);%>
        
    </body>
</html>
