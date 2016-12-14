<%-- 
    Document   : validar_comentario_medico
    Created on : Dec 14, 2016, 5:30:00 PM
    Author     : mario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="medico_comentario" class="medico.MedicoDO" scope="session"/>
<jsp:useBean id="medico" class="medico.Medico" scope="session"/>
<link type="text/css" rel="Stylesheet" href="style1.css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1></h1>
        <a href=index.jsp>Retornar ao menu principal </a>
        <% if(request.getParameter("action")!=null && request.getParameter("action").equals("remover")){
            medico.removerComentario(request.getParameter("idcomentario"));
            %>
            <h3>O comentario foi removido com sucesso! <br></h3>
            <a href=validar_comentario_medico.jsp>Retornar a pagina anterior </a>
            <%

        } else if(request.getParameter("action")!=null && request.getParameter("action").equals("validar")){
            medico.validarComentario(request.getParameter("idcomentario"));
            %>
            <h3>O comentario foi validado com sucesso! <br></h3>
            <a href=validar_comentario_medico.jsp>Retornar a pagina anterior </a>
            <%
            
            
        }
        
        
        
        
        
        %>
    </body>
</html>
