<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
   
	
	<!--  CSS 추가 : 툴바에 화면 가리는 현상 해결 :  주석처리 전, 후 확인-->
	<style>
        body {
            padding-top : 70px;
        }
   	</style>
   	
	<script type="text/javascript">
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/integration/listSendMessage").submit();
	}
	
	
	$(function(){
		
		$("ul li:nth-child(2)").on("click", function(){
			$("#myModal2").find('#receiver').val($(this).find('input').val());
		});
	
		
	 	$( "a:contains('보낸쪽지함')" ).on("click" , function() {
	 		location.href = "/integration/listSendMessage";
		});
	 	$( "a:contains('받은쪽지함')" ).on("click" , function() {
	 		location.href = "/integration/listReceiveMessage";
		});
	 	

	 	
	})
	
	$(function(){
				
		
		
		
 		$("#deletebtn").on("click" , function() {

 		 	
  			
 			  var messageArr = new Array();
   				
 		 	 $("input[class='messageNo']:checked").each(function(){
 		 		messageArr.push($(this).val());
 			 });
 		 	 
 		  		$.ajax({
		  			 	 url : "/integration/deleteTest",
			  		  	 type : "POST",
		  		  	 	 data : { messageNo : messageArr },
		    		 	 success : function(result){
		   		   	 	 	if(result == 1){
		    		 		 	location.href = "/integration/listSendMessage";
		   		   	 	 	} else {
		   		   	 	 		alert("삭제 실패")
		   		   	 	 	}
		   		   	 		
		  		  	 	}
		  		  	 	 
  		  		});
 		  		alert("삭제가 완료되었습니다.")
 		  		$("input[class='messageNo']:checked").parent().parent().parent().remove();
 		});
 		
 		
 		$("#deletebtn2").on("click" , function() {
 			
 			var messageDelete = $(".deleteMessage").val()
			
			
 			
			$.ajax({
				
				url : "/integration/json/deleteMessage/"+messageDelete,
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData, status){
					
				}
			});
			alert("삭제가 완료되었습니다.")
			$("#trRemove").remove();
 			
 		});
 		

 		
	})
	</script>

	
	






</head>
<body>
	<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
	
	<jsp:include page="../common/toolbar.jsp" />
	<jsp:include page="../integrationView/addSendMessage.jsp" />
	<jsp:include page="../integrationView/addSendMessage2.jsp" />
	
	<div class="contatiner">
	
		<div class="page-header text-info">
	       		<h3>보낸 쪽지</h3>
	    </div>
	    
	    <ul class="nav nav-tabs">
  			<li role="presentation"><a href="#">보낸쪽지함</a></li>
  			<li role="presentation"><a href="#">받은쪽지함</a></li>
		</ul>
		
		
	    
		<div class="row">

			<div class="col-md-6 text-left">
				<p class="text-primary">전체 ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage} 페이지</p>
			</div>

		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			      
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>				
			
		</div>
	    
	    <table class="table table-hover table-striped" >
	    
	    	<thead>
	    		<tr>	       		
       					<th align="center">No</th>
       					<th align="left">쪽지내용</th>
       					<th align="left">수신자 이메일</th>
       					<th align="left">전송일자</th>
       					<th align="left">
       						<div class="delBtn">
       							<button type="button" class="selectDelete_btn" data-toggle="modal" data-target="#exampleModal">선택삭제</button>
       						</div>	       					
       						<div class="allCheck">
								<input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label>
									<script>
										$("#allCheck").click(function() {
											var chk = $("#allCheck").prop("checked");
											if (chk) {
												$('.messageNo').prop("checked", true);
											} else {
												$('.messageNo').prop("checked", false);
											}
										});
									</script>
							</div>
						</th>
	    		</tr>
	    	</thead>
	    	<tbody>	
	    	  <c:if test="${ ! empty list}">
		 	 	<c:set var="i" value="0" />
		  		<c:forEach var="message" items="${list}">
		  			<c:set var="i" value="${ i+1 }" />
		  			<tr id="trRemove">
		  			
			  			<td align="center">${ i }</td>
			  			<td align="left">${message.messageContents}</td>
						<td align="left">
							<div class="dropdown" name="jeeHoon">
								<a id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true" value="${message.receiver.email}">
									${message.receiver.email}
								</a>
								  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
								    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">프로필보기</a></li>						
								    <li role="presentation"><a role="menuitem" tabindex="-1" href="#" data-toggle="modal" data-target="#myModal2">쪽지보내기
								    <input type="hidden" value="${message.receiver.email}" /></a></li>
								    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">신고하기</a></li>
								  </ul>									
							</div>
						</td>
			  			<td align="left">${message.sendDate}</td>
			  			<td align="left">
			  				<div class="checkBox">
			  					<input type="checkbox" class="messageNo" name="messageNo"  value="${message.messageNo}"/>
									<script>
										$(".messageNo").click(function() {
											$("#allCheck").prop("checked", false);
										});
									</script>		  					
							</div>
						</td>
						<td align="left">
							<div class="delete">
	    						<button type="button" class="deleteMessage" name="deleteMessage"  value="${message.messageNo}" data-toggle="modal" data-target="#exampleModal2">삭제</button>
	   						</div>
			  			</td>
		  			
		  			</tr>
		  		</c:forEach>
		  	  </c:if>
			  <c:if test="${empty list }">
			  	<tr>
			  		<td align="center">	</td>
			  		<td align="center"></td>
			  		<td align="center"> 쪽지가 없습니다. </td>
			  	</tr>
			  </c:if>		  	  
	    	</tbody>
	    			
	    </table>
	    
	  	 <ul class="nav nav-tabs" name='send' style="float: right;">
	  				<button class="btn btn-primary" data-toggle="modal" data-target="#myModal">
					  쪽지보내기
					</button>
		</ul>
		
		 
		 <!-- Modal 쪽지 선택삭제-->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">선택삭제</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        선택한 쪽지을 정말 삭제하시겠습니까?
			      </div>
			      <div class="modal-footer">
			      	<button type="button" id="deletebtn" class="btn btn-primary" data-dismiss="modal">삭제하기</button>
			       	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
			      </div>
			    </div>
			  </div>
			</div>	
			
		 <!-- Modal 쪽지 삭제-->
			<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel2">삭제</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        쪽지을 정말 삭제하시겠습니까?
			      </div>
			      <div class="modal-footer">
			      	<button type="button" id="deletebtn2" class="btn btn-primary" data-dismiss="modal">삭제하기</button>
			       	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
			      </div>
			    </div>
			  </div>
			</div>				
		
		

	</div>
	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->

</body>
</html>