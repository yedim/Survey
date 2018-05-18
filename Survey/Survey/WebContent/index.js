  function createQuestion()
    {
      var cnt = document.getElementById("questionCnt").value;
      
      var i;
      var question;
      var question_text;
      var br = document.createElement("br");
      for(i=0; i<cnt; i++){
          question = document.createElement("input");
          question_text= document.createElement("p");

          question_text_node= document.createTextNode("Select"+(i+1));
          question_text.appendChild(question_text_node);
          question_text.setAttribute("id","question_text"+(i+1));
          document.getElementById("modalArea").appendChild(question_text);

          question.setAttribute("type", "text");
          question.className="w3-input w3-border";
          question.setAttribute("placeholder", "Select"+(i+1));
          question.setAttribute("id","question"+(i+1));//question설문제목1
          document.getElementById("modalArea").appendChild(question);
          document.getElementById("modalArea").appendChild(br);
      }

    }
  	function cardSurvey(surveyTitle_value,content_value,cnt)
  	{
  		var quarter = document.createElement("div");
    	quarter.className="w3-quarter w3-container";
    	quarter.setAttribute("id","quarter"+surveyTitle_value);//quarter제목
    	document.getElementById("surveyArea").appendChild(quarter);
    	
    	 var survey=document.createElement("div");
         survey.className="w3-card-4 w3-margin";
         survey.setAttribute("id","survey"+surveyTitle_value);//survey제목
         document.getElementById("quarter"+surveyTitle_value).appendChild(survey);
         
         var header= document.createElement("header");
         header.className="w3-container w3-purple"
         header.setAttribute("id",surveyTitle_value);//설문의 제목==id
         document.getElementById("survey"+surveyTitle_value).appendChild(header);
         
         var h2 = document.createElement("h2");
         var h2text=document.createTextNode(surveyTitle_value);
         h2.appendChild(h2text);
         document.getElementById(surveyTitle_value).appendChild(h2);
         
         //설문 내용
         var content = document.createElement("div");
         var content_text =document.createTextNode(content_value);
         content.className="w3-container w3-padding";
         content.appendChild(content_text);
         document.getElementById("survey"+surveyTitle_value).appendChild(content);
         
         //설문 footer
         var footer= document.createElement("div");
         var footer_text = document.createTextNode("선택지 "+cnt+"개");
         footer.className="w3-container w3-purple w3-padding";
         footer.setAttribute("id","footer"+surveyTitle_value);//footer제목
         footer.appendChild(footer_text);
         document.getElementById("survey"+surveyTitle_value).appendChild(footer);

         var button = document.createElement("button");
	     var button_text=document.createTextNode("결과");
	     button.className="w3-button w3-white w3-border w3-small";
	     button.appendChild(button_text);
         button.style.float="right";
         button.style.marginLeft="5px";
	     button.onclick = function() { createGraph(header) };
	     document.getElementById("footer"+surveyTitle_value).appendChild(button);
	     
         var button = document.createElement("button");
         var button_text=document.createTextNode("작성");
         button.className="w3-button w3-white w3-border w3-small";
         button.style.float="right";
         button.appendChild(button_text);
         button.onclick = function() { createSurvey(header) };
         document.getElementById("footer"+surveyTitle_value).appendChild(button);
         

  	}
  	function existCardSurvey(surveyTitle_value,content_value,cnt)
  	{
  		cardSurvey(surveyTitle_value,content_value,cnt);
  	}
    function createCardSurvey()
    {
        //surveycard 생성되는 공간
    	var surveyTitle_value=document.getElementById("surveyTitle").value;
    	 var content_value=document.getElementById("surveyContent").value;
         var cnt = document.getElementById("questionCnt").value;

   		cardSurvey(surveyTitle_value,content_value,cnt);//surveyTitle_value,content_value,cnt
    	
        var q="";
        //파일에 추가
        for(i=0;i<cnt;i++)
        {
            q+=document.getElementById("question"+(i+1)).value;
            q+=",";
        }
        
      var form = document.fileSend;
	  form.surveyTitle.value=document.getElementById("surveyTitle").value;
	  form.surveyContent.value = document.getElementById("surveyContent").value;
	  form.question.value=q;
	  form.target = "hiddenifr";   
	  form.submit();
        
      resetSurvey();
    }
    function createSurvey(header)
    {
        var form = document.fileGet;
    	form.surveyTitle.value=header.id;//설문제목
    	form.submit();
  	}
    function createGraph(header)
    {
    	var form = document.fileGraph;
    	form.surveyTitle.value=header.id;//설문제목
    	form.submit();
    }

    function resetSurvey()
    {
        var cnt = document.getElementById("questionCnt").value;

          var i;
          var question;
          var question_text;

          //지우기
          for(i=0;i<cnt;i++)
          {
              question=document.getElementById("question"+(i+1));
              question_text=document.getElementById("question_text"+(i+1));
              document.getElementById("modalArea").removeChild(question);
              document.getElementById("modalArea").removeChild(question_text);
          }
          document.getElementById("questionCnt").value="";
          document.getElementById("surveyTitle").value="";
          document.getElementById("surveyContent").value="";
    }