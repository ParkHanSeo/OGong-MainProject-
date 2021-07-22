<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<title>Q&A �Խ���</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<script type="text/javascript">
	function fncGetList(currentPage) {

		$('#currentPage').val(currentPage);
		$('form').attr('action','/board/listQaBoard/').attr('method','POST').submit();
	}
	
	function fncWrite(user) {
		
		location.href = "/board/addBoard?boardCategory="+`${boardCategory}`;
	}

	$(function() {

		$('tbody td:nth-child(2)').on('click', function() {
			let boardNo = $(this).children('input').val();
			location.href = "/board/getBoard?boardNo=" + boardNo;
		})
		
		$('button:contains("�˻�")').on('click', function(){
			
			fncGetList('1');
		})
		
	})
	
	$(function(){
			
			 $("#searchKeyword").keydown(function (key) {
			 
		        if(key.keyCode == 13){
		        	fncGetList('1');
		        }
		    });
		});
	
</script>


<style>
body {
	padding-top: 30px;
}
</style>
</head>

<body>
	<jsp:include page="../common/toolbar.jsp" />

	<div class="container">

		<div class="page-header text-default">
				<c:if test="${boardCategory == '1'}">
	       				<h3>�������� �Խ���</h3>
	       		</c:if>
	       		<c:if test="${boardCategory == '2'}">
	       				<h3>Q&A �Խ���</h3>
	       		</c:if>

	       		<c:if test="${boardCategory == '3'}">
	       				<h3>�հ��ı� �Խ���</h3>
	       		</c:if>
	       		<c:if test="${boardCategory == '4'}">
	       				<h3>���� �Խ���</h3>
	       		</c:if>
	       		<c:if test="${boardCategory == '5'}">
	       				<h3>�������͵� ���� �Խ���</h3>
	       		</c:if>
	       		<c:if test="${boardCategory == '6'}">
	       				<h3>���ϰ��� �Խ���</h3>
	       		</c:if>
		</div>

		<!-- table ���� �˻� Start /////////////////////////////////////-->
		<div class="row">
	<div align="center" id="bbs" class="col-md-10 offset-md-1">
		<h1>Q&A �Խ���</h1>

			<!-- �˻� �� ����--------------------- -->
		<form name="sf" action="find" onsubmit="return check()">
			<div class="row m-4">
				<div class="col-md-2">
					<select name="findType" class="form-control">
						<option value="">::�˻� ����::</option>
						<option value="1">������</option>
						<option value="2">�ۼ���</option>
						<option value="3">�۳���</option>
					</select>
				</div>
				<div class="col-md-8">
					<input type="text" name="findKeyword" class="form-control"
						placeholder="�˻�� �Է��ϼ���">
				</div>
				<div class="col-md-2">
					<button type="button" onclick="check()" class="btn btn-warning">�˻�</button>
				</div>
			</div>
			<!--  row end -->
		</form>
		<!-- �˻� �� ��---------------------- -->


		<table class="table table-condensed table-striped">
			<tr>
				<th>&nbsp;&nbsp;&nbsp; �۹�ȣ</th>
				<th>����</th>
				<th>�۾���</th>
				<th>��ȸ��</th>
				<th>��¥</th>
			</tr>
			<!-- ---------------------------- -->
		<tbody>
			<c:forEach var="board" items="${list}">
					<tr>
						<td align="center">${board.boardNo}</td>
						<td align="left">${board.boardTitle}<input type="hidden" value="${board.boardNo}" /></td>
						<td align="left">${board.writer.nickname}</td>
						<td align="left">${board.viewCount}</td>
						<td align="left">${board.boardRegDate}</td>
					</tr>
				</c:forEach>
		</tbody>		
			<!-- ----------------------------- -->
			
			<tr>
				<td colspan="3" class="text-center">
					${navi}
				</td>
				<td colspan="2">�ѰԽù���: <span class="text-danger"
					style="font-weight: bold">${page.totalCount}��</span> <br> <span
					class="text-danger" style="font-weight: bold">${page.pageUnit
					}</span>
					/${page.pageCount} pages
				</td>
			</tr>
		</table>
		
				<div align="right">
			<button type="button" class="btn btn-warning" style="width: 80px;"
				onclick="javascript:fncWrite('${writer.email}')">�۾���</button>
		</div>
	</div>
</div>
</body>
</html>
