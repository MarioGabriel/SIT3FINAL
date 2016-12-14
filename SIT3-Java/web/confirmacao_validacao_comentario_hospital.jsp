<%-- 
    Document   : confirmacao_validacao_comentario
    Created on : Dec 14, 2016, 4:15:08 PM
    Author     : mario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="hospital_comentario" class="hospitais.HospitalDO" scope="session"/>
<jsp:useBean id="hospital" class="hospitais.Hospital" scope="session"/>
<link type="text/css" rel="Stylesheet" href="style1.css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1></h1>
        <h3>O comentario foi validado com sucesso! <br></h3>
        <a href=index.jsp>Retornar ao menu principal </a>
        <% if(request.getParameter("action")!=null && request.getParameter("action").equals("remover")){
            hospital.removerComentario(request.getParameter("idcomentario"));
            %>
            <h3>O comentario foi removido com sucesso! <br></h3>
            <a href=validar_comentario.jsp>Retornar a pagina anterior </a>
            <%

        } else if(request.getParameter("action")!=null && request.getParameter("action").equals("validar")){
            hospital.validarComentario(request.getParameter("idcomentario"));
            %>
            <h3>O comentario foi validado com sucesso! <br></h3>
            <a href=validar_comentario_hospital.jsp>Retornar a pagina anterior </a>
            <%
            
            
        }
        
        
        
        
        
        %>
    </body>
</html>
