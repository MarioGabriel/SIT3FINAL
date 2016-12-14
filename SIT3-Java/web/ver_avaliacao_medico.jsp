<%-- 
    Document   : ver_avaliacao_medico
    Created on : 06/12/2016, 22:50:13
    Author     : samue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="medico" class="medico.Medico" scope="session"/>
<jsp:useBean id="medico_comentario" class="medico.MedicoDO" scope="session"/>
<jsp:useBean id="lista_medico" class="database.DbCollection" scope="session"/>
<jsp:useBean id="hospitalDO" class="hospitais.HospitalDO" scope="session"/>
<jsp:useBean id="lista_hospitais" class="database.DbCollection" scope="session"/>
<jsp:useBean id="hospital" class="hospitais.Hospital" scope="session"/>
<jsp:useBean id="hospital_comentario" class="hospitais.HospitalDO" scope="session"/>
<link type="text/css" rel="Stylesheet" href="style1.css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comentarios dos Medicos</title>
    </head>
    <body>
        <h1>Clique <a href ="index.jsp "> aqui </a> para voltar. </h1>  
         <%  int b = 0;
            String idPlano = (String)session.getAttribute("idPlano");
            lista_hospitais = hospital.retornarHospitaisAceitamPlano(idPlano);
           %>
           
           <%
                int i =0;
                int j =0;
                int w =0;
                if (lista_hospitais.size() == 0){
                    %>
                    <h3>Infelizmente, nenhum hospital cadastrado no sistema aceita seu plano de saúde!</h3>
                    <%
                }
                while (i < lista_hospitais.size()){
                    %>
                    <h3>
                        
                        <a href='ver_avaliacao_medico.jsp?hospid=<%=lista_hospitais.getItem(i).getItem(0)%>'><%=lista_hospitais.getItem(i).getItem(1)%> </a>
    
                    </h3>
                    <%
                    i++;
                }
        
        %>
        
                      <%
          if (request.getParameter("hospid") != null) {
          lista_medico = medico.retornarHospitaisAceitamPlano(request.getParameter("hospid"));
      %>
           <form method="post" action="ver_avaliacao_medico_comentario.jsp">  
        <h2>Hospitais disponíveis para visualizar comentarios</h2>
        
        <%while (w < lista_medico.size()){%>
        
        <input type="radio" name="nome" value="<%=lista_medico.getItem(w).getItem(3)%>"><%= lista_medico.getItem(w).getItem(3) %><br></option>
   
        <% w++;} }%>
        
        <br><br><input type="submit" value="Ver comentarios">
           </form>
    </body>
</html>
