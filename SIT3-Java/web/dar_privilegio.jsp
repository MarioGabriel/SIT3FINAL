<%-- 
    Document   : dar_privilegio
    Created on : Dec 14, 2016, 8:23:00 PM
    Author     : Mario
--%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"%>
<link type="text/css" rel="Stylesheet" href="style1.css"/>
<jsp:useBean id="usuario" class="usuario.Usuario"></jsp:useBean> 
<jsp:useBean id="usuarioDO" class="usuario.UsuarioDO"></jsp:useBean> 
<jsp:useBean id="lista_usuario" class="database.DbCollection"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1>Dar Privilegio a um Usuario</h1>
        <hr style="height:2px; border:none; color:#000; background-color:#000; margin-top: 0px; margin-bottom: 0px;"/>
        
        <%
            if (session.getAttribute("privilegio") == null || !session.getAttribute("privilegio").equals("1")) {
        %>

        <script>
            alert("Você não tem permissão para acessar essa página!");
            window.location.replace("index.jsp");
        </script>
   
    <% 
       }
       
       if (request.getParameter("action") != null && request.getParameter("action").equals("darprivilegio")){
           usuario.darPrivilegio(request.getParameter("username"));
       }
            
       lista_usuario = usuario.retornarTodosUsuarios();
       int i = 0;
       while (i < lista_usuario.size()) {
            String tipoUsuario = "";
            if (lista_usuario.getItem(i).getItem(5).equals("1")){
                tipoUsuario = "Administrador";
            }
            else{
                tipoUsuario = "Usuário Comum";
            }
           %>
           <h3><%= "Nome: "+lista_usuario.getItem(i).getItem(1)%> - <%= "Username: "+lista_usuario.getItem(i).getItem(9)%> - <%= "Tipo do Usuário: "+tipoUsuario %> - 
               <a href="dar_privilegio.jsp?action=darprivilegio&username=<%=lista_usuario.getItem(i).getItem(9)%>">[Alterar Privilégio]</a></h3>
           <%
           i++;
       }
    %>
        
        <hr style="height:2px; border:none; color:#000; background-color:#000; margin-top: 0px; margin-bottom: 0px;"/>
        <h3><a href="index.jsp">Voltar</a></h3>
    </body>
    
</html>