<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset = "EUC-KR">
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	

   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  CSS �߰� : ���ٿ� ȭ�� ������ ���� �ذ� :  �ּ�ó�� ��, �� Ȯ��-->
	<style>
        body {
            padding-top : 50px;
        }
   	</style>
   
   	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	function fncGetList(currentPage) {
		$("input[name='currentPage']").val(currentPage)
		if(${reportType == 1}){
			$("#currentPage").val(currentPage)
			$("form[name='detailForm']").attr("method" , "POST").attr("action" , "/admin/listReport?reportType=1").submit();
		}
		else if(${reportType == 2}){
			$("#currentPage").val(currentPage)
			$("form[name='detailForm']").attr("method" , "POST").attr("action" , "/admin/listReport?reportType=2").submit();
		}
		else if(${reportType == 3}){
			$("#currentPage").val(currentPage)
			$("form[name='detailForm']").attr("method" , "POST").attr("action" , "/admin/listReport?reportType=3").submit();
		}
	}
	
	function fncupdateUserSuspend(email){
		$("form[name='updateSuspendUser']").attr("method", "POST").attr("action", "/admin/updateSuspendUser").submit();
	}
	
	$('.radio-value').on('click', function() {
	    var suspendType = $('.radio-value:checked').val(); // üũ�� Radio ��ư�� ���� �����ɴϴ�.
	    
	    if ( suspendType == '1' ) {
	        $('.radio-value-detail').attr('suspendType', 1);
	        $('.radio-value-detail').focus(); 
	    } else if ( suspendType == '2' ) {
	        $('.radio-value-detail').attr('suspendType', 2); 
	        $('.radio-value-detail').focus();
	    } else if ( suspendType == '3' ) {
	        $('.radio-value-detail').attr('suspendType', 3);
	        $('.radio-value-detail').focus(); 
	    }
	});	
	
	$(function(){
		// �˻�
		$("button[name='search']").on("click", function(){
			fncGetList(1);
		});	
		
		// ���� 
 		$( "#btn1" ).on("click" , function() {
			var email = $('#email2').val()
			/* alert(email); */			
			fncupdateUserSuspend(email)
		}); 
		
		// �����_
	    $('tr td:nth-child(6)').on("click", function(){
	    	$('#email').val($(this).find('input').val());	    	
	    })
		
		
 		$('#modal').modal("hide"); //�ݱ� 
		 
		$('#modal').modal("show"); //���� 
		
	 	
	 	$( "a:contains('�Ű�� ����� ���')" ).on("click" , function() {
	 		location.href = "/admin/listUserReport";
		});
	 	
	 	$( "a:contains('�Ű�� �Խñ� ���')" ).on("click" , function() {
	 		location.href = "/admin/listReport?reportType="+1;
		});
	 	
	 	$( "a:contains('�Ű�� �亯 ���')" ).on("click" , function() {
	 		location.href = "/admin/listReport?reportType="+2;
		});
	 	
	 	$( "a:contains('�Ű�� ��� ���')" ).on("click" , function() {
	 		location.href = "/admin/listReport?reportType="+3;
		});	
		
	})
	
	</script>   	
</head>
<body>
	
	<jsp:include page="../common/toolbar.jsp" />
	
	<div class="contatiner">
	
		<div class="page-header text-info">
		
	       		<c:if test="${reportType == 1}">
	       				<h3>�Ű�� �Խñ� ���</h3>
	       		</c:if>
	       		<c:if test="${reportType == 2}">
	       				<h3>�Ű�� �亯 ���</h3>
	       		</c:if>
	       		<c:if test="${reportType == 3}">
	       				<h3>�Ű�� ��� ���</h3>
	       		</c:if>
	       		
	    </div>
	    
	    <ul class="nav nav-tabs">
  			<li role="presentation"><a href="#">�Ű�� ����� ���</a></li>
  			<li role="presentation"><a href="#">�Ű�� �Խñ� ���</a></li>
  			<li role="presentation"><a href="#">�Ű�� �亯 ���</a></li>
  			<li role="presentation"><a href="#">�Ű�� ��� ���</a></li>
		</ul>
	    
	    <div class="row">
	    
	    	<div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
								<option value="0" ${ search.searchCondition eq '0' ? 'selected' : '' }>�г���</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" name="search" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>		    
	    	
	    </div>
	    
	    <table class="table table-hover table-striped" >
	    
	    	<thead>
	    		<tr>	       		
	       					<th align="center">No</th>
	       				<c:if test="${reportType == 1}">
	       					<th align="left">�Խñ�����</th>
	       				</c:if>
	       				<c:if test="${reportType == 2}">
	       					<th align="left">�亯����</th>
	       				</c:if>
	       				<c:if test="${reportType == 3}">
	       					<th align="left">��۳���</th>
	       				</c:if>
	       					<th align="left">�Ű����</th>
	       					<th align="left">�г���</th>
	       					<th align="left">�Ű�����</th>
	       					<th align="left">����</th>
	    		</tr>
	    	</thead>
	    	
	    	<tbody class="ct_list_pop">
		 	 	<c:set var="i" value="0" />
		  		<c:forEach var="report" items="${list}">
		  			<c:set var="i" value="${ i+1 }" />
		  			<tr>
		  			<td align="center">${ i }</td>
		  			<td align="left">
		  			<c:if test="${reportType == 1}">
		  				<div class="report"	reportNo="${report.reportNo}">${report.reportBoard.boardTitle}</div>
		  			</c:if>
		  			<c:if test="${reportType == 2}">
		  				<div class="report"	reportNo="${report.reportNo}">${report.reportAnswer.answerContents}</div>
		  			</c:if>
		  			<c:if test="${reportType == 3}">
		  				<div class="report"	reportNo="${report.reportNo}">${report.reportComment.commentContents}</div>
		  			</c:if>		  					  			
		  			</td>
		  			<td align="left">${report.reportReason}</td>
		  			<td align="left">${report.receiveReporter.nickname}</td>
		  			<td align="left">${report.reportDate}</td>
		  			
		  			<td align="left" email="${report.receiveReporter.email}">
		  			<c:if test="${report.receiveReporter.condition eq '1'}">
						<button class="btn btn-primary" data-toggle="modal" data-target="#myModal">
						  <input type="hidden" name="email2" id="email2" value="${report.receiveReporter.email}"/>
						   ����
						</button>
		  			</c:if>
		  			<c:if test="${report.receiveReporter.condition eq '2'}">
		  				�����Ϸ�
		  			</c:if>
		  			</td>
		  				
		  			</tr>
		  		</c:forEach>
	    	</tbody>
	    	
	    </table>
	    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">����� ����</h4>
		      </div>
		      <div class="modal-body">
		        <form class="form-horizontal" method="post" name="updateSuspendUser">
		        	<input type="hidden" id="email" name="email" value="${report.receiveReporter.email}"/>   
		        	<div class = "form-group">
					  <fieldset>
			   				 <legend>���� ���� ���� </legend>
			   				 <label for="radio-1 ">7��</label>
			    			 <input type="radio" class="radio-value" name="suspendType" id="suspendType" value="1">
			   				 <label for="radio-2">30��</label>
			   				 <input type="radio" class="radio-value" name="suspendType" id="suspendType" value="2">
			   				 <label for="radio-3">��������</label>
			    			 <input type="radio" class="radio-value" name="suspendType" id="suspendType" value="3">
			  			</fieldset>
		        	</div>
		        </form>
		      </div>
		      <div class="modal-footer">
		      	<button id="btn1" class="btn btn-default" >�� ��</button>
		        <button type="button" class="btn btn-default" data-dismiss="modal">�� ��</button>
		      </div>
		    </div>
		  </div>
		 </div>	
	</div>
	
	<jsp:include page="../common/pageNavigator_new.jsp"/>

</body>
</html>





