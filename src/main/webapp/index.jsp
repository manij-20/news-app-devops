<%@ page import="java.util.List" %>
<html>
<head>
    <meta http-equiv="refresh" content="10">
    <title>Today's News</title>
</head>
<body>

    <h2>Today's News (India) - 
        <%= request.getAttribute("date") != null ? request.getAttribute("date") : "No date available" %>
    </h2>

    <ul>
        <%
            List<String> headlines = (List<String>) request.getAttribute("headlines");

            if (headlines != null && !headlines.isEmpty()) {
                for (String h : headlines) {
        %>
                    <li><%= h %></li>
        <%
                }
            } else {
        %>
                <li>No headlines available</li>
        <%
            }
        %>
    </ul>

</body>
</html>
