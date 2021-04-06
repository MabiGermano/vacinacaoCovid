/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.recife.edu.ifpe.model.controller.servlets;

import br.recife.edu.ifpe.model.classes.ProfissionalEnfermagem;
import br.recife.edu.ifpe.model.repositorios.RepositorioProfissionalEnfermagem;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ProfissionalEnfermagem", urlPatterns = {"/ProfissionalEnfermagem"})
public class ProfissionalEnfermagemServlet extends HttpServlet {

    private int iteratorID = 0;

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        ProfissionalEnfermagem profissionalEnfermagem = RepositorioProfissionalEnfermagem.getCurrentInstance().read(id);

        request.setAttribute("profissionalEnfermagem", profissionalEnfermagem);

        getServletContext().getRequestDispatcher("/profissionais.jsp").forward(request, response);
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
        
        String nome = request.getParameter("nome");
        String coren = request.getParameter("coren");
        int anoFormacao = Integer.parseInt(request.getParameter("anoFormacao"));
        String contato = request.getParameter("contato");

        String atualizar = request.getParameter("atualizar");

        int id = atualizar == null ? iteratorID++ :  Integer.parseInt(request.getParameter("id"));

        ProfissionalEnfermagem profissionalEnfermagem = new ProfissionalEnfermagem(id, nome, coren, anoFormacao, contato);

        HttpSession session = request.getSession();

        if (atualizar == null) {
            RepositorioProfissionalEnfermagem.getCurrentInstance().insert(profissionalEnfermagem);
            session.setAttribute("msg", "Profissional " + profissionalEnfermagem.getNome() + " foi cadastrado com sucesso!");
        } else {
            RepositorioProfissionalEnfermagem.getCurrentInstance().update(profissionalEnfermagem);
            session.setAttribute("msg", "Profissional " + profissionalEnfermagem.getNome() + " foi atualizado com sucesso!");
        }

        response.sendRedirect("profissionais.jsp");
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doDelete(req, resp);
        int id = Integer.parseInt(req.getParameter("id"));
        System.out.println(id);

        ProfissionalEnfermagem profissionalEnfermagem = RepositorioProfissionalEnfermagem.getCurrentInstance().read(id);
        RepositorioProfissionalEnfermagem.getCurrentInstance().delete(profissionalEnfermagem);
        HttpSession session = req.getSession();

        session.setAttribute("msg", "O Profissional " + profissionalEnfermagem.getNome() + " foi deletado!");

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
