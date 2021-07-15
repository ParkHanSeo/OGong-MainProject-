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
   	
	<script type="text/javascript">
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/adminView/listUserReport").submit();
	}
	

	
	$(function(){


		$( "td.ct_btn01:contains('�˻�')").on("click", function(){
			fncGetList(1);
		});	
		
		$("td:contains('����')").on("click", function(){
			/* fncupdateUserSuspend() */
			var email = $(this).find('input').val()
			alert(email);
			location.href = "/admin/updateSuspendUser?receiveReporter="+$(this).attr('email');
		});
		
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
	       		<h3>�Ű�� ����� ��� ��ȸ</h3>
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
				  
				  <button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>		    
	    	
	    </div>
	    
	    <table class="table table-hover table-striped" >
	    
	    	<thead>
	    		<tr>	       		
	       					<th align="center">No</th>
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
		  			<td align="left">${report.reportReason}</td>
		  			<td align="left">${report.receiveReporter.nickname}</td>
		  			<td align="left">${report.reportDate}</td>
		  			<td align="left" email="${report.receiveReporter.email}">
		  			<c:if test="${report.receiveReporter.condition eq '1'}">
		  				����
		  			</c:if>
		  			<c:if test="${report.receiveReporter.condition eq '2'}">
		  				�����Ϸ�
		  			</c:if>
		  			<input type="hidden" name="email" value="${report.receiveReporter.email}"/>
		  			</td>
		  			</tr>
		  		</c:forEach>
	    	</tbody>
	    	
	    </table>
	    
	</div>
	
	<jsp:include page="../common/pageNavigator_new.jsp"/>

</body>
</html>





