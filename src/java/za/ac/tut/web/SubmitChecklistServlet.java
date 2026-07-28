/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.entities.CheckListEntry;
import za.ac.tut.entities.CheckListEntryFacadeLocal;

/**
 *
 * @author BETTY DLADLA
 */
@WebServlet(name = "SubmitChecklistServlet", urlPatterns = {"/SubmitChecklistServlet.do"})        
public class SubmitChecklistServlet extends HttpServlet {

   /**
 * Question order / point values (17 total):
 *   q1-q5   Physical Well-being : 5,5,5,5,10   (max 30)
 *   q6-q9   Mental Clarity      : 10,5,5,5     (max 25)
 *   q10-q13 Emotional State     : 5,5,5,5      (max 20)
 *   q14-q17 Trading Readiness   : 10,5,5,5     (max 25)
 */



    private static final int[] PHYSICAL_PTS = {5, 5, 5, 5, 10};
    private static final int[] MENTAL_PTS = {10, 5, 5, 5};
    private static final int[] EMOTIONAL_PTS = {5, 5, 5, 5};
    private static final int[] READINESS_PTS = {10, 5, 5, 5};

    @EJB
    private CheckListEntryFacadeLocal checklistEntryFacade;

    private boolean isYes(HttpServletRequest request, int qNum) {
        String val = request.getParameter("q" + qNum);
        return "yes".equalsIgnoreCase(val);
    }

    private int scoreSection(HttpServletRequest request, int[] pts, int startIndex, StringBuilder answersOut) {
        int total = 0;
        for (int i = 0; i < pts.length; i++) {
            boolean yes = isYes(request, startIndex + i);
            if (yes) {
                total += pts[i];
            }
            answersOut.append(yes ? "Y" : "N");
            answersOut.append(",");
        }
        return total;
    }

    private String bandFor(int totalScore) {
        if (totalScore >= 90) {
            return "CLEARED";
        } else if (totalScore >= 80) {
            return "REVIEW";
        } else if (totalScore >= 70) {
            return "CAUTION";
        } else {
            return "HOLD";
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        StringBuilder answers = new StringBuilder();

        int physicalScore = scoreSection(request, PHYSICAL_PTS, 1, answers);
        int mentalScore = scoreSection(request, MENTAL_PTS, 6, answers);
        int emotionalScore = scoreSection(request, EMOTIONAL_PTS, 10, answers);
        int readinessScore = scoreSection(request, READINESS_PTS, 14, answers);

        int totalScore = physicalScore + mentalScore + emotionalScore + readinessScore;
        String band = bandFor(totalScore);

        CheckListEntry entry = new CheckListEntry();
        entry.setEntryDate(new Date());
        entry.setPhysicalScore(physicalScore);
        entry.setMentalScore(mentalScore);
        entry.setEmotionalScore(emotionalScore);
        entry.setReadinessScore(readinessScore);
        entry.setTotalScore(totalScore);
        entry.setBand(band);
        String answersStr = answers.length() > 0 ? answers.substring(0, answers.length() - 1) : "";
        entry.setAnswers(answersStr);

        checklistEntryFacade.create(entry);

        request.setAttribute("entry", entry);

        RequestDispatcher dispatcher = request.getRequestDispatcher("result.jsp");
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

