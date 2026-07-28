/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.entities.CheckListEntry;
import za.ac.tut.entities.CheckListEntryFacadeLocal;

/**
 *
 * @author BETTY DLADLA
 */
public class HistoryServlet extends HttpServlet {

   @EJB
    private CheckListEntryFacadeLocal checklistEntryFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<CheckListEntry> entries = checklistEntryFacade.findAll();
        Collections.sort(entries, new Comparator<CheckListEntry>() {
            @Override
            public int compare(CheckListEntry a, CheckListEntry b) {
                return b.getEntryDate().compareTo(a.getEntryDate());
            }
        });

        request.setAttribute("entries", entries);

        RequestDispatcher dispatcher = request.getRequestDispatcher("history.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}

