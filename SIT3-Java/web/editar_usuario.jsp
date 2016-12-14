<%-- 
    Document   : editar_usuario
    Created on : 06/12/2016, 17:15:04
    Author     : leo
--%>
<jsp:useBean id="usuario" class="usuario.Usuario"></jsp:useBean> 
<jsp:useBean id="usuarioDO" class="usuario.UsuarioDO"></jsp:useBean> 
<jsp:useBean id="plano" class="planosdesaude.PlanoDeSaude"></jsp:useBean> 
<jsp:useBean id="planoDO" class="planosdesaude.PlanoDeSaudeDO"></jsp:useBean> 
<link type="text/css" rel="Stylesheet" href="style1.css"/>


<% 
    if(request.getParameter("username")!= null){
    usuarioDO = usuario.selecionarPorUsername(request.getParameter("username"));

    }

    planoDO = plano.selecionarPorId(usuarioDO.getIdPlano());
    String Def;
    if(usuarioDO.getPortadorDeDeficiencia().equals("1")){
        Def = "Sim" ;
            } else {
        Def = "Nao";
    }
%>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Editar Usuario</h1> <br>
        <h3>Infos do Usuario:</h3> <br>
        <h3>Nome : <%=usuarioDO.getNome()%> </h3> 
        <h3>Tel : <%=usuarioDO.getTelefone()%> </h3> 
        <h3>Endereco : <%=usuarioDO.getEndereco()%> </h3> 
        <h3>Data de Nascimento : <%=usuarioDO.getDataDeNascimento()%> </h3> 
        <h3>Plano : <%=planoDO.getNome()%> </h3>
        <h3>Portador de deficiencia : <%=Def%> </h3> 
        <h3>Username : <%=usuarioDO.getUsername()%> </h3>
       
        
        
        <form method="post" action="confirmacao_edicao_usuario.jsp?username=<%=request.getParameter("username")%>&action=edit">
     <fieldset>
       <legend>Alterar:</legend>
       
       <br>Nome :<br>
       <input type="text" name="nome" size = 45 maxlength = 45><br><br>
       
       <br>Tel :<br>
       <input type="text" name="telefone" size = 45 maxlength = 45><br><br>
       
       <br>Plano de Saude :<br>
       <%= plano.retornaSelectDePlanos() %>
       <br><br>
       
       <br>Data de Nascimento:<br>
       <input type="date" name="dataDeNascimento" ><br><br>
       
       <br>Portador de Deficiencia? <br>
       <input type="radio" name="portadorDeDeficiencia" value="1" required> Sim<br>

       <input type="radio" name="portadorDeDeficiencia" value="0" required> N&atilde;o<br><br>
       
       <br>Endereco :<br>
       <input type="text" name="endereco" size = 45 maxlength = 45 ><br><br>
       
       <br><input type="submit" value="Continuar">
     </fieldset>
     </form> 
        
    </body>
</html>

