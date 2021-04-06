/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.recife.edu.ifpe.model.controller.servlets;

import br.recife.edu.ifpe.model.classes.Aplicacao;
import br.recife.edu.ifpe.model.classes.Paciente;
import br.recife.edu.ifpe.model.classes.ProfissionalEnfermagem;
import br.recife.edu.ifpe.model.classes.Vacina;
import br.recife.edu.ifpe.model.repositorios.RepositorioGrupo;
import br.recife.edu.ifpe.model.repositorios.RepositorioPaciente;
import br.recife.edu.ifpe.model.repositorios.RepositorioProfissionalEnfermagem;
import br.recife.edu.ifpe.model.repositorios.RepositorioVacina;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author maria.santos
 */
@WebServlet(name = "PacienteServlet", urlPatterns = {"/PacienteServlet"})
public class PacienteServlet extends HttpServlet {

    private int countAplicacao = 0;
    private int countPaciente = 0;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        String atualizar = request.getParameter("atualizar");
        
        int id = Integer.valueOf(request.getParameter("id"));
        Date dataNascimento = new Date(request.getParameter("dataNascimento"));
        String caracteristicas = request.getParameter("caracteristicas");
        String nome = request.getParameter("nome");
        int grupoId = Integer.valueOf(request.getParameter("grupo"));
        
        Paciente paciente = new Paciente();
        paciente.setId(atualizar == null ? this.countPaciente++ : id);
        paciente.setNome(nome);
        paciente.setDataNascimento(dataNascimento);
        paciente.setCaracteristicasIndividuais(caracteristicas);
        paciente.setGrupo(RepositorioGrupo.getCurrentInstance().read(grupoId));
        
        if(atualizar != null){
            RepositorioPaciente.getCurrentInstance().update(paciente);
        }else{
            String descricao = request.getParameter("descricao");
            int profissionalId = Integer.valueOf(request.getParameter("profissionais"));
            int vacinaId = Integer.valueOf(request.getParameter("vacina"));
            ProfissionalEnfermagem profissional = RepositorioProfissionalEnfermagem.getCurrentInstance().read(profissionalId);
            Vacina vacina = RepositorioVacina.getCurrentInstance().read(vacinaId);

            if(vacina.getQuantidadeAplicacoes() > 0){
                vacina.setQuantidadeAplicacoes(vacina.getQuantidadeAplicacoes() - 1);
                Aplicacao aplicacao = new Aplicacao();
                aplicacao.setId(0);
                aplicacao.setDescricao(descricao);
                aplicacao.setAplicador(profissional);
                aplicacao.setVacina(vacina);
                paciente.add(aplicacao);
            }
            else{
                session.setAttribute("msg", "A vacina "+vacina.getNome()+" não tem mais aplicação");
                            response.sendError(500);
            }

            RepositorioPaciente.getCurrentInstance().insert(paciente);
            session.setAttribute("msg", "O paciente foi cadastrado com sucesso");
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        super.doPut(request, resp); //To change body of generated methods, choose Tools | Templates.
        HttpSession session = request.getSession();

        String descricao = request.getParameter("descricao");
        int pacienteId = Integer.valueOf(request.getParameter("paciente"));
        int profissionalId = Integer.valueOf(request.getParameter("profissionais"));
        int vacinaId = Integer.valueOf(request.getParameter("vacina"));
        ProfissionalEnfermagem profissional = RepositorioProfissionalEnfermagem.getCurrentInstance().read(profissionalId);
        Vacina vacina = RepositorioVacina.getCurrentInstance().read(vacinaId);
        Paciente paciente = RepositorioPaciente.getCurrentInstance().read(pacienteId);

        if (vacina.getQuantidadeAplicacoes() > 0) {
            vacina.setQuantidadeAplicacoes(vacina.getQuantidadeAplicacoes() - 1);
            Aplicacao aplicacao = new Aplicacao();
            aplicacao.setId(this.countAplicacao++);
            aplicacao.setDescricao(descricao);
            aplicacao.setAplicador(profissional);
            aplicacao.setVacina(vacina);

            paciente.add(aplicacao);
        } else {
            session.setAttribute("msg", "A vacina " + vacina.getNome() + " não tem mais aplicação");
            resp.sendError(500);
        }

        RepositorioPaciente.getCurrentInstance().update(paciente);
        session.setAttribute("msg", "A aplicação foi cadastrado com sucesso");
    }

}