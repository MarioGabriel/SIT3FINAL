<%-- 
    Document   : validar_comentario_medico
    Created on : Dec 14, 2016, 5:37:34 PM
    Author     : mario
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="medico_comentario" class="medico.MedicoDO" scope="session"/>
<jsp:useBean id="medico" class="medico.Medico" scope="session"/>
<jsp:useBean id="lista_medicos" class="database.DbCollection" scope="session"/>
<jsp:setProperty property="*" name="medico_comentario"/> 
<link type="text/css" rel="Stylesheet" href="style1.css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
     <h1>Clique <a href ="index.jsp "> aqui </a> para voltar. </h1>  
        
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
       <% lista_medicos = medico.retornarComentariosNaoValidados() ;%>
       <th>Comentarios a serem validados</th>
     </tr>
        <%
        int b = 0;
        while (b < lista_medicos.size()) {%>
        <tr>
             <td>Enviado por <%= lista_medicos.getItem(b).getItem(1)%> para <%= lista_medicos.getItem(b).getItem(2) %>  : <br> 
                 <%= lista_medicos.getItem(b).getItem(3) %>  <br>
                 <a href="confirmacao_validacao_comentario_medico.jsp?action=remover&idcomentario=<%=lista_medicos.getItem(b).getItem(0)%>">[Excluir]</a> |
                 <a href="confirmacao_validacao_comentario_medico.jsp?action=validar&idcomentario=<%=lista_medicos.getItem(b).getItem(0)%>">[Validar]</a>
             </td>    
        </tr> <% b++; }%>
        </form>
    </body>
</html>
 