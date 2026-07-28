<%-- 
    Document   : history
    Created on : Jul 23, 2026, 2:35:56 PM
    Author     : BETTY DLADLA
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="za.ac.tut.entities.CheckListEntry"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<CheckListEntry> entries = (List<CheckListEntry>) request.getAttribute("entries");
    SimpleDateFormat fmt = new SimpleDateFormat("dd MMM yyyy, HH:mm");
%>
<!DOCTYPE html>
<html>
<head>
    <title>PPE Trading Checklist - History</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="wrap">
    <div class="wordmark">PPE</div>
    <div class="subwordmark">Pippistol Enterprises</div>
    <h1>Checklist History</h1>

    <div class="section">
        <table class="history">
            <tr>
                <th>Date</th>
                <th>Total</th>
                <th>Status</th>
            </tr>
            <% if (entries == null || entries.isEmpty()) { %>
            <tr><td colspan="3" style="color:#8B8D96;">No entries yet.</td></tr>
            <% } else {
                for (CheckListEntry e : entries) {
            %>
            <tr>
                <td><%= fmt.format(e.getEntryDate()) %></td>
                <td><%= e.getTotalScore() %> / 100</td>
                <td class="band-<%= e.getBand() %>"><%= e.getBand() %></td>
            </tr>
            <%
                }
            } %>
        </table>
    </div>

    <a href="checklist.jsp" class="link-btn">New Checklist</a>
</div>
</body>
</html>