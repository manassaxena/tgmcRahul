<%@page language="java" import="java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="template.css">
</head>

<body>
<div class="left">
<%Iterator itr;%>
 <%List data= (List)request.getAttribute("data");

for (itr=data.iterator(); itr.hasNext(); )
{%><h3>post</h3>
<div class="left_box">
<p><%=itr.next()%></p>
<%}%>
</div>
</div>



</body>
</html>
