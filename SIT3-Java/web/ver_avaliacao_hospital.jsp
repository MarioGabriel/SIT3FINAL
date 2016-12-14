<%--
    Document   : ver_avaliacao_hospital
    Created on : 06/12/2016, 19:52:37
    Author     : samue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="hospital" class="hospitais.Hospital" scope="session"/>
<jsp:useBean id="hospital_comentario" class="hospitais.HospitalDO" scope="session"/>
<jsp:useBean id="lista_hospitais" class="database.DbCollection" scope="session"/>
<link type="text/css" rel="Stylesheet" href="style1.css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comentarios dos Hospitais</title>
    </head>
    <body>
        <h1>Clique <a href ="index.jsp "> aqui </a> para voltar. </h1>  
        <%  int b = 0;
            String idPlano = (String)session.getAttribute("idPlano");
           lista_hospitais = hospital.retornarHospitaisAceitamPlano(idPlano);
           %>
           <form method="post" action="ver_avaliacao_hospital_comentario.jsp">  
        <h2>Hospitais disponíveis para visualizar comentarios</h2>
        <%while (b < lista_hospitais.size()){%>
        <input type="radio" name="nome" value="<%=lista_hospitais.getItem(b).getItem(1)%>"><%= lista_hospitais.getItem(b).getItem(1) %><br></option>
        <% b++;} %>
        <br><br><input type="submit" value="Ver comentarios">
           </form>
    </body>
</html>
