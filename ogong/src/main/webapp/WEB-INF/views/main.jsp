<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://kit.fontawesome.com/e3409dba93.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Serif+KR:wght@600&family=Sunflower:wght@300&display=swap')
	;
body, table, div, p, th, td {
	font-family: 'Do Hyeon', sans-serif;
}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/toolbar.jsp" />
	
	<body>

	
	<div class="contatiner">
		<table class="table table-bordered">
		  	<thead>   
		  	    <tr>	       		
   					<th align="center">1~5 ��</th>
   					<th align="left">�г���</th>
   					<th align="left">ä�ü�</th>
	    		</tr>
	    	</thead>
	    	<tbody class="ct_list_pop">
	    		<c:set var="i" value="0"/>
	    		<c:forEach var="answer" items="${list}">
	    			<c:set var="i" value="${i+1}"/>
				    		<tr>
				    			<td align="center">${i}��</td>
				    			<td align="left">${answer.answerWriter.email}</td>
				    			<td align="left">${answer.adoptionCount}</td>
				    		</tr>
	    		</c:forEach>
	    	</tbody>	
		</table>
		
		<table class="table table-bordered">
		  	<thead>   
		  	    <tr>	       		
   					<th align="center">1~5 ��</th>
   					<th align="left">�г���</th>
   					<th align="left">�ٳ��� ��</th>
	    		</tr>
	    	</thead>
	    	<tbody class="ct_list_pop">
		 	 	<c:set var="i" value="0" />
		  		<c:forEach var="user" items="${list2}">
		  			<c:set var="i" value="${ i+1 }" />
		  			<tr>
			  			<td align="center">${i}��</td>
			  			<td align="left">${user.nickname}</td>
			  			<td align="left">${user.bananaCount}</td>
		  			</tr>
		  		</c:forEach>
	    	</tbody>	
		</table>
				
	</div>

  	 

</body>

	<button type="button" class="btn btn-primary btn-lg"
		data-toggle="modal" data-target="#myModal">������ ����</button>
	<!-- ��� ���� -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">��</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container">

						<div class="page-header">
							<h1>${user.nickname}��������</h1>
						</div>

						<input type="hidden" name="email" value="${user.email}" />
						<!--  ���簪 -->


						<hr />

						<div class="row">
							<div class="col-xs-4 col-md-2 ">
								<strong>�г���</strong>
							</div>
							<div class="col-xs-8 col-md-4">${user.nickname}</div>
						</div>

						<hr />

						<div class="row">
							<div class="col-xs-4 col-md-2 ">
								<strong>�̸�</strong>
							</div>
							<div class="col-xs-8 col-md-4">${user.name}</div>
						</div>

						<hr />

						<div class="row">
							<div class="col-xs-4 col-md-2 ">
								<strong>�������</strong>
							</div>
							<div class="col-xs-8 col-md-4">${user.birth}</div>
						</div>

						<hr />

						<div class="row">
							<div class="col-xs-4 col-md-2">
								<strong>��ǥ�� ����</strong>
							</div>
							<div class="col-xs-8 col-md-4">${user.goal}</div>

						</div>
						<hr>
						<div class="row">


							<div class="col-xs-4 col-md-2">
								<strong>���ɻ�</strong>
							</div>

							<button type="button" class="btn btn-default btn-lg">${user.studyInterest1}</button>
							<button type="button" class="btn btn-default btn-lg">${user.studyInterest2}</button>
							<button type="button" class="btn btn-default btn-lg">${user.studyInterest3}</button>

						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary">Ȯ��</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">���</button>
					</div>
</body>