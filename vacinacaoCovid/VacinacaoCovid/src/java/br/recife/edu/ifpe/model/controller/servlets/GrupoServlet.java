/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.recife.edu.ifpe.model.controller.servlets;

import br.recife.edu.ifpe.model.classes.Grupo;
import br.recife.edu.ifpe.model.repositorios.RepositorioGrupo;
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
@WebServlet(name = "GrupoServlet", urlPatterns = {"/GrupoServlet"})
public class GrupoServlet extends HttpServlet {

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

        Grupo grupo = RepositorioGrupo.getCurrentInstance().read(id);

        request.setAttribute("grupo", grupo);

        getServletContext().getRequestDispatcher("/grupos.jsp").forward(request, response);
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
        
        String denominacao = request.getParameter("denominacao");
        int idadeMinima = Integer.parseInt(request.getParameter("idadeMinima"));
        int idadeMaxima = Integer.parseInt(request.getParameter("idadeMaxima"));

        String atualizar = request.getParameter("atualizar");

        int id = atualizar == null ? iteratorID++ :  Integer.parseInt(request.getParameter("id"));

        Grupo grupo = new Grupo(id, denominacao, idadeMinima, idadeMaxima);

        HttpSession session = request.getSession();

        if (atualizar == null) {
            RepositorioGrupo.getCurrentInstance().insert(grupo);
            session.setAttribute("msg", "Grupo " + grupo.getDenominacao() + " foi cadastrado com sucesso!");
        } else {
            RepositorioGrupo.getCurrentInstance().update(grupo);
            session.setAttribute("msg", "Grupo " + grupo.getDenominacao() + " foi atualizado com sucesso!");
        }

        response.sendRedirect("grupos.jsp");
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doDelete(req, resp);
        int id = Integer.parseInt(req.getParameter("id"));
        System.out.println(id);

        Grupo grupo = RepositorioGrupo.getCurrentInstance().read(id);
        RepositorioGrupo.getCurrentInstance().delete(grupo);
        HttpSession session = req.getSession();

        session.setAttribute("msg", "O Grupo" + grupo.getDenominacao() + " foi deletado!");

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
