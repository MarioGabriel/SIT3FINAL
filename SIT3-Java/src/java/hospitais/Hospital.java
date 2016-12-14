/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hospitais;

import database.*;


/**
 *
 * @author Gabriel
 */
public class Hospital {
    
    public boolean incluir(HospitalDO hosp) throws Exception 
    {
        try {
            DbTransaction tr = new DbTransaction();
            HospitalData hospData = new HospitalData();
            hospData.incluir(tr, hosp);
            return true;
        }
        catch (Exception e) {
            System.out.println("Erro na inclusao de hospital.");
        }
        
        return false; // caso algo deu errado
    }
    
    public HospitalDO selecionarPorId(String id) throws Exception
    {
        try {
            DbTransaction tr = new DbTransaction();
            HospitalDO hospDO;
            HospitalData hospData = new HospitalData();
            hospDO = hospData.selecionarPorId(tr, id);
            return hospDO;
        }
        catch (Exception e) {
            System.out.println("Erro na recuperacao de hospital por ID.");
        }
        
        return null; // caso algo deu errado
    }
    
     public String obterIdPorNome(String nome) throws Exception
    {
        String id;
        
        try {
            DbTransaction tr = new DbTransaction();
            HospitalDO hospDO;
            HospitalData hospData = new HospitalData();
            id = hospData.obterIdPorNome(tr, nome);
            return id;
        }
        catch (Exception e) {
            System.out.println("Erro na recuperacao de hospital por nome.");
        }
        
        return null; // caso algo deu errado
    }
     
     public DbCollection retornarHospitaisAceitamPlano(String pid) throws Exception
    {
        try {
            DbTransaction tr = new DbTransaction();
            DbCollection results;
            HospitalData hospData = new HospitalData();
            results = hospData.retornarHospitaisAceitamPlano(tr, pid);
            return results;
        }
        catch (Exception e) {
            System.out.println("Erro na recuperacao de hospitais que aceitam  certo plano");
        }
        
        return null; // caso algo deu errado
    }
     public DbCollection retornarHospitaisNaoAceitamPlano(String pid) throws Exception
    {
        try {
            DbTransaction tr = new DbTransaction();
            DbCollection results;
            HospitalData hospData = new HospitalData();
            results = hospData.retornarHospitaisNaoAceitamPlano(tr, pid);
            return results;
        }
        catch (Exception e) {
            System.out.println("Erro na recuperacao de hospitais que aceitam  certo plano");
        }
        
        return null; // caso algo deu errado
    } 
    
    public DbCollection retornarHospitaisComMedicos(String pid) throws Exception
    {
        try {
            DbTransaction tr = new DbTransaction();
            DbCollection results;
            HospitalData hospData = new HospitalData();
            results = hospData.retornarHospitaisComMedicos(tr, pid);
            return results;
        }
        catch (Exception e) {
            System.out.println("Erro na recuperacao de hospitais que aceitam  certo plano");
        }
        
        return null; // caso algo deu errado
    }
     
    public DbCollection retornarTodosHospitais() throws Exception { 
         try {
            DbTransaction tr = new DbTransaction();
            DbCollection results;
            HospitalData hospData = new HospitalData();
            results = hospData.retornarTodosHospitais(tr);
            return results;
        }
        catch (Exception e) {
            System.out.println("Erro na recuperacao de todos os hospitais");
        }
        
        return null; // caso algo deu errado
     }
     
     public boolean remover(String id) throws Exception {
          try {
            DbTransaction tr = new DbTransaction();
            HospitalData hospData = new HospitalData();
            hospData.remover(tr, id);
            return true;
        }
        catch (Exception e) {
            System.out.println("Erro na remocao de hospital.");
        }
        
        return false; // caso algo deu errado
     }
     public boolean incluirComentario(String hospital,String comentario, String username) throws Exception {
          try {
            DbTransaction tr = new DbTransaction();
            HospitalData hospData = new HospitalData();
            hospData.incluirComentario(tr, hospital, comentario, username);
            return true;
        }
        catch (Exception e) {
            System.out.println("Erro na inclusão do comentário");
        }
        
        return false; // caso algo deu errado
     }
     
     public DbCollection retornarComentariosHospital(String nome) throws Exception { 
         try {
            DbTransaction tr = new DbTransaction();
            DbCollection results;
            HospitalData hospData = new HospitalData();
            results = hospData.retornarComentariosHospital(tr, nome);
            return results;
        }
        catch (Exception e) {
            System.out.println("Erro na recuperacao de todos os hospitais");
        }
        
        return null; // caso algo deu errado
     }
     public boolean removerComentario(String id) throws Exception { 
         try {
            DbTransaction tr = new DbTransaction();
            HospitalData hospData = new HospitalData();
            hospData.removerComentario(tr, id);
            return true;
        }
        catch (Exception e) {
            System.out.println("Erro na recuperacao de todos os hospitais");
        }
        
        return false; // caso algo deu errado
     }
     public boolean validarComentario(String id) throws Exception { 
         try {
            DbTransaction tr = new DbTransaction();
            HospitalData hospData = new HospitalData();
            hospData.validarComentario(tr, id);
            return true;
        }
        catch (Exception e) {
            System.out.println("Erro na recuperacao de todos os hospitais");
        }
        
        return false; // caso algo deu errado
     }
     public DbCollection retornarComentariosNaoValidados() throws Exception { 
         try {
            DbTransaction tr = new DbTransaction();
            DbCollection results;
            HospitalData hospData = new HospitalData();
            results = hospData.retornarComentariosNaoValidados(tr);
            return results;
        }
        catch (Exception e) {
            System.out.println("Erro na recuperacao de todos os hospitais");
        }
        
        return null; // caso algo deu errado
     }
     public DbCollection retornarComentariosValidados(String nome) throws Exception { 
         try {
            DbTransaction tr = new DbTransaction();
            DbCollection results;
            HospitalData hospData = new HospitalData();
            results = hospData.retornarComentariosValidados(tr,nome);
            return results;
        }
        catch (Exception e) {
            System.out.println("Erro na recuperacao de todos os hospitais");
        }
        
        return null; // caso algo deu errado
     }
       public boolean editar(String hid, String nome, String telefone, String endereco) throws Exception {
           try {
                DbTransaction tr = new DbTransaction();
                HospitalData hospData = new HospitalData();
                hospData.editar(tr, hid, nome, telefone, endereco);
                return true;
            }
            catch (Exception e) {
                System.out.println("Erro na inclusao de relacao plano-hospital");
            }

            return false; // caso algo deu erradoplanoDO = plano.selecionarPorId(request.getParameter("planoid"
        }
    public String retornaSelectDeHospitais() throws Exception 
    // Essa funcao retorna um select em html preenchido com todos os planos de saude
    {
       try {
            DbTransaction tr = new DbTransaction();
            DbCollection lista_hosp;
            HospitalData hospData = new HospitalData();
            lista_hosp = hospData.retornarTodosHospitais(tr);
            
            String s = "<select id=\"idHosp\" name=\"idHosp\">" +
                     "<option disabled selected value> -- selecione -- </option>";

             int i = 0;

            while (i < lista_hosp.size())
            {
                s = s + "<option value=\""+
                        lista_hosp.getItem(i).getItem(0)+
                        "\">"+
                        lista_hosp.getItem(i).getItem(1)+
                        "</option>";     
                i++;

            }
            s = s + "</select>";
            return s;
            
        
        }
        catch (Exception e) {
            System.out.println("Erro recuperando planos de saude.");
        }
        
        return "ERRO!"; // caso algo deu errado
        
              
    }
}
