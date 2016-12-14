<%-- 
    Document   : avaliacao_hospital
    Created on : 06/12/2016, 18:02:03
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
        <title>JSP Page</title>
    </head>
    <body>
        <%  int b = 0;
            String idPlano = (String)session.getAttribute("idPlano");
           lista_hospitais = hospital.retornarHospitaisAceitamPlano(idPlano);
           %>
        <h2>Hospitais Disponíveis para seu Plano</h2>
        <form method="post" action="confirmacao_avaliacao_hospital.jsp">
            <h2>Hospitais Disponíveis</h2>
        <%while (b < lista_hospitais.size()){%>
        <input type="radio" name="nome" value="<%=lista_hospitais.getItem(b).getItem(1)%>"><%= lista_hospitais.getItem(b).getItem(1) %><br></option>
        <% b++;} %>
        <br>
        <br>
        <input type="text" name="comentario" rows="10" cols="30">
        <br><br><input type="submit" value="Enviar">
        </form>
        <br><a href="index.jsp">Retornar a pagina anterior</a><br>
    </body>
</html>
