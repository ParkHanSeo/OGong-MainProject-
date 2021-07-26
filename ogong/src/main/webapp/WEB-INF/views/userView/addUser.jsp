<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

 <!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ȸ������</title>
        <!-- Bootstrap -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- jQuery (��Ʈ��Ʈ���� �ڹٽ�ũ��Ʈ �÷������� ���� �ʿ���) -->
        <script src="http://code.jquery.com/jquery.js"></script>
        <!-- ��� ������ �÷������� �����ϰų� (�Ʒ�) �ʿ��� ������ ���ϵ��� �����ϼ��� -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!-- Respond.js ���� IE8 ���� ������ ����� Ȱ��ȭ�ϼ��� (https://github.com/scottjehl/Respond) -->
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    </head>
    <body>
        <div class="container"><!-- �¿����� ���� Ȯ�� -->
            <!-- ��� ���� �κ� -->
            
            <div class="row">
                <p></p>
                <div class="col-md-12">
                    <small>
                    <a href="#">�α���</a> | <a href="#">ȸ������</a>
                    </small>
                </div>
            </div>
            <!--// ��� ���� �κ� -->
            <!-- ���â -->
            <div class="modal fade" id="defaultModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">��</button>
                            <h4 class="modal-title">�˸�</h4>
                        </div>
                        <div class="modal-body">
                            <p class="modal-contents"></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            <!--// ���â -->
            <hr/>
            <!-- ���� ���� �κ� -->
                
 
 
            <form class="form-horizontal" role="form" method="post" action="javascript:alert( 'success!' );">
                <div class="form-group">
                
                   
                    </div>
                </div>

                
                                <div class="form-group" id="divEmail">
                    <label for="inputEmail" class="col-lg-2 control-label">�̸���</label>
                    <div class="col-lg-10">
                        <input type="email" class="form-control" id="email" data-rule-required="true" placeholder="�̸���" maxlength="40">
                    </div>
                                   <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button type="submit" class="btn btn-primary">�̸��� ����</button>
                    </div>
                </div>
                </div>
                
                
                
                                                <div class="form-group" id="divEmail">
                    <label for="inputEmail" class="mail_check_input_box">�̸��� ������ȣ</label>
                    <div class="col-lg-10">
                        <input class="form-control" id="email" data-rule-required="true" placeholder="�̸��� ������ȣ" maxlength="40">
                    </div>
                    
                </div>
                
                
                
                <div class="form-group" id="divPassword">
                    <label for="inputPassword" class="col-lg-2 control-label">�н�����</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control" id="password" name="password" data-rule-required="true" placeholder="�н�����" maxlength="30">
                    </div>
                </div>
                <div class="form-group" id="divPasswordCheck">
                    <label for="inputPasswordCheck" class="col-lg-2 control-label">�н����� Ȯ��</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control" id="passwordCheck" data-rule-required="true" placeholder="�н����� Ȯ��" maxlength="30">
                    </div>
                </div>

                
                <div class="form-group" id="divNickname">
                    <label for="inputNickname" class="col-lg-2 control-label">�г���</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control" id="nickname" data-rule-required="true" placeholder="����" maxlength="15">
                    </div>
                </div>
                


              
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button type="submit" class="btn btn-primary">Sign in</button>
                    </div>
                </div>
            </form>
        
        
        <script>
        $(function(){
            //����� ���������� ����
            var modalContents = $(".modal-contents");
            var modal = $("#defaultModal");
            
            $('.onlyAlphabetAndNumber').keyup(function(event){
                if (!(event.keyCode >=37 && event.keyCode<=40)) {
                    var inputVal = $(this).val();
                    $(this).val($(this).val().replace(/[^_a-z0-9]/gi,'')); //_(underscore), ����, ���ڸ� ����
                }
            });
            
            $(".onlyHangul").keyup(function(event){
                if (!(event.keyCode >=37 && event.keyCode<=40)) {
                    var inputVal = $(this).val();
                    $(this).val(inputVal.replace(/[a-z0-9]/gi,''));
                }
            });
        
            $(".onlyNumber").keyup(function(event){
                if (!(event.keyCode >=37 && event.keyCode<=40)) {
                    var inputVal = $(this).val();
                    $(this).val(inputVal.replace(/[^0-9]/gi,''));
                }
            });
            
            //------- �˻��Ͽ� ���¸� class�� ����
            $('#id').keyup(function(event){
                
                var divId = $('#divId');
                
                if($('#id').val()==""){
                    divId.removeClass("has-success");
                    divId.addClass("has-error");
                }else{
                    divId.removeClass("has-error");
                    divId.addClass("has-success");
                }
            });
            
            $('#password').keyup(function(event){
                
                var divPassword = $('#divPassword');
                
                if($('#password').val()==""){
                    divPassword.removeClass("has-success");
                    divPassword.addClass("has-error");
                }else{
                    divPassword.removeClass("has-error");
                    divPassword.addClass("has-success");
                }
            });
            
            $('#passwordCheck').keyup(function(event){
                
                var passwordCheck = $('#passwordCheck').val();
                var password = $('#password').val();
                var divPasswordCheck = $('#divPasswordCheck');
                
                if((passwordCheck=="") || (password!=passwordCheck)){
                    divPasswordCheck.removeClass("has-success");
                    divPasswordCheck.addClass("has-error");
                }else{
                    divPasswordCheck.removeClass("has-error");
                    divPasswordCheck.addClass("has-success");
                }
            });
            
            $('#name').keyup(function(event){
                
                var divName = $('#divName');
                
                if($.trim($('#name').val())==""){
                    divName.removeClass("has-success");
                    divName.addClass("has-error");
                }else{
                    divName.removeClass("has-error");
                    divName.addClass("has-success");
                }
            });
            
            $('#nickname').keyup(function(event){
                
                var divNickname = $('#divNickname');
                
                if($.trim($('#nickname').val())==""){
                    divNickname.removeClass("has-success");
                    divNickname.addClass("has-error");
                }else{
                    divNickname.removeClass("has-error");
                    divNickname.addClass("has-success");
                }
            });
            
            $('#email').keyup(function(event){
                
                var divEmail = $('#divEmail');
                
                if($.trim($('#email').val())==""){
                    divEmail.removeClass("has-success");
                    divEmail.addClass("has-error");
                }else{
                    divEmail.removeClass("has-error");
                    divEmail.addClass("has-success");
                }
            });
            
            $('#phoneNumber').keyup(function(event){
                
                var divPhoneNumber = $('#divPhoneNumber');
                
                if($.trim($('#phoneNumber').val())==""){
                    divPhoneNumber.removeClass("has-success");
                    divPhoneNumber.addClass("has-error");
                }else{
                    divPhoneNumber.removeClass("has-error");
                    divPhoneNumber.addClass("has-success");
                }
            });
            
            
            //------- validation �˻�
            $( "form" ).submit(function( event ) {
                
                var provision = $('#provision');
                var memberInfo = $('#memberInfo');
                var divPassword = $('#divPassword');
                var divPasswordCheck = $('#divPasswordCheck');
                var divNickname = $('#divNickname');
                var divEmail = $('#divEmail');
                

                

                

                
                //�н����� �˻�
                if($('#password').val()==""){
                    modalContents.text("�н����带 �Է��Ͽ� �ֽñ� �ٶ��ϴ�.");
                    modal.modal('show');
                    
                    divPassword.removeClass("has-success");
                    divPassword.addClass("has-error");
                    $('#password').focus();
                    return false;
                }else{
                    divPassword.removeClass("has-error");
                    divPassword.addClass("has-success");
                }
                
                //�н����� Ȯ��
                if($('#passwordCheck').val()==""){
                    modalContents.text("�н����� Ȯ���� �Է��Ͽ� �ֽñ� �ٶ��ϴ�.");
                    modal.modal('show');
                    
                    divPasswordCheck.removeClass("has-success");
                    divPasswordCheck.addClass("has-error");
                    $('#passwordCheck').focus();
                    return false;
                }else{
                    divPasswordCheck.removeClass("has-error");
                    divPasswordCheck.addClass("has-success");
                }
                
                //�н����� ��
                if($('#password').val()!=$('#passwordCheck').val() || $('#passwordCheck').val()==""){
                    modalContents.text("�н����尡 ��ġ���� �ʽ��ϴ�.");
                    modal.modal('show');
                    
                    divPasswordCheck.removeClass("has-success");
                    divPasswordCheck.addClass("has-error");
                    $('#passwordCheck').focus();
                    return false;
                }else{
                    divPasswordCheck.removeClass("has-error");
                    divPasswordCheck.addClass("has-success");
                }
                

                
                //����
                if($('#nickname').val()==""){
                    modalContents.text("������ �Է��Ͽ� �ֽñ� �ٶ��ϴ�.");
                    modal.modal('show');
                    
                    divNickname.removeClass("has-success");
                    divNickname.addClass("has-error");
                    $('#nickname').focus();
                    return false;
                }else{
                    divNickname.removeClass("has-error");
                    divNickname.addClass("has-success");
                }
                
                //�̸���
                if($('#email').val()==""){
                    modalContents.text("�̸����� �Է��Ͽ� �ֽñ� �ٶ��ϴ�.");
                    modal.modal('show');
                    
                    divEmail.removeClass("has-success");
                    divEmail.addClass("has-error");
                    $('#email').focus();
                    return false;
                }else{
                    divEmail.removeClass("has-error");
                    divEmail.addClass("has-success");
                }
                
            
            
            });
            
        });
        
        
        
        
        
        
    </script>
            <!--// ���� ���� �κ� -->
        <hr/>
        <!-- Ǫ�� ���� �κ� -->
        
        <div>
            <p class="text-center">
                <small><strong>��ü��</strong></small><br>
                <small>��ǥ : ȫ�浿 �� �ּ� :  ��Ÿ� �� ����ڵ�Ϲ�ȣ:123-12-12345 �� ��ȭ : 02-123-1234</small><br>
                <small>Copyright�� test.com All rights reserved.</small>
            </p>
        </div>
        <!--// Ǫ�� ���� �κ� -->
    </div>
</body>
</html>