<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
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
	
	
	<!--  CSS �߰� : ���ٿ� ȭ�� ������ ���� �ذ� :  �ּ�ó�� ��, �� Ȯ��-->
	<style>
        body {
            padding-top : 70px;
        }
   	</style>
   	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
	<script type="text/javascript">
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/integration/listReceiveMessage").submit();
	}
	
	function fncAddSendMessage(){
		//Form ��ȿ�� ����

		var sender = "${message.sender.email}";
		var receiver = $("textarea[name='receiver.email']").val();
		var messageContents = $("textarea[name='messageContents']").val();
		
		
	/* 	if(receiver == null || receiver.length<1){
			alert("������ �̸����� �ݵ�� �Է��ؾ� �մϴ�.");
			alert(receiver);
			return;
		}
		
		if(messageContents == null || messageContents.length<1){
			alert("���� ������ �ݵ�� �Է��ؾ� �մϴ�.");
			alert(messageContents);
			return;
		} */
		alert(sender);
		alert(receiver);
		alert(messageContents);
		
		$("form").attr("method", "POST").attr("action", "/integration/addSendMessage").submit();
		
	}
	
	
	
	$(function(){
		
		// ���� ����
		$( "#btn1" ).on("click" , function() {
			fncAddSendMessage();
		});
		
	 	$( "a:contains('����������')" ).on("click" , function() {
	 		location.href = "/integration/listSendMessage";
		});
	 	$( "a:contains('����������')" ).on("click" , function() {
	 		location.href = "/integration/listReceiveMessage";
		});
	 	
	 	/* $( "a:contains('����������')" ).on("click" , function() {
	 		location.href = "/integration/addSendMessage";
	 	}); */

 		$(".selectDelete_btn").on("click" , function() {
 		 	var confirm_val = confirm("���� �����Ͻðڽ��ϱ�?");
 		 	/* var messageNo = $("input[name='chBox']").val(); */
 		 	
  			if(confirm_val) {
 			  var messageArr = new Array();
   				
 		 	 $("input[class='messageNo']:checked").each(function(){
 		 		messageArr.push($(this).val());
   				alert(messageArr);
 			 });
 		 	 
 		  		$.ajax({
  			 	 url : "/integration/deleteTest",
	  		  	 type : "POST",
  		  	 	 data : { messageNo : messageArr },
    		 	 success : function(result){
   		   	 	 	if(result == 1){
    		 		 	location.href = "/integration/listSendMessage";
   		   	 	 	} else {
   		   	 	 		alert("���� ����")
   		   	 	 	}
  		  	 	}
  		  		});
 		   } 
 		});
 		
 		$(".deleteMessage").on("click" , function() {
 			alert("asd");
			var messageDelete = $(this).val()
			alert(messageDelete);
 			
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
 			$('.deleteMessage').remove();
 		});

		$('#modal').modal("hide"); //�ݱ� 
		 
		$('#modal').modal("show"); //����

	})
	
	</script>   	
</head>
<body>
	
	<jsp:include page="../common/toolbar.jsp" />
	
	<div class="contatiner">
	
		<div class="page-header text-info">
	       		<h3>���� ����</h3>
	    </div>
	    
	    <ul class="nav nav-tabs">
  			<li role="presentation"><a href="#">����������</a></li>
  			<li role="presentation"><a href="#">����������</a></li>
  			
		</ul>

		
			<div class="row">

				<div class="col-md-6 text-left">
					<p class="text-primary">��ü ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage} ������</p>
				</div>

			    <div class="col-md-6 text-right">
				    <form class="form-inline" name="detailForm">
				      
					  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
					  <input type="hidden" id="currentPage" name="currentPage" value=""/>
					  
					</form>
		    	</div>				
				
			</div>

			<table class="table table-hover table-striped">

				<thead>
					<tr>
						<th align="center">No</th>
						<th align="left">��������</th>
						<th align="left">�߽��� �̸���</th>
						<th align="left">��������</th>
						<th align="left">
	       						<div class="delBtn">
	       							<button type="button" class="selectDelete_btn">���û���</button>
	       						</div>	       					
	       						<div class="allCheck">
									<input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">��� ����</label>
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
					<c:set var="i" value="0" />
					<c:forEach var="message" items="${list}">
						<c:set var="i" value="${ i+1 }" />
						<tr>
							<td align="center">${ i }</td>
							<td align="left">${message.messageContents}</td>
							<td align="left">${message.sender.email}</td>
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
		    						<button type="button" class="deleteMessage" name="deleteMessage"  value="${message.messageNo}">����</button>
		   						</div>
				  			</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
		 <ul class="nav nav-tabs" name='send' style="float: right;">
	  				<button class="btn btn-primary" data-toggle="modal" data-target="#myModal">
					  ����������
					</button>
		</ul>
		
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">���� ������</h4>
		      </div>
		      <div class="modal-body">
		        <form>
		        	<input type="hidden" name="studyNo" value="">     
		        	<div class = "form-group">
		        		<label>�߽��� �̸���</label>
		        		<label type="hidden" class="form-control" id="message.sender.email" name="sender.email"  maxLength="512" style="height:30px" >
		        			${message.sender.email}
		        		</label>
		        	</div>
		        	<div class = "form-group">
		        		<label>������ �̸���</label>
		        		<textarea type="text" class="form-control" id="message.receiver.email" name="receiver.email" maxLength="512" style="height:30px" placeholder="�޴� ��� �̸����� �Է��ϼ���"></textarea>
		        	</div>		        	
		        	<div class = "form-group">
		        		<label>����</label>
		        		<textarea type="text" class="form-control" id="messageContents" name="messageContents" maxLength="2048" style="height:180px" placeholder="������ �Է��� �ּ���."></textarea>
		        	</div>
		        </form>
		      </div>
		      <div class="modal-footer">
		      	<button id="btn1" class="btn btn-default" >�����ϱ�</button>
		        <button type="button" class="btn btn-default" data-dismiss="modal">�� ��</button>
		      </div>
		    </div>
		  </div>
		 </div>		
		
		

	</div>
	
	<jsp:include page="../common/pageNavigator_new.jsp"/>

</body>
</html>








