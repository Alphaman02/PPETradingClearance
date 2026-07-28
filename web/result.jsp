<%-- 
    Document   : result
    Created on : Jul 23, 2026, 2:34:11 PM
    Author     : BETTY DLADLA
--%>

<%@page import="za.ac.tut.entities.CheckListEntry"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    CheckListEntry entry = (CheckListEntry) request.getAttribute("entry");
    String band = entry.getBand();
    String note;
    if ("CLEARED".equals(band)) {
        note = "You're physically, mentally, and emotionally prepared.";
    } else if ("REVIEW".equals(band)) {
        note = "Review your checklist and adjust to improve your score.";
    } else if ("CAUTION".equals(band)) {
        note = "Consider reconsidering trading today. Shore up your well-being.";
    } else {
        note = "Do not trade! Take a break and focus on self-care. Re-evaluating your readiness to trade when you feel more prepared.";
    }

%>
<!DOCTYPE html>
<html>
<head>
    <title>PPE Trading Checklist - Result</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="wrap">
    <div class="wordmark">PPE</div>
    <div class="subwordmark">Pippistol Enterprises</div>
    <h1>Today's Readiness Result</h1>

    <div class="score-display">
        <div class="score-number"><%= entry.getTotalScore() %></div>
        <div class="score-max">/ 100</div>
        <div class="band band-<%= band %>"><%= band %></div>
        <div class="band-note"><%= note %></div>
    </div>

    <div class="section">
        <div class="section-header"><span>Physical Well-Being</span><span class="section-score"><%= entry.getPhysicalScore() %> / 30</span></div>
        <div class="section-header"><span>Mental Clarity</span><span class="section-score"><%= entry.getMentalScore() %> / 25</span></div>
        <div class="section-header"><span>Emotional State</span><span class="section-score"><%= entry.getEmotionalScore() %> / 20</span></div>
        <div class="section-header"><span>Trading Readiness</span><span class="section-score"><%= entry.getReadinessScore() %> / 25</span></div>
    </div>

    <a href="checklist.jsp" class="link-btn">New Checklist</a>
    <a href="HistoryServlet.do" class="link-btn">View History</a>
</div>
</body>
</html>
