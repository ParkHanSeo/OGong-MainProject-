<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<script type="text/javascript">



	$(function(){
		$ ( "#btn1").on("click", function(){
			fncupdateProfile();
		});
	});
	
	function fncupdateProfile() {
		$("form").attr("method","POST").attr("action","/user/Changedpassword").submit();
	}
	
	
	var pw = $('.pw_input').val();				// 비밀번호 입력란

	
	/* 비밀번호 유효성 검사 */
	if(pw == ""){
		$('.final_pw_ck').css('display','block');
		pwCheck = false;
	}else{
		$('.final_pw_ck').css('display', 'none');
		pwCheck = true;
	}
	
	/* 비밀번호 확인 유효성 검사 */
	if(pwck == ""){
		$('.final_pwck_ck').css('display','block');
		pwckCheck = false;
	}else{
		$('.final_pwck_ck').css('display', 'none');
		pwckCheck = true;
	}
	
	
	
	
	
	$('.pwck_input').on("propertychange change keyup paste input", function(){
		
		var pw = $('.pw_input').val();
		var pwck = $('.pwck_input').val();
		$('.final_pwck_ck').css('display', 'none');
		
		if(pw == pwck){
			$('.pwck_input_re_1').css('display','block');
			$('.pwck_input_re_2').css('display','none');
			pwckcorCheck = true;
		}else{
			$('.pwck_input_re_1').css('display','none');
			$('.pwck_input_re_2').css('display','block');
			pwckcorCheck = false;
		}
		
		
	});
	
	

	
	
	
</script>

<style>
            #selectbox1 { display: none; }
            #selectbox1, div:#selectbox1 { display: none; }
            #selectbox1:checked ~ div:#selectbox1 { display: block; }
            #selectbox2 { display: none; }
            #selectbox2, div:#selectbox2 { display: none; }
            #selectbox2:checked ~ div:#selectbox2 { display: block; }
            
            #selectbox3 { display: none; }
            #selectbox3 ~ div:#selectbox3 { display: none; }
            #selectbox3:checked ~ div:#selectbox3 { display: block; }
            
            #selectbox4 { display: none; }
            #selectbox4 ~ div:#selectbox4 { display: none; }
            #selectbox4:checked ~ div:#selectbox4 { display: block; }
            
            #selectbox5 { display: none; }
            #selectbox5 ~ div:#selectbox5 { display: none; }
            #selectbox5:checked ~ div:#selectbox5 { display: block; }
            
            #selectbox6 { display: none; }
            #selectbox6 ~ div:#selectbox6 { display: none; }
            #selectbox6:checked ~ div:#selectbox6 { display: block; }
            
            #selectbox7 { display: none; }
            #selectbox7 ~ div:#selectbox7 { display: none; }
            #selectbox7:checked ~ div:#selectbox7 { display: block; }
            
            #selectbox8 { display: none; }
            #selectbox8 ~ div:#selectbox8 { display: none; }
            #selectbox8:checked ~ div:#selectbox8 { display: block; }
            
            #selectbox9 { display: none; }
            #selectbox9 ~ div:#selectbox9 { display: none; }
            #selectbox9:checked ~ div:#selectbox9 { display: block; }
            
            #selectbox10 { display: none; }
            #selectbox10 ~ div:#selectbox10 { display: none; }
            #selectbox10:checked ~ div:#selectbox10 { display: block; }
            section.buttons > label {
              display: block;
              text-align: center;
              line-height: 30px;
              border: 1px solid #dddddd;
              background: white;
              color: black;
              width: 160px; height: 45px;
              box-sizing: border-box;
              float: left;
              padding-top: 0.4em;
            }
            input:nth-of-type(1):checked ~ section.buttons >  label:nth-of-type(1) {
              border : 1px solid #ef6c00;
              color : #ef6c00;
            }
            input:nth-of-type(2):checked ~ section.buttons >  label:nth-of-type(2) {
               border : 1px solid #ef6c00;
              color : #ef6c00;
            }
            input:nth-of-type(3):checked ~ section.buttons >  label:nth-of-type(3) {
              border : 1px solid #ef6c00;
              color : #ef6c00;
            }
            input:nth-of-type(4):checked ~ section.buttons >  label:nth-of-type(4) {
                border : 1px solid #ef6c00;
              color : #ef6c00;
            }
            input:nth-of-type(5):checked ~ section.buttons >  label:nth-of-type(5) {
                border : 1px solid #ef6c00;
              color : #ef6c00;
            }
            input:nth-of-type(6):checked ~ section.buttons >  label:nth-of-type(6) {
                border : 1px solid #ef6c00;
              color : #ef6c00;
            }
            input:nth-of-type(7):checked ~ section.buttons >  label:nth-of-type(7) {
               border : 1px solid #ef6c00;
              color : #ef6c00;
            }
            input:nth-of-type(8):checked ~ section.buttons >  label:nth-of-type(8) {
               border : 1px solid #ef6c00;
              color : #ef6c00;
            }
            input:nth-of-type(9):checked ~ section.buttons >  label:nth-of-type(9) {
               border : 1px solid #ef6c00;
              color : #ef6c00;
            }
            input:nth-of-type(10):checked ~ section.buttons >  label:nth-of-type(10) {
               border : 1px solid #ef6c00;
              color : #ef6c00;
            }
            
            section.buttons {
              /* border: 4px dashed red; */
              overflow: hidden;
            }

</style>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/WEB-INF/views/common/toolbar.jsp" />
	
   	<!-- ToolBar End /////////////////////////////////////-->

</head>
<body>
	<div class="container">
	<br>><br/>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">


		
				<h1 class="text-center">비밀번호 변경</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
	
			  <input type="hidden" name="email"	value="${user.email}"/>
	
		<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Serif+KR:wght@600&family=Sunflower:wght@300&display=swap');body, table, div, p, th, td{
font-family: 'Do Hyeon', sans-serif;
}
        
     </style>
	


		
		
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="변경비밀번호">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호 확인</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="변경비밀번호 확인">
		    </div>
		  </div>

				
				
				
				  		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" id="btn1" class="btn btn-info"  >프로필 수정</button>
			  <a class="btn btn-info btn" href="/" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
				
				
				
				
			</span>
		</div>
		
		  

		

	
</body>
</html>




		  
		  
		  
		  
		  

		<!-- form Start /////////////////////////////////////-->
		
 	</div>
</body>
</html>