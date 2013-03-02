<%@page language="java" import="java.util.*" %>
<html>
<head>
<title>Data Page</title>
<link rel="stylesheet" type="text/css" href="template.css">
<script type="text/javascript">
function xmlhttpPost(strURL) {
var xmlHttpReq = false;
var self = this;
// Mozilla/Safari
if (window.XMLHttpRequest) {
self.xmlHttpReq = new XMLHttpRequest();
}
// IE
else if (window.ActiveXObject) {
self.xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
}
self.xmlHttpReq.open('POST', strURL, true);
self.xmlHttpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
self.xmlHttpReq.onreadystatechange = function() {
if (self.xmlHttpReq.readyState == 4) {
updatepage(self.xmlHttpReq.responseText);
}
}
self.xmlHttpReq.send(getquerystring());
}
function getquerystring() {
var word = document.getElementById("word").value;
word = 'w=' + escape(word); // NOTE: no '?' before querystring
return word;
}
function updatepage(str){
document.getElementById("result").innerHTML = str;
}
</script>
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

<form name="f1" action="forum" method="post">
<p>Your name: <input name="word" type="text" id="word">
<input value="Go" type="submit" onclick='JavaScript:xmlhttpPost("info.jsp")'></p>

</form>
</body>
</html>
