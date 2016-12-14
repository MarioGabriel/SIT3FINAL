<%-- 
    Document   : avaliacao_medico
    Created on : 06/12/2016, 21:00:00
    Author     : samue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link type="text/css" rel="Stylesheet" href="style1.css"/>
<jsp:useBean id="medico" class="medico.Medico" scope="session"/>
<jsp:useBean id="medico_comentario" class="medico.MedicoDO" scope="session"/>
<jsp:useBean id="lista_medicos" class="database.DbCollection" scope="session"/>
<jsp:useBean id="hospitalDO" class="hospitais.HospitalDO" scope="session"/>
<jsp:useBean id="lista_hospitais" class="database.DbCollection" scope="session"/>
<jsp:useBean id="hospital" class="hospitais.Hospital" scope="session"/>
<jsp:useBean id="hospital_comentario" class="hospitais.HospitalDO" scope="session"/>
<jsp:setProperty property="*" name="medico_comentario"/> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Selecione o Hospital para avaliar um medico: </h1>  
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
                        
                        <a href='avaliacao_medico.jsp?hospid=<%=lista_hospitais.getItem(i).getItem(0)%>'><%=lista_hospitais.getItem(i).getItem(1)%> </a>
    
                    </h3>
                    <%
                    i++;
                }
        
        %>
        
                      <%
          if (request.getParameter("hospid") != null) {
          lista_medicos = medico.retornarHospitaisAceitamPlano(request.getParameter("hospid"));
      %>

        <h2>Medicos Disponíveis para avaliação:</h2>

        <form method="post" action="confirmacao_avaliacao_medico.jsp">
        <%while (w < lista_medicos.size()){%>
        <input type="radio" name="nome" value="<%=lista_medicos.getItem(w).getItem(3)%>"><%= lista_medicos.getItem(w).getItem(3) %><br></option>
        <% w++;}} %>
        <br>
        <br>
        <input type="text" name="comentario" rows="10" cols="30">
        <br><br><input type="submit" value="Enviar">
        </form>
        
        
        <br><a href="index.jsp">Retornar a pagina anterior</a><br>
    </body>
</html>
