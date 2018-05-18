<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

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
	int selectNum = Integer.parseInt(request.getParameter("radiobtn"));//뭐눌렀는지 0,1,2
	String selectValue= request.getParameter("radiobtnValue");
	/* int selectCnt = Integer.parseInt(request.getParameter("selectCnt"));//전체 선택지의 개수 */
	String surveyTitle= request.getParameter("surveyTitle");
	
	String filePath = request.getRealPath("/txtfile/"+surveyTitle+".txt");
	String content=null;
	ArrayList<String> valueList = new ArrayList<String>();

	try{
		if(surveyTitle!=null)
		{
			//몇번 골랐는지 파일에 쓰고
			BufferedWriter bw= new BufferedWriter(new FileWriter(filePath,true));
			PrintWriter pw = new PrintWriter(bw,true);
			
			pw.print(selectNum+",");			
			pw.flush();
			pw.close();
			bw.close();
			
			//그 숫자에 따라 무슨 항목 골랐는지
			BufferedReader br= new BufferedReader(new FileReader(filePath));
			String ss=null;
			int num=0;
			String[] words;
			String[] str;
			while(true)
			{	
				ss = br.readLine();	

				if(num==1){//선택지 이름
					words= ss.split(",");
					for(String wo:words){
						valueList.add(wo);
					}
					break;
				}
				num++;
			}
			br.close();
		}
	}
	catch(Exception e)
	{
		e.getStackTrace();
	}
	
	
%>
<h3><%=valueList.get(selectNum)+"를 선택하셨습니다" %></h3>


<button class="w3-button w3-white w3-border w3-small" onclick="gotoIndexPage()">처음으로</button>
 <script>
function gotoIndexPage()
{
	location.href="index.jsp";
}

</script>
</div>
<footer class="w3-container w3-black w3-opacity w3-center" style="height:100px">
      <p>Copyright@이예림</p>
</footer>
</body>
</html>