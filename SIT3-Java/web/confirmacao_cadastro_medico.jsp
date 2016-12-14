<%-- 
    Document   : confirmacao_cadastro_medico
    Created on : Nov 23, 2016, 6:43:12 PM
    Author     : Thiago
--%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"%>
<link type="text/css" rel="Stylesheet" href="style1.css"/>

<jsp:useBean id="medico" class="medico.Medico"></jsp:useBean> 
<jsp:useBean id="medicoDO" class="medico.MedicoDO"></jsp:useBean> 
<jsp:useBean id="medicoCadastro" class="medico.MedicoDO"></jsp:useBean> 
<jsp:setProperty property="*" name="medicoDO"/> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            medico.incluir(medicoDO);
            medico.MedicoTrabalhaHosp(medico.obterIdPorNome(medicoDO.getNome()), medicoDO.getIdHosp());
        
        
        %>
        <h1>O m�dico <%= medicoDO.getNome() %> foi cadastrado com sucesso!</h1> <br>
        <h1><a href="index.jsp"> Voltar </a></h1> <br>
    </body>
</html>
