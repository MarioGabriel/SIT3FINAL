/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package medico;
import database.*;

/**
 *
 * @author Thiago
 */
public class MedicoData {
    public void incluir(DbTransaction tr, MedicoDO med) throws Exception
    {
        String query = "INSERT INTO medico (nome,CRM,telefone,especialidade) VALUES ('" + med.getNome() + "','" + med.getCRM() + "','" + 
                med.getTelefone()+ "','" + med.getEspecialidade() +"')";
        tr.execute(query);
        
    }
    
    public String obterIdPorNome(DbTransaction tr, String nome) throws Exception
    {
        DbCollection results = new DbCollection();
        String query = "SELECT * FROM medico WHERE nome = '" + nome + "'";
        results = tr.query(query);
        if (results.size() > 0) {
            return results.getItem(0).getItem(0);
        }
        
        return "";
    }

    public DbCollection retornarTodosMedicos(DbTransaction tr) throws Exception { 
        DbCollection results = new DbCollection();
        String query = "SELECT * FROM medico";
        results = tr.query(query);
        return results;
    }
    
    public DbCollection retornarTodosHospitais(DbTransaction tr) throws Exception { 
        DbCollection results = new DbCollection();
        String query = "SELECT * FROM medico";
        results = tr.query(query);
        return results;
    }
            
    
     public MedicoDO selecionarPorId(DbTransaction tr, String id) throws Exception
    {
        DbCollection results = new DbCollection();
        String query = "SELECT * FROM medico WHERE id = " + id;
        results = tr.query(query);
        MedicoDO med = new MedicoDO();
        med.setNome(results.getItem(0).getItem(3));
        med.setCRM(results.getItem(0).getItem(1));
        med.setTelefone(results.getItem(0).getItem(4));
        med.setEspecialidade(results.getItem(0).getItem(2));
        
        return med;
    }
     
    public DbCollection retornarHospitaisAceitamPlano(DbTransaction tr, String pid) throws Exception {
         DbCollection results = new DbCollection();
        String query = "SELECT * FROM medico WHERE id IN (SELECT id_medico FROM medico_trabalha_em_hosp WHERE id_hospital = "+pid+")";
        results = tr.query(query);
        return results;
     }
    
    public DbCollection retornarAgendaMedico(DbTransaction tr, String pid) throws Exception {
        DbCollection results = new DbCollection();
        String query = "SELECT * FROM agenda_medicos WHERE id_medico = "+pid+" AND id_usuario = 0";
        results = tr.query(query);
        return results;
     }
    
    public void marcarConsulta(DbTransaction tr, String id_usuario, String id_consulta) throws Exception
    {
        String query = "UPDATE agenda_medicos SET id_usuario = "+id_usuario+" WHERE id_consulta = " +id_consulta+ "" ;
        tr.execute(query);
        
    }
    
    public void remover(DbTransaction tr, String id) throws Exception
    {
        String query = "DELETE FROM medico WHERE id = "+id;
        tr.execute(query);
    }
     
         public MedicoDO selecionarPorCRM(DbTransaction tr, String CRM) throws Exception
    {
        DbCollection results = new DbCollection();
        String query = "SELECT * FROM medico WHERE CRM = '" + CRM + "'";
        results = tr.query(query);
        MedicoDO medico = new MedicoDO();
        medico.setNome(results.getItem(0).getItem(3));
        medico.setCRM(results.getItem(0).getItem(1));
        medico.setTelefone(results.getItem(0).getItem(4));
        medico.setEspecialidade(results.getItem(0).getItem(2));
                
        return medico;
    }
    
        public void editar(DbTransaction tr, String id, String nome, String telefone, String CRM, String especialidade) throws Exception
    {
        String query = "UPDATE medico SET nome = '" + nome + "', telefone ='" + telefone + "', CRM = '"+ CRM + "', especialidade = '"+ especialidade + "' WHERE id = " + id;
        tr.execute(query);
    }
    public String PegaIdPorCRM(DbTransaction tr, String CRM) throws Exception{
        DbCollection results = new DbCollection();
        String query = "SELECT * FROM medico WHERE CRM = '" + CRM + "'";
        results = tr.query(query);
        String id;
        id = results.getItem(0).getItem(0);
        return id;
    }
     public void incluirComentario (DbTransaction tr, String medico, String comentario, String username) throws Exception
    {
        String query = "INSERT INTO `comentario_medico` (`medico`,`comentario`,`validado`,`username`) VALUES ('"+medico+"','"+comentario+"','0','"+username +"')";
        tr.execute(query);   
    }
    
    public DbCollection retornarComentariosMedico(DbTransaction tr, String nome) throws Exception {
         DbCollection results = new DbCollection();
        String query = "SELECT * FROM comentario_medico WHERE medico = '"+nome+"'" ;
        results = tr.query(query);
        return results;
     }
    public void removerComentario (DbTransaction tr, String id) throws Exception
    {
        String query = "DELETE FROM comentario_medico WHERE id_comentario = "+id;
        tr.execute(query);   
    }
    public void validarComentario (DbTransaction tr, String id) throws Exception
    {
        String query = "UPDATE comentario_medico SET validado = '1' WHERE id_comentario = "+id;
        tr.execute(query);   
    }
     public DbCollection retornarComentariosNaoValidados(DbTransaction tr) throws Exception {
         DbCollection results = new DbCollection();
        String query = "SELECT * FROM comentario_medico WHERE validado = '0'";
        results = tr.query(query);
        return results;
     }
     public void medicoTrabalhaHosp(DbTransaction tr, String id_med, String id_hosp) throws Exception
    {
        String query = "INSERT INTO `medico_trabalha_em_hosp` (`id_hospital`,`id_medico`) VALUES ('"+id_hosp+"','"+id_med+"')";
        tr.execute(query);   
    }
     public void editarMedicoTrabalhaHosp(DbTransaction tr, String id_med, String id_hosp) throws Exception
    {
        String query = "UPDATE medico_trabalha_em_hosp SET id_hospital = '"+id_hosp+"' WHERE id_medico =" + id_med;
        tr.execute(query);   
    }
     public DbCollection obterHospPorId(DbTransaction tr, String id_med) throws Exception
    {
        DbCollection results = new DbCollection();
        String query = "SELECT * FROM medico_trabalha_em_hosp WHERE id_medico ='"+id_med+"'";
        results = tr.query(query);   
        return results;
    }
     public DbCollection retornarComentariosValidados(DbTransaction tr, String nome) throws Exception {
         DbCollection results = new DbCollection();
        String query = "SELECT * FROM comentario_medico WHERE validado = '1' AND medico ='"+nome+"'";
        results = tr.query(query);
        return results;
     }
   
    
}
