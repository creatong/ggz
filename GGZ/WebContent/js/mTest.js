var btn = document.getElementsByClassName("btn");
window.onload = function () { 
	for (var i = 0; i < btn.length; i++) {
		  btn[i].addEventListener("click", handleClick);
	}
}

function handleClick(event) {
  console.log(event.target);
    for (var i = 0; i < btn.length; i++) {
    	if (btn[i].classList[1] === "clicked") {  
    		btn[i].classList.remove("clicked"); 
    		}
    }
    event.target.classList.add("clicked");
}

 var c =""; //사용자가 고른 답 변수
 var g = 0; //점수 저장 변수
 var a = "";//현재 문제 답 변수
var frm =document.createElement("form");
frm.setAttribute("method","post");
var hiddenGrade= document.createElement("input");
var hiddenAnswer= document.createElement("input");
var hiddenChoice= document.createElement("input");
var hiddenPoint = document.createElement("input");
	function pre(i,grade,ch,an){ //이전 버튼 함수
	 if(ch==an){//이전문제에서 정답을 맞혔을 때 
		 grade= grade-20;
	 }
		g=grade;// g변수에 현재 점수 저장
		a=an; //a 변수에 현재 문제 답 저장
		if(i==1){ 
			return;			
		}
			i= i-1;
			var url= './mTestpre.GGZ?idx='+i;
	    	frm.setAttribute("action",url);
	    	
	    	//hidden값으로 현재 점수, 문제 답 보내기 
	    	hiddenGrade.setAttribute("type","hidden");
	    	hiddenGrade.setAttribute("name","grade");
	    	hiddenGrade.setAttribute("value",g);

		    hiddenAnswer.setAttribute("type","hidden");
		    hiddenAnswer.setAttribute("name","answer");
		    hiddenAnswer.setAttribute("value",a);
		    
			frm.appendChild(hiddenGrade);
			frm.appendChild(hiddenAnswer);
			
			document.body.appendChild(frm);
			frm.submit();	
	}
	function  next(i,grade,answer,cnt) {  //다음 버튼 함수
		if(c==0){ //답안을 고르지 않았을 때 null값으로 넘기기 
			g=grade; 
			c=""; 
		}else{
		    a =answer;
		    if(c==a){ //사용자가 고른 답안과 정답 확인 
		    	g =grade+ 20;
		    }else{
		    	g=grade;
		    }
		}
		if(i==cnt){ //현재 문제가 마지막 문제면
			var url= './mTestGrade.GGZ';
	    	frm.setAttribute("action",url);
	    	//총 점수 넘기기
	    	if(g==100){
	    		var p = 1000;
	    	}else if(g>=70){
	    		var p = 500;
	    	}else if(g>=50){
	    		var p = 100;
	    	}else{
	    		var p=0;
	    	}
	    	hiddenPoint.setAttribute("type","hidden");
	    	hiddenPoint.setAttribute("name","point");
	    	hiddenPoint.setAttribute("value",p);
	    	
	    	hiddenGrade.setAttribute("type","hidden");
	    	hiddenGrade.setAttribute("name","grade");
	    	hiddenGrade.setAttribute("value",g);
	    	
			frm.appendChild(hiddenGrade);
			frm.appendChild(hiddenPoint);
			document.body.appendChild(frm);
			frm.submit();
			}else{
				i= i+1;
				a=answer;
				
				var url= './mTestnext.GGZ?idx='+i;
		    	frm.setAttribute("action",url);
		    	
		    	//hidden값으로 현재 점수, 문제 답, 사용자가 고른 답 보내기 
		    	hiddenGrade.setAttribute("type","hidden");
		    	hiddenGrade.setAttribute("name","grade");
		    	hiddenGrade.setAttribute("value",g);

			    hiddenAnswer.setAttribute("type","hidden");
			    hiddenAnswer.setAttribute("name","answer");
			    hiddenAnswer.setAttribute("value",a);
			    	
			    hiddenChoice.setAttribute("type","hidden");
			    hiddenChoice.setAttribute("name","choice");
			    hiddenChoice.setAttribute("value",c);
			    
				frm.appendChild(hiddenGrade);
				frm.appendChild(hiddenChoice);
				frm.appendChild(hiddenAnswer);

				document.body.appendChild(frm);
				frm.submit();
			}
		
	}	
	
	function button1(choice){ //1번 버튼 함수
	    c= choice;
	}
	function button2(choice){ //2번 버튼 함수
	    c= choice;
	}
	function button3(choice){ //3번 버튼 함수
	    c= choice;
	}
	function button4(choice){ //1번 버튼 함수
	    c= choice;
	}