<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String surveyTitle = request.getParameter("surveyTitle");
	String surveyContent = request.getParameter("surveyContent");
	String question = request.getParameter("question");
	
	String filePath = request.getRealPath("/txtfile/"+surveyTitle+".txt");
	
	
	try{
		if(surveyTitle!=null)
		{
			File f = new File(filePath);
			f.createNewFile();//파일 생성
			
			BufferedWriter bw= new BufferedWriter(new FileWriter(filePath));
			PrintWriter writer = new PrintWriter(bw,true);
			writer.println(surveyContent);
			writer.print(question);
			writer.println();
			writer.flush();
			
			writer.close();
		}
		
	}
	catch(Exception e)
	{
		e.getStackTrace();
	}
	
%>

</body>
</html>