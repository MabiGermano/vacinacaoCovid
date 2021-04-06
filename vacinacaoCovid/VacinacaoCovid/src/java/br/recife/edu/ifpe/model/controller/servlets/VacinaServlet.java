/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.recife.edu.ifpe.model.controller.servlets;

import br.recife.edu.ifpe.model.classes.Vacina;
import br.recife.edu.ifpe.model.repositorios.RepositorioVacina;
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
@WebServlet(name = "VacinaServlet", urlPatterns = {"/VacinaServlet"})
public class VacinaServlet extends HttpServlet {

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

        Vacina vacina = RepositorioVacina.getCurrentInstance().read(id);

        request.setAttribute("vacina", vacina);

        getServletContext().getRequestDispatcher("/vacinas.jsp").forward(request, response);
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
       
        String fabricante = request.getParameter("fabricante");
        String tempoEntreAplicacoes = request.getParameter("tempoEntreAplicacoes");
        int quantidadeAplicacoes = Integer.parseInt(request.getParameter("quantidadeAplicacoes"));
        
        String atualizar = request.getParameter("atualizar");

        int id = atualizar == null ? iteratorID++ :  Integer.parseInt(request.getParameter("id"));

        Vacina vacina = new Vacina(id, nome, fabricante, tempoEntreAplicacoes, quantidadeAplicacoes);

        HttpSession session = request.getSession();

        if (atualizar == null) {
            RepositorioVacina.getCurrentInstance().insert(vacina);
            session.setAttribute("msg", "A vacina" + vacina.getNome() + " foi cadastrado com sucesso!");
        } else {
            RepositorioVacina.getCurrentInstance().update(vacina);
            session.setAttribute("msg", "A vacina " + vacina.getNome() + " foi atualizado com sucesso!");
        }

        response.sendRedirect("vacinas.jsp");
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doDelete(req, resp);
        int id = Integer.parseInt(req.getParameter("id"));
        System.out.println(id);

        Vacina vacina = RepositorioVacina.getCurrentInstance().read(id);
        RepositorioVacina.getCurrentInstance().delete(vacina);
        HttpSession session = req.getSession();

        session.setAttribute("msg", "O Vacina " + vacina.getNome() + " foi deletado!");

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
