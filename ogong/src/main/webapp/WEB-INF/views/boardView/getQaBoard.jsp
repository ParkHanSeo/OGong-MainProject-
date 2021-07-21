<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<title>�Խ���</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 -->
 <script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>  
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>



<script>
	let boardNo = "<c:out value='${board.boardNo}'/>";
	let boardCategory = "<c:out value='${board.boardCategory}'/>";
	let boardTitle = "<c:out value='${board.boardTitle}'/>";
	
	let currentPage = 1;
	let pageSize = 10;
	
	function fncDeleteBoard() {

		if (confirm("���� �Ͻðڽ��ϱ�?")) {

			location.href = "/board/deleteBoard?boardNo="+`${board.boardNo}`+"&boardCategory="+`${board.boardCategory}`; 
		}
	}

	
	function recommend() {
		var cnt = $('#cnt');
		$.ajax({
			url:'/board/updateRecommend',
			type:'post',
			data: {
				'boardNo': boardNo
			},
			dateType:'json',
			success:function(res){
				cnt.text(res);
			}
		});
	}
	
	
	function getCommentList(type) {
		if('M' === type){
			currentPage = currentPage+1; 
		}
		$.ajax({
			url:'/board/listComment',
			type:'get',
			data: {
				'boardNo': boardNo,
				'currentPage': currentPage,
				'pageSize': pageSize
			},
			dateType:'json',
			success:function(res){
				var list = res.list;
				var ul = $('#listComment');
				
				for(var i=0 ; i<list.length ; i++){
					var record = list[i];
					var li = $("<li>");

					var commenContents = $("<div class='commenContents'>");
					var commentRegDate = $("<div class='commentRegDate'>");
					var nickname = $("<div class='nickname'>");
					

					commenContents.text(record.commentContents);
					commentRegDate.text(record.commentRegDate);
					nickname.text(record.nickname);
				

					commenContents.appendTo(li);
					commentRegDate.appendTo(li);
					nickname.appendTo(li);
					
					li.appendTo(ul);
				}
			}
		});
	}
	
	function addComment() {
		var commentContents = $('#comment').val();
		currentPage = 1; 
		$.ajax({
			url:'/board/addComment',
			type:'post',
			data: {
				'boardNo': boardNo,
				'currentPage': currentPage,
				'pageSize': pageSize,
				'commentContents': commentContents
			},
			dateType:'json',
			success:function(res){
				if (res) {
					var ul = $('#listComment');
					ul.children('li').remove();
					
					getCommentList();
				} else{
					alert('����');
				}
			}
		});
	}
	
	function more() {
		getCommentList('M');
	}
	
	$(function() {
		getCommentList();
		
		$('button:contains("�亯���")').on('click', function() {

			location.href = "/board/addBoard?boardCategory=" + boardCategory +"&boardTitle=" +boardTitle;
		})
		
		$('button:contains("�� ��")').on('click', function() {

			location.href = "/board/updateBoard?boardNo=" + boardNo;
		})

		$('button:contains("�� ��")').on('click', function() {

			fncDeleteBoard();
		})

		$('button:contains("�� ��")').on('click', function() {

			location.href = "/board/listBoard?boardCategory=" + boardCategory;
		})
	})
	
	
</script>
<style>
body{
	padding-top: 20px;
}

pre {
	border: 0;
	background-color: transparent;
}
</style>
</head>

<body>
	<jsp:include page="../common/toolbar.jsp" />

	<div class="container">
		<div class="page-header">
			<h3 class=" text-default">Q&A �󼼺���</h3>
		</div>

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>�������</strong>
			</div>
			<div class="col-xs-8 col-md-4">${board.boardRegDate}</div>
		</div>

		<hr />
		<div class="row">
			<div class="col-xs-1 col-md-1">
				<strong>��ȸ��</strong>
			</div>
			<div class="col-xs-8 col-md-3">${board.viewCount}</div>
		</div>

		<hr />
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>�� ��</strong>
			</div>
			<div class="col-xs-8 col-md-4">${board.boardTitle}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>�� ��</strong>
			</div>
			<div class="col-xs-8 col-md-4">
				<pre style="width: 450px; height: 150px;">${board.boardContents}</pre>
			</div>
		</div>

		<hr />
		


		<div align="right">
			<div id="recommend" class="btn btn-default" onclick="recommend()" style="width: 60px;">�� õ <span id="cnt">0 </span></div>
			
			<c:if test="${user.userId == board.writer.email || user.role == 'admin'}">
				<c:if test="${user.userId == board.writer.email}"> 
				
				
					<button type="button" class="btn btn-default" style="width: 80px;">�亯���</button>
					
					<button type="button" class="btn btn-default" style="width: 60px;">�� ��</button>
				</c:if> 
				<button type="button" class="btn btn-default" style="width: 60px;">�� ��</button>
 			</c:if> 
			<button type="button" class="btn btn-default" style="width: 60px;">�� ��</button>
		</div>
	</div>

</body>
</html>