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
<div class="w3-container w3-light-grey w3-padding-64 " style="height:800px">
<%
	request.setCharacterEncoding("UTF-8");
	String surveyTitle = request.getParameter("surveyTitle");
	String filePath = request.getRealPath("/txtfile/"+surveyTitle+".txt");
	
	ArrayList<String> valueList = new ArrayList<String>();
	ArrayList<Integer> cntList = new ArrayList<Integer>();
	BufferedReader br= new BufferedReader(new FileReader(filePath));
	
	String ss=null;
	int num=0;
	String[] words;
	String[] str;
	while(true)
	{	
		ss = br.readLine();	
		
		try
		{
			if(num==1){//선택지 이름
				words= ss.split(",");
				for(String wo:words){
					valueList.add(wo);
				}
			}
			
			if(num==2){
				str = ss.split(",");
				for(String wo:str){//선택한 선택지의 번호
					cntList.add(Integer.parseInt(wo));
				}
				break;
			}
			num++;
		}catch(Exception e)
		{
			System.out.println("아직 투표를 안했습니다.");
			%>
			<script>
			location.href = "notVotedResult.jsp";
			</script>
		<%
			return;
		}
		
	}
	br.close();
	
	int n=0;
	int nn=0;
	ArrayList<Integer> cnt =new ArrayList<Integer>();
 	
	while(n<valueList.size())//0,1
	{
		nn=0;
		for(int i=0; i<cntList.size();i++)
		{
			if(cntList.get(i)==n){nn++;}
		}
		cnt.add(nn);//갯수
		//System.out.println(n+" "+cnt.get(n));
		n++;
	}
	
%>
<div class="w3-container w3-margin" id="resultArea"></div>
<div class="w3-container w3-center">
<button class="w3-button w3-white w3-border w3-small w3-center" onclick="moveResultBar()">결과보기</button>
<button class="w3-button w3-white w3-border w3-small w3-center" onclick="location.href='index.jsp'">처음으로</button>
</div>


<%
	for(int i=0; i<cnt.size();i++)
	{
		%>
		<script>
		var barArea;
		var bar;
		var bar_text;
		var p;
		var p_text;
		
		barArea = document.createElement("div");
		barArea.className="w3-light-grey";
		barArea.setAttribute("id","bar"+<%=i%>);
		document.getElementById("resultArea").appendChild(barArea);
		
		bar = document.createElement("div");
		bar_text =document.createTextNode("0%");
		bar.className="w3-container w3-purple w3-center";
		bar.style.width="0%";
		bar.setAttribute("id","greenbar"+<%=i%>)
		bar.appendChild(bar_text);
		document.getElementById("bar"+<%=i%>).appendChild(bar);	
		
		p= document.createElement("p");
		p_text=document.createTextNode("<%=valueList.get(i)%>");
		p.appendChild(p_text);
		p.setAttribute("id","p"+<%=i%>);
		document.getElementById("resultArea").appendChild(p);
		
		</script>
	<%}
%>

<script>
function moveResultBar()
{
	
	<%
	for(int i=0; i<cnt.size();i++)
	{
	%>
	 var elem = document.getElementById("greenbar"+<%=i%>);//3
	 var elem_value=<%=Math.round(cnt.get(i)*10000/cntList.size())/100d%>;
	 elem.style.width = elem_value + '%';
     elem.innerHTML = elem_value * 1  + '%';
     
     var pp=document.getElementById("p"+<%=i%>);
     pp.innerHTML="<%=valueList.get(i)%>"+"  "+<%=cntList.size()%>+"표 중에 "+<%=cnt.get(i)%>+"표";
	<%
	}
	%>
}
</script>
</div>
<footer class="w3-container w3-black w3-opacity w3-center" style="height:100px">
      <p>Copyright@이예림</p>
</footer>
</body>

</html>