<%-- 
    Document   : ver_avaliacao_hospital_comentario
    Created on : 06/12/2016, 20:15:05
    Author     : samue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="hospital_comentario" class="hospitais.HospitalDO" scope="session"/>
<jsp:useBean id="hospital" class="hospitais.Hospital" scope="session"/>
<jsp:useBean id="lista_hospitais" class="database.DbCollection" scope="session"/>
<jsp:setProperty property="*" name="hospital_comentario"/> 
<link type="text/css" rel="Stylesheet" href="style1.css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
     <h1>Clique <a href ="ver_avaliacao_hospital.jsp "> aqui </a> para voltar. </h1>  
        
    <style>
    table {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }

    td, th {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }

    tr:nth-child(even) {
        background-color: #dddddd;
    }
    </style>  
    <table>
     <tr>
       <th>Comentarios</th>

     </tr>
        <%lista_hospitais = hospital.retornarComentariosValidados(hospital_comentario.getNome());%>
        <%=hospital_comentario.getNome()%>
        <% int b =lista_hospitais.size()- 1;
        while (b >=0) {%>
         <tr>
             <td>Enviado por<%= lista_hospitais.getItem(b).getItem(1)%> : <br> 
                 <%= lista_hospitais.getItem(b).getItem(3) %>  <br>
             </td>
        </tr> <% b--; }%>

    </body>
</html>
