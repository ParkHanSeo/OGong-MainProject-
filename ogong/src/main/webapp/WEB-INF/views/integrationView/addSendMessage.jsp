<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    


	<script type="text/javascript">

	
	function fncAddSendMessage(){
		//Form ��ȿ�� ����

		var sender = "${message.sender.email}";
		var receiver = $("textarea[name='receiver.email']").val();
		var messageContents = $("textarea[name='messageContents']").val();
		
		alert(sender);
		alert(receiver);
		alert(messageContents);
		
		if(receiver == null || receiver.length<1){
			alert("������ �̸����� �ݵ�� �Է��ؾ� �մϴ�.");
			return;
		}
		
		if(messageContents == null || messageContents.length<1){
			alert("���� ������ �ݵ�� �Է��ؾ� �մϴ�.");
			return;
		} 
		
		alert("������ ���������� ���½��ϴ�.");
		
		$("form[name='addSendMessage']").attr("method", "POST").attr("action", "/integration/addSendMessage").submit();
		
	}
	
	
	
	$(function(){
		
		// ���� ����
		$( "#btn1" ).on("click" , function() {
			fncAddSendMessage();
		});
		


	})
	
	</script>   	



	
	
	
	<%-- <jsp:include page="../common/toolbar.jsp" /> --%>


<div class="contatiner">
	<!-- Modal ���� ������-->
	<form name="addSendMessage">
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">���� ������1</h4>
					</div>
					<div class="modal-body">
						<form>
							<input type="hidden" name="studyNo" value="">
							<div class="form-group">
								<label>�߽��� �̸���</label> <label type="hidden" class="form-control"
									id="message.sender.email" name="sender.email" maxLength="512"
									style="height: 30px"> ${message.sender.email} </label>
							</div>
							<div class="form-group">
								<label>������ �̸���</label>
								<textarea type="text" class="form-control"
									id="message.receiver.email" name="receiver.email"
									maxLength="512" style="height: 30px"
									placeholder="�޴� ��� �̸����� �Է��ϼ���"></textarea>
							</div>
							<div class="form-group">
								<label>����</label>
								<textarea type="text" class="form-control" id="messageContents"
									name="messageContents" maxLength="2048" style="height: 180px"
									placeholder="������ �Է��� �ּ���."></textarea>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button id="btn1" class="btn btn-default">�����ϱ�</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">��
							��</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>



<%-- <jsp:include page="../common/pageNavigator_new.jsp"/> --%>
