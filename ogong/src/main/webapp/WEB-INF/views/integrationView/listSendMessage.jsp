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
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  CSS �߰� : ���ٿ� ȭ�� ������ ���� �ذ� :  �ּ�ó�� ��, �� Ȯ��-->
	<style>
        body {
            padding-top : 70px;
        }
   	</style>
   	
	<script type="text/javascript">
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/adminView/listUserReport").submit();
	}
	
	function fncupdateSuspendUser(){
		
		
		$("form").attr("method" , "POST").attr("action" , "/admin/updateSuspendUser").submit();
		
	}
	
	$(function(){
		// �˻�
		$( "td.ct_btn01:contains('�˻�')").on("click", function(){
			fncGetList(1);
		});	
		
	 	$( "a:contains('����������')" ).on("click" , function() {
	 		location.href = "/integration/listSendMessage";
		});
	 	
	 	$( "a:contains('����������')" ).on("click" , function() {
	 		location.href = "/integration/listReceiveMessage";
	 	});
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
			<div class="col-md-5 text-right">
				<input type="submit" class="deleteMessage" name="cmd" value="����">
			</div>
		</div>
	    
	    <table class="table table-hover table-striped" >
	    
	    	<thead>
	    		<tr>	       		
	       					<th align="center">No</th>
	       					<th align="left">��������</th>
	       					<th align="left">��������</th>
	       					<th align="left">����</th>
	    		</tr>
	    	</thead>
	    	<tbody>
		 	 	<c:set var="i" value="0" />
		  		<c:forEach var="message" items="${list}">
		  			<c:set var="i" value="${ i+1 }" />
		  			<tr>
		  			<td align="center">${ i }</td>
		  			<td align="left">${message.messageContents}</td>
		  			<td align="left">${message.sendDate}</td>
		  			<td align="left"><input type="checkbox" name="del" value="${message.messageNo}"></td>
		  			</tr>
		  		</c:forEach>
	    	</tbody>
	    			
	    </table>
	    
	  	 <ul class="nav nav-tabs" name='btn' style="float: right;">
  			<li role="presentation"><a href="#">����������</a></li>
		</ul>
	    	
	</div>
	
	<jsp:include page="../common/pageNavigator_new.jsp"/>

</body>
</html>