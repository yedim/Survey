<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>Insert title here</title>
</head>
<body>
<%
	String contentpage=request.getParameter("CONTENTPAGE");

%>
<div class="w3-top">
      <div class="w3-bar w3-purple w3-card w3-left-align w3-large">
        <a class="w3-bar-item w3-button w3-padding-large w3-hover-white">우리반을 맞춰봐</a>
        <a class="w3-bar-item w3-button w3-padding-large w3-hover-white w3-right" 
        onclick="document.getElementById('id01').style.display='block'">+</a>
      </div>
</div>
<div class="w3-container w3-light-grey w3-padding-64 w3-center" style="height:800px">
	<jsp:include page="<%=contentpage %>"></jsp:include> <!-- contentpage -->
</div>
<footer class="w3-container w3-black w3-opacity w3-center" style="height:100px">
      <p>Copyright@이예림</p>
</footer>
</body>
</html>