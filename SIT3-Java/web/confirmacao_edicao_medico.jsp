<%-- 
    Document   : confirmação_edicao_medico
    Created on : Dec 6, 2016, 7:37:05 PM
    Author     : Pedro
--%>

<jsp:useBean id="medico" class="medico.Medico"></jsp:useBean> 
<jsp:useBean id="medicoPost" class="medico.MedicoDO"></jsp:useBean> 
<jsp:useBean id="medicoAntigo" class="medico.MedicoDO"></jsp:useBean> 
<jsp:useBean id="medicoNovo" class="medico.MedicoDO"></jsp:useBean> 
<jsp:setProperty property="*" name="medicoPost"/> 
<link type="text/css" rel="Stylesheet" href="style1.css"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
        
        medicoAntigo = medico.selecionarPorId(request.getParameter("medid"));
        String id;
        id = medico.PegaIdPorCRM(medicoAntigo.getCRM());
        
        if(medicoPost.getNome()== null){
            medicoNovo.setNome(medicoAntigo.getNome());
        } else {
            medicoNovo.setNome(medicoPost.getNome());
            
        }
        
        
        if(medicoPost.getTelefone()== null){
            medicoNovo.setTelefone(medicoAntigo.getTelefone());
        } else {
            medicoNovo.setTelefone(medicoPost.getTelefone());
            
        }
        
        
        if(medicoPost.getCRM()== null){
            medicoNovo.setCRM(medicoAntigo.getCRM());
        } else {
            medicoNovo.setCRM(medicoPost.getCRM());
            
        }
            
        
        if(medicoPost.getEspecialidade()== null){
            medicoNovo.setEspecialidade(medicoAntigo.getEspecialidade());
        } else {
            medicoNovo.setEspecialidade(medicoPost.getEspecialidade());
            
        }
            
            
            
        if(request.getParameter("action")!=null && request.getParameter("action").equals("edit")){
        medico.editar(id,medicoNovo.getNome(),medicoNovo.getTelefone(),medicoNovo.getCRM(),medicoNovo.getEspecialidade());
        medico.editarMedicoTrabalhaHosp(id, medicoPost.getIdHosp());
        }
        %>
        <h1>Edicao realizada com sucesso!</h1>
  
    
        <hr style="height:2px; border:none; color:#000; background-color:#000; margin-top: 0px; margin-bottom: 0px;"/>
        <h3><a href="index.jsp">Retornar a pagina inicial</a></h3>
    
    </body>
</html>