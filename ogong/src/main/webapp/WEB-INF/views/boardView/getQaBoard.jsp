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
	let adoptionFlag = "<c:out value='${board.adoptionFlag}'/>";
	
	
	let currentPage = 1;
	let pageSize = 10;
	
	function fncDeleteBoard() {

		if (confirm("���� �Ͻðڽ��ϱ�?")) {

			location.href = "/board/deleteBoard?boardNo="+`${board.boardNo}`+"&boardCategory="+`${board.boardCategory}`; 
		}
	}

	
	function adoption(answerNo) {
		var adp = $('#adp');
		var ul = $('#listAnswer');
		$.ajax({
			url:'/board/json/updateAdoption/'+answerNo+'/'+boardNo,
			type:'get',
            headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json"
             },
			dateType:'json',
			success:function(JSONData, status){
				adoptionFlag = 1
				ul.empty()
				getAnswerList() 
			}
		});
			
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
				var display = "";
						
				$("#answerCnt").text(list.length);
				for(var i=0 ; i<list.length ; i++){
					var record = list[i];
              		 if (adoptionFlag != '1') {
						display += '<div id="recommend" class="btn-sm btn-danger" onclick="adoption('+record.answerNo+')" style="width: 60px;">ä��<span id="cnt"></span></div>';
              		}
              		 if (record.adoptionFlag == '1'){
              			 display += '<div class="btn-sm btn-warning" id="adoptionc" style="width: 60px;">ä�ÿϷ�<span id="cnt"></span>'
              					 + '</div>'
              		 }
              			 
						display += '<br />'
						+ '<div>'
						+ '<table class="cell text-scenter"   border ="2">'
						+ '<tbody>'
						+ '<tr class="article-title">'
						+ '<th>����:</th>'
						+ '<td colspan="4">RE:'+boardTitle+'</td>'
						+ '<th>�ۼ���</th>'
						+ '<td colspan="4">'+record.answerWriter.nickname+'</td>'
						+ '</tr>'
						+ '<tr class="article-info">'
						+ '<th>�������</th>'
						+ '<td colspan="8">'+record.answerRegDate+'</td>'
						+ '</tr>'
						+ '<tr class="article-body">'
						+ '<th>����</th>'
						+ '<td colspan="8"><br />'
						+ '<br />'
						+ '<br />'
						+ '<br />'
						+ '<br />'
						+ '<br />'+record.answerContents+'<br />'
						+ '<br />'
						+ '<br />'
						+ '<br />'
						+ '<br />'
						+ '<br />'
						+ '<br /></td>'
						+ '</tr>'
						+ '</tbody>'
						+ '</table>';
						if (record.answerWriter.email == "${user.email}"){
	              			 display += "<div class='row'>"
	              					 + '<div class="col-sm-12 text-center">'   
	              					 + '<br/>'
	              				 	 + "<button type='button' class='btn btn-warning' onclick='updateAnswer(\""+record.answerNo+"\")' style='height: 40px;'>�亯 ����</button>&nbsp;"
	              					 + '<button type="button" class="btn btn-warning" onclick="deleteAnswer('+record.answerNo+')" style="height: 40px;">�亯 ����</button>';
	              					 + '</div>'
	              					 + '</div>' 
	              		 }
						display += '<br/>';
									
				}
				
				$("#listAnswer").append(display);
							

				}
		});
	}

	
	function updateAnswer(answerNo) {
		location.href = "/board/updateAnswer?answerNo=" + answerNo;
	}
	
	
	
	function deleteAnswer(answerNo) {
		 $.ajax({
			url:'/board/deleteAnswer',
			type:'post',
            headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json"
            },
            data : JSON.stringify({
            	"answerNo" : answerNo,
            	"boardNo" : boardNo
            }), 
			dateType:'json',
			success:function(JSONData, status){
				if(JSONData){
					$("#listAnswer").children().remove();
					getAnswerList();
					
				} else{
					alert("����");
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
	text-align: center;
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

.btn-group-sm > .btn, .btn-sm {
    padding: .25rem .5rem;
    font-size: .875rem;
    line-height: 1.5;
    border-radius: .2rem;
    margin: 0 auto;
}

</style>
</head>



<body>
	<jsp:include page="../common/toolbar.jsp" />

	<br/>
	<h1 class="con" style="text-align:center"> Q&A �Խñ� ��</h1>
	<br />
	<section class="article-detail table-common con row">

		<table class="cell" border ="2">
			<tbody>
				<tr class="article-title">
					<th>����:</th>
					<td colspan="4">${board.boardTitle}</td>
					<th>�ۼ���</th>
					<td colspan="4">${board.writer.nickname}</td>
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
					<br />${answer.boardContents}<br />
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
			<button type="button" class="btn btn-warning" style="width: 60px;">�� ��</button>
			<button type="button" class="btn btn-warning" style="width: 60px;">�� ��</button>
		</c:if>
		<button type="button" class="btn btn-warning" style="width: 60px;">�� ��</button>
		<button type="button" class="btn btn-danger" style="width: 60px;">�� ��</button>
	</div>

	<br/>
	<br/>
	<br/>
	<hr/>
	<div class="answer-header">
	<h1>&nbsp&nbsp&nbsp<span id="answerCnt">${board.answerCount}</span>���� �亯�� �޷Ƚ��ϴ�.</h1>
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


</body>
</html>