<%-- 
    Document   : checklist
    Created on : Jul 23, 2026, 2:30:31 PM
    Author     : BETTY DLADLA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    private String[][] physicalItems = {
        {"Did I get 7-8 hours of sleep?", "5"},
        {"Did I eat a nutritious breakfast?", "5"},
        {"Am I hydrated?", "5"},
        {"Did I exercise or stretch today?", "5"},
        {"Am I feeling energized and alert?", "10"}
    };
    private String[][] mentalItems = {
        {"Am I feeling calm and focused?", "10"},
        {"Did I meditate or practice mindfulness?", "5"},
        {"Am I free from distractions?", "5"},
        {"Did I review my trading plan and goals?", "5"}
    };
    private String[][] emotionalItems = {
        {"Am I feeling patient and disciplined?", "5"},
        {"Am I managing my emotions (greed, fear)?", "5"},
        {"Did I reflect on my previous trades?", "5"},
        {"Am I feeling confident in my trading abilities?", "5"}
    };
    private String[][] readinessItems = {
        {"Did I analyze the markets and identify potential trades?", "10"},
        {"Do I have a clear trading strategy for the day?", "5"},
        {"Are my trading platforms and tools functioning properly?", "5"},
        {"Do I have sufficient funds in my trading account?", "5"}
    };
%>
<!DOCTYPE html>
<html>
<head>
    <title>PPE Trading Checklist</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="wrap">
    <div class="wordmark">PPE</div>
    <div class="subwordmark">Pippistol Enterprises</div>
    <h1>Pre-Market Readiness Check</h1>

    <form action="SubmitChecklistServlet.do" method="post">

        <%
            int qNum = 1;
            String[][][] allSections = {physicalItems, mentalItems, emotionalItems, readinessItems};
            String[] sectionTitles = {"Physical Well-Being", "Mental Clarity", "Emotional State", "Trading Readiness"};
            String[] sectionMax = {"30", "25", "20", "25"};

            for (int s = 0; s < allSections.length; s++) {
        %>
        <div class="section">
            <div class="section-header">
                <span><%= sectionTitles[s] %></span>
                <span class="section-score">max <%= sectionMax[s] %></span>
            </div>
            <%
                for (String[] item : allSections[s]) {
                    String question = item[0];
            %>
            <div class="item-row">
                <span class="item-q"><%= question %></span>
                <span class="radio-group">
                    <label><input type="radio" name="q<%= qNum %>" value="yes" required> Yes</label>
                    <label><input type="radio" name="q<%= qNum %>" value="no"> No</label>
                </span>
            </div>
            <%
                    qNum++;
                }
            %>
        </div>
        <%
            }
        %>

        <button type="submit" class="submit-btn">Submit Checklist</button>
    </form>

    <a href="HistoryServlet.do" class="link-btn">View History</a>
</div>
</body>
</html>
