<%@page language="java" import="java.util.*" %>
<html>
<head>
<title>Data Page</title>
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

<div id="result"></div>

<form name="f1"  action = "ajaxforum" method="post">
<p>Your name: <input name="word" type="text" id="word">
<input value="Go" type="submit"></p>

</form>
</body>
</html>
