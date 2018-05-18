<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script type="text/javascript" src="index.js"></script>
   <title>우리반을 맞춰봐</title>
   <style>
   #hidden
	{
		width:1px;
		height:1px;
		border:0;
	}
      .btn{
      border:none;
      cursor:pointer;
    }
    .btn:hover{
        background-color: purple;
        color:white;
    }
    </style>
</head>
<body>

  <form method="post" name="fileSend" action="survey.jsp">
      <input type="hidden" name="surveyTitle" value=""><!-- 설문제목 -->
      <input type="hidden" name="surveyContent" value=""> <!--설문설명-->
      <input type="hidden" name="question" value=""><!--질문 -->
    </form>
   <iframe id="hidden" name="hiddenifr" src="survey.jsp"></iframe>
    
    <form method="post" name="fileGet" action="conductSurvey.jsp">
      <input type="hidden" name="surveyTitle" value=""><!-- 설문제목 -->
    </form>
    
    <form method="post" name="fileGraph" action="graphResult.jsp">
      <input type="hidden" name="surveyTitle" value=""><!-- 설문제목 -->
    </form>
    
	<div class="w3-top">
      <div class="w3-bar w3-purple w3-card w3-left-align w3-large">
        <a class="w3-bar-item w3-button w3-padding-large w3-hover-white">우리반을 맞춰봐</a>
        <a class="w3-bar-item w3-button w3-padding-large w3-hover-white w3-right" 
        onclick="document.getElementById('id01').style.display='block'">+</a>
      </div>
    </div>
	
	<!-- 설문지 카드가 작성되는 공간-->
    <div class="w3-container w3-light-grey w3-padding-64 " style="height:800px">
      <div class="w3-row w3-border" id="surveyArea">
  		<!-- 카드 추가 -->
      </div>
    </div>
    <%
	File folder = new File(request.getRealPath("/txtfile/"));
	File[] listOfFiles = folder.listFiles();
	String tmpFileName=null;
	
	for(int i=0; i<listOfFiles.length;i++)
	{
		if(listOfFiles[i].isFile()){
			
			tmpFileName=listOfFiles[i].getName().replace(".txt","");
			
			String filePath = request.getRealPath("/txtfile/"+tmpFileName+".txt");
			String content=null;
			ArrayList<String> questionlist= new ArrayList<String>();
			try{
				if(tmpFileName!=null)
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
			<script>
			existCardSurvey('<%=tmpFileName%>','<%=content%>','<%=questionlist.size()%>');
			</script>
			<%
		}
	}
%>
    <!-- 모달 -->
      <div id="id01" class="w3-modal">
      <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

        <div class="w3-center"><br>
          <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
        </div>

          <div class="w3-section w3-padding" id="modalArea">
            <label>설문 제목</label>
            <input type="text" class="w3-input" placeholder="Enter Title" name="surveyTitle" id="surveyTitle" required>
            <br>
            <label>설문 설명</label>
            <input type="text" class="w3-input" placeholder="Enter Title" name="surveyContent" id="surveyContent" required>
            <br>
            <label>선택지 갯수 </label>&nbsp;
            <input type="number" placeholder="Increase Number" name="questionCnt" id="questionCnt" required>
            <input type="button" value="OK" class="btn" onclick="createQuestion()" required>
           </div>

        <div class="w3-container w3-border-top w3-light-grey">
           <button class="w3-button w3-block w3-purple w3-section w3-padding" onclick="document.getElementById('id01').style.display='none';createCardSurvey()">설문지 만들기</button>
        </div>

      </div>
    </div>
    

    <footer class="w3-container w3-black w3-opacity w3-center" style="height:100px">
      <p>Copyright@이예림</p>
    </footer>
</body>
</html>