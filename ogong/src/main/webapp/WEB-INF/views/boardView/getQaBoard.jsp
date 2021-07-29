<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<title>Q&A �Խ��� ����</title>


<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

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

	
	function getAnswerList() {
		var cnt = $('#cnt');
		$.ajax({
			url:"/board/listAnswer/"+boardNo,
			type:'get',	
			dateType:'json',
			success:function(res){
				var list = res;
				var ul = $('#listAnswer');

				for(var i=0 ; i<list.length ; i++){
					var record = list[i];
					var div = $("<div>");

					var title = $("<div class='boardTitle'>");
					var answerContents = $("<div class='answerContents'>");
					var answerDate = $("<div class='answerDate'>");
					var nickname = $("<div class='nickname'>");
					var button = $("<a id='modal-872384' href='#modal-container-872384' role='button'"
								+"class='btn' data-toggle='modal'>ä��</a>");
					
					title.text(boardTitle);
					answerContents.text(record.answerContents);
					answerDate.text(record.answerRegDate);
					nickname.text(record.answerWriter.nickname);
				
					title.appendTo(div);
					answerContents.appendTo(div);
					answerDate.appendTo(div);
					nickname.appendTo(div);
					
					div.appendTo(ul);
					
					ul.append()
				}
			}
		});
	}

	
	$(function() {
		getAnswerList();
		
		$('button:contains("�亯���")').on('click', function() {

			location.href = "/board/addAnswer?boardNo=" + boardNo;
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

@import
	url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Serif+KR:wght@600&family=Sunflower:wght@300&display=swap')
	;

body, table, div, p, th, td {
	font-family: 'Do Hyeon', sans-serif;
	font-size: 15px;
}

@import
	url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Serif+KR:wght@600&family=Sunflower:wght@300&display=swap')
	;

table {
font-family: 'Do Hyeon', sans-serif; 
margin: auto;
width: 800px;
height: 380px;
}


td {                         
text-align: center;     
width: 10em;                    
padding: 1em;   
} 


th {                             
text-align: center;                 
padding: 1em;
background-color: #FFDC3C;      
color: white;

}

tr {
border-color : black;
}


h1.con{
font-family: 'Do Hyeon', sans-serif; 
}

</style>
</head>



<body>
	<jsp:include page="../common/toolbar.jsp" />
	<jsp:include page="../integrationView/addSendMessage2.jsp" />
	<jsp:include page="../adminView/addReport.jsp" />	

	<br/>
	<h1 class="con" style="text-align:center"> Q&A �Խñ� ��</h1>
	<br />
	<section class="article-detail table-common con row">
	<input type="hidden" name="boardEmail" id="boardEmail" value="${board.writer.email}" />
		<table class="cell" border ="2">
			<tbody>
				<tr class="article-title">
					<th>����:</th>
					<td colspan="4">${board.boardTitle}</td>
					<th >�ۼ���</th>
					<td colspan="4">
						<div class="dropdown">
							<a id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
								${board.writer.nickname}
							</a>
							  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
							    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">�����ʺ���</a></li>
							    <li role="presentation"><a role="menuitem" tabindex="-1" href="#" data-toggle="modal" data-target="#myModal2">����������
							    <input type="hidden" value="${board.writer.email}" /></a></li>
							  </ul>									
						</div>
					</td>		
				</tr>
				<tr class="article-info">
					<th>�������</th>
					<td colspan="4">${board.boardRegDate}</td>
					<th>��ȸ��</th>
					<td colspan="4">${board.viewCount}</td>
				</tr>
				<tr class="article-body">
					<th>����</th>
					<td colspan="8"><br />
					<br />
					<br />
					<br />
					<br />
					<br />${board.boardContents}<br />
					<br />
					<br />
					<br />
					<br />
					<br />
					<br /></td>
				</tr>
			</tbody>
		</table>
	</section>
	<br />


	<div align="center">

		<button type="button" class="btn btn-success" style="width: 80px;">�亯���</button>

		<c:if test="${user.email == board.writer.email}">
			<button type="button" class="btn btn-warning" style="width: 60px;">����</button>
			<button type="button" class="btn btn-warning" style="width: 60px;">����</button>
		</c:if>
		<button type="button" class="btn btn-warning" style="width: 60px;">���</button>
		<button type="button" class="btn btn-danger" style="width: 60px;" data-toggle="modal" data-target="#myModalReport">�Ű�</button>
	</div>

	<br/>
	<hr/>
	<div class="answer-header">
		<h1>${board.answerCount}���� �亯�� �޷Ƚ��ϴ�.</h1>
	</div>
	<ul id="listAnswer">

	</ul>
	<div class="modal fade" id="modal-container-872384" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel">ä��Ȯ�� ����</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">��</span>
					</button>
				</div>
				<div class="modal-body">�� ���� ä���Ͻðڽ��ϱ�?</div>
				<div class="modal-footer">

					<button type="button" class="btn btn-primary">��</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">�ƴϿ�</button>
				</div>
			</div>
		</div>
	</div>


	</div>

	</div>
	</div>

</body>
</html>