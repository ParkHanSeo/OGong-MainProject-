<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>    
<html>
<head>

	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script type="text/javascript" src="../javascript/calendar.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
	
<script type="text/javascript">



	
	 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#btn1" ).on("click" , function() {
				fncAddSendMessage();
			});
		});	
		
		//============= "���"  Event ó�� ��  ���� =============
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
		
		function fncAddSendMessage(){
			//Form ��ȿ�� ����
		 	//var name = document.detailForm.prodName.value;
			//var detail = document.detailForm.prodDetail.value;
			//var manuDate = document.detailForm.manuDate.value;
			//var price = document.detailForm.price.value;
			var sender = "${message.sender.email}";
			var receiver = $("input[name='receiver.email']").val();
			var messageContents = $("input[name='messageContents']").val();
			
			
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
//	$( function() {
//		    $( "#manuDate" ).datepicker();
//	});


</script>
</head>

<body>
	


	<div class="container">
		
		<h1 class="bg-primary text-center">����������</h1>
	
<form class="form-horizontal" method="post" name="addSendMessage" >

  <!-- �߽��� �̸��� ��� -->
  <div class="form-group">
    <label for="message.sender.email" class="col-sm-offset-1 col-sm-3 control-label">�߽��� �̸���</label>
    <input type="hidden" name="sender.email" value="${message.sender.email}"/>
    <div class="col-sm-4">${message.sender.email}</div>
  </div> 
  
  <!-- ������ �̸��� �Է� -->
   <div class="form-group">
    <label for="message.receiver.email" class="col-sm-offset-1 col-sm-3 control-label">������ �̸���</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="message.receiver.email" name="receiver.email" placeholder="�޴� ��� �̸����� �Է��ϼ���">
    </div>
  </div>
  
  <!-- ���� �Է� -->
   <div class="form-group">
    <label for="messageContents" class="col-sm-offset-1 col-sm-3 control-label">����</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" rows="15" id="messageContents" name="messageContents" placeholder="������ �Է��� �ּ���.">
    </div>
  </div>  
  
  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" id="btn1" class="btn btn-info"  >��&nbsp;��&nbsp;��</button>
			  <a class="btn btn-info btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
</form>

</div>
</body>
</html>