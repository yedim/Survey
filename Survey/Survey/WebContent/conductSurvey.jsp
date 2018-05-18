<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 
<title>Insert title here</title>
</head>
<body>
	<div class="w3-top">
      <div class="w3-bar w3-purple w3-card w3-left-align w3-large">
        <a class="w3-bar-item w3-button w3-padding-large w3-hover-white">우리반을 맞춰봐</a>
      </div>
    </div>
    <div class="w3-container w3-light-grey w3-padding-64 w3-center" style="height:800px">
    
<%
	request.setCharacterEncoding("UTF-8");
	String surveyTitle = request.getParameter("surveyTitle");
	String filePath = request.getRealPath("/txtfile/"+surveyTitle+".txt");
	String content=null;
	ArrayList<String> questionlist= new ArrayList<String>();
	try{
		if(surveyTitle!=null)
		{
			BufferedReader br= new BufferedReader(new FileReader(filePath));
			String ss=null;
			
			ss = br.readLine();
			content=ss;
			ss=br.readLine();
			String[] words = ss.split(",");
			for(String wo:words)
			{
				questionlist.add(wo);
			}
			br.close();
		}
	}
	catch(Exception e)
	{
		e.getStackTrace();
	}
%>
<h2><%=content %></h2>

	<form method="post" action= "selectResult.jsp">
	<%
	for(int i=0; i<questionlist.size(); i++)
	{
	%>
		<input type="radio" name="radiobtn" value="<%=i%>"><label style="font-size:20px;"><%=questionlist.get(i)%></label>
	<%}
	%>
	<input type ="hidden" name="surveyTitle" value="<%=surveyTitle %>">
	<input type="hidden" name = "selectCnt" value="<%=questionlist.size() %>"><br>
	<input type="submit" class="w3-button w3-white w3-border w3-small w3-margin" value="선택완료">
	</form>
		

	</div>
	<footer class="w3-container w3-black w3-opacity w3-center" style="height:100px">
      <p>Copyright@이예림</p>
    </footer>
</body>
</html>