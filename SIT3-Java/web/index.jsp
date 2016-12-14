<%-- 
    Document   : index
    Created on : Nov 9, 2016, 9:24:41 PM
    Author     : Gabriel e thiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="plano" class="planosdesaude.PlanoDeSaude" scope="session"/>
<jsp:useBean id="planoDO" class="planosdesaude.PlanoDeSaudeDO" scope="session"/>
<link type="text/css" rel="Stylesheet" href="style1.css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RescueWay</title>
    </head>
    <body>
        <h1><b>RescueWay</b> - <i>Rotas de Emergência e Consultas</i></h1>
       
        <% if ( request.getParameter("action") != null && request.getParameter("action").equals("logout")) {
            session.setAttribute("username", null);
            session.setAttribute("nome", null);
            session.setAttribute("privilegio", null);
            session.setAttribute("idPlano", null);
           }
           
        %>
        
        <% if (session.getAttribute("username") == null || session.getAttribute("username").equals("null")) { %>
        <h2> Você não está logado! Por favor, <a href = 'formulario_cadastro_usuario.jsp'>cadastre-se</a>, ou faça o login abaixo: </h2>
            
        
        <form method="post" action="login.jsp">
         <fieldset>
        
            Username:<br>

           <input type="text" name="username" required><br><br>

           Senha:<br>

           <input type="password" name="senha" required><br><br>
           
           <a href = 'esqueci_senha.jsp'>Esqueci minha senha</a><br>

           <br><input type="submit" value="Enviar">

       </fieldset>

       </form> 

        <h2> <a href = 'buscar_emergencia_semlogin.jsp'>Clique aqui</a> para buscar emergências sem ser cadastrado. </h2>

        <% } else { 
         
         planoDO = plano.selecionarPorId(String.valueOf(session.getAttribute("idPlano")));
        %> 
        <h3>Seja bem vindo, <%= session.getAttribute("nome") %>      (<a href='index.jsp?action=logout'> Logout </a>)</h3>
        <h3>Plano de saúde: <%= planoDO.getNome() %></h3>
        
        <% if (session.getAttribute("privilegio").equals("1")) {%> 
        
        <h4> Menu de administrador: </h4>
               
        <div>
            <hr style="height:2px; border:none; color:#000; background-color:#000; margin-top: 0px; margin-bottom: 0px;"/>
            <div>
                <a style="display: inline" href='formulario_cadastro_medico.jsp'>Cadastro Médico</a>
            </div>
            <div>
                <a style="display: inline" href='consulta_medicos.jsp'>Consulta Médicos</a>
            </div>
            <div>
                <a style="display: inline" href='formulario_cadastro_hospital.jsp'>Cadastro Hospitais</a>
            </div>
            <div>
                <a style="display: inline" href='consulta_hospitais.jsp'>Consulta Hospitais</a>
            </div>
            <div>
                <a style="display: inline" href='formulario_cadastro_planodesaude.jsp'>Cadastro Planos de Saúde</a>
            </div>
            <div>
                <a style="display: inline" href='consulta_planodesaude.jsp'>Consulta Planos de Saúde</a>
            </div>
            <div>
                <a style="display: inline" href='excluir_usuario.jsp'>Excluir Usuário</a>
            </div>
            <div>
                <a style="display: inline" href='alterar_senha.jsp'>Alterar Senha</a>
            </div>
            <div>
                <a style="display: inline" href='validar_comentario_hospital.jsp'>Validar comentario hospital</a>
            </div>
             <div>
                <a style="display: inline" href='validar_comentario_medico.jsp'>Validar comentario medico</a>
            </div>
            <div>
                <a style="display: inline" href='dar_privilegio.jsp'%>Alterar Privilégio de um usuário</a>
            </div>
            
        </div>    
        
        <% 
        } //menu administrador
        
        else { // menu usuario comum
            %>
                
                <div>
            <hr style="height:2px; border:none; color:#000; background-color:#000; margin-top: 0px; margin-bottom: 0px;"/>
            <div>
                <a style="display: inline" href='busca_emergencia.jsp'>Busca melhor emergência!</a>
            </div>
            <div>
                <a style="display: inline" href='marcar_consulta.jsp#'>Marcar Consulta</a>
            </div>
            <div>
                <a style="display: inline" href='desmarcar_consulta.jsp#'>Desmarcar Consultas</a>
            </div> 
            <div>
                <a style="display: inline" href='avaliacao_hospital.jsp#'>Avaliar Hospital</a>
            </div>
            <div>
                <a style="display: inline" href='ver_avaliacao_hospital.jsp#'>Ver comentarios dos hospitais</a>
            </div>
            <div>
                <a style="display: inline" href='avaliacao_medico.jsp#'>Avaliar Médico</a>
            </div>
            <div>
                <a style="display: inline" href='ver_avaliacao_medico.jsp#'>Ver comentarios dos médicos</a>
            </div>           
            <div>
                <a style="display: inline" href='alterar_senha.jsp'>Alterar Senha</a>
            </div>
            <div>
                <a style="display: inline" href='editar_usuario.jsp?username=<%=session.getAttribute("username")%>'>Editar Informações</a>
            </div>

            
        </div>    
            
            <%
            
        } // menu usuario comum
            
        } // logado%>
         <hr style="height:2px; border:none; color:#000; background-color:#000; margin-top: 0px; margin-bottom: 0px;"/>
            
         
        
    </body>
</html>
