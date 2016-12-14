<%-- 
    Document   : ver_avaliacao_medico_comentario
    Created on : 06/12/2016, 22:53:47
    Author     : samue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="medico_comentario" class="medico.MedicoDO" scope="session"/>
<jsp:useBean id="medico" class="medico.Medico" scope="session"/>
<jsp:useBean id="lista_medico" class="database.DbCollection" scope="session"/>
<jsp:setProperty property="*" name="medico_comentario"/>
<link type="text/css" rel="Stylesheet" href="style1.css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comentario Medico</title>
    </head>
    <body>
     <h1>Clique <a href ="ver_avaliacao_medico.jsp "> aqui </a> para voltar. </h1>  
        
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
        <%lista_medico = medico.retornarComentariosValidados(medico_comentario.getNome());%>
        <%=medico_comentario.getNome()%>
        <% int b =lista_medico.size()- 1;
        while (b >=0) {%>
         <tr>
    <td> <%= lista_medico.getItem(b).getItem(3) %> </td>
        </tr> <% b--; }%>

    </body>
</html>
