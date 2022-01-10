<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Sign Up</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link 
    	  href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resource/css/sb-admin-2.css" rel="stylesheet">

</head>
<style>
	.col-lg-7{
		max-width:100%; 
		flex:0px;
	}

    .user-input{
        width: 50%;
        margin: 0 auto;
    }
	
</style>
<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12 col-md-9">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                       
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-7">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h1 text-gray-900 mb-4">PIECE WORKS</h1>
                                        <h1 class="h4 text-gray-900 mb-4">회원가입</h1>
                                    </div>
                                    <form class="user" action="insert.me" method="post">
                                        <div class="user-input">
                                            <div class="form-group">
                                                <input type="email" class="form-control form-control-user" id="email"
                                                    	name="email" placeholder="이메일 주소 입력" required>
                                            </div>
                                            <div class="form-group row">
                                                <div class="col-sm-6 mb-3 mb-sm-0">
                                                    <input type="password" class="form-control form-control-user" id="pwd"
                                                        	name="pwd" placeholder="비밀번호 입력" required>
                                                </div>
                                                <div class="col-sm-6">
                                                    <input type="password" class="form-control form-control-user" id="pwdCheck"
                                                        	name="pwdCheck" placeholder="비밀번호 확인" required>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="col-sm-6 mb-3 mb-sm-0">
                                                    <input type="text" class="form-control form-control-user" id="userName" 
                                                   			name="name" placeholder="이름 입력" required>
                                                </div>
                                                <div class="col-sm-6">
                                                    <input type="text" class="form-control form-control-user" id="phone" 
                                                    		name="phone" placeholder="휴대전화 입력" required>
                                                </div>
                                            </div>
                                            <input type="submit" id="submit" value="회원가입"
                                            		class="btn btn-primary btn-user btn-block" 
                                            		onclick="moveLogin();">
                                            <input type="button" id="button" value="취소" 
                                            		class="btn btn-cancle btn-user btn-block" 
                                            		onclick="cancle();">
                                    	</div>
                                    </form>
                                    
                                    <hr>
                                    
                                    <div class="text-center">
                                        <a class="small" href="login.me">이미 계정이 있습니다!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <script>
        function moveLogin(){
            var login = confirm('회원가입이 완료되었습니다.');
            if(login){
                location.href = "index.jsp";
            }
        }    

        function cancle(){
        	location.href = "login.jsp";
        }
        
        $("#submit").on("click", function(){
	        if($("#pwd").val()==""){
	            alert("비밀번호를 입력해주세요.");
	            $("#pwd").focus();
	            return false;
	          }
	          if($("#pwdCheck").val()==""){
	              alert("비밀번호를 확인해주세요.");
	              $("#pwdCheck").focus();
	              return false;
	          }
	          if($("#pwd").val() != $("#pwdCheck").val()){
	              alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); 
	              $("#pwd").focus();
	              return false; 
	          }
	          if ($("#pwd").val().length < 8) {
	              alert("비밀번호는 8자 이상으로 설정해야 합니다.");
	              $("#pwd").val("").focus();
	              return false;
	          }
        }
    </script>
    

</body>

</html>