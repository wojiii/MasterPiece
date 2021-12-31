<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <link href="resource/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="resource/css/chatting-css.css">
	<style type="text/css">
		.messaging{
			padding-bottom: 0px;
		}
		.mesgs{
			width: 100%;
			padding: 10px;
		}
		.received_msg{
			width: 70%;
		}
		.msg_history{
			height: 400px;
			width: 373px;
		}
		.sent_msg p{
			width: 140px;
		}
		.type_msg{
			width: 353px;
		}
		.incoming_msg{
			padding: 10px 0;
		}
		.received_msg p{
			margin: 0px;
		}
	</style>
	<script type="text/javascript">
	var name
var wsocket;
	$(document).ready(function() {
		name = prompt("이름입력");
		connect();
	});

	function connect() {
		wsocket = new WebSocket(
				"ws://localhost:9580/pieceworks/chat-ws.ch");
		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
	}
	function disconnect() {
		wsocket.close();
	}
	function onOpen(evt) {
		console.log("연결되었습니다.");
	}
	 
	function onMessage(evt) {
		var data = evt.data;
		if (data.substring(0, 4) == "msg:") {
			appendMessage(data.substring(4));
		}
	}
	function onClose(evt) {
		appendMessage("연결을 끊었습니다.");
	}
	
	function send() {
		var msg = $(".write_msg").val();
		wsocket.send("msg:"+name+":" + msg);
		$(".write_msg").val("");
	}

	function appendMessage(msg) {
		console.log(msg.substring(0,3));
		if(msg.substring(0,3)=="첫번째"){
			$('.msgArea').append("<div class='outgoing_msg'> <div class='sent_msg'> <p>"+msg+"</p> <span class='time_date'>" +"시간"+"</span> </div>");
		}else{
			$('.msgArea').append("<div class='incoming_msg'> <div class='incoming_msg_img'> <img src='https://ptetutorials.com/images/user-profile.png' alt='sunil'> </div> <div class='received_msg'> <div class='received_withd_msg'> <p>" +msg+"</p> <span class='time_date'>" +"시간"+"</span></div> </div> </div>");
		}
		var chatAreaHeight = $(".msg_history").height();
		var maxScroll = $(".msgArea").height() - chatAreaHeight;
		$(".msg_history").scrollTop(maxScroll);
	}

	$(document).ready(function() {
		$('#message').keypress(function(event){
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if(keycode == '13'){
				send();	
			}
			event.stopPropagation();
	
		});
		$('.msg_send_btn').click(function() { send(); });
		$('#enterBtn').click(function() { connect(); });
		$('#exitBtn').click(function() { disconnect(); });
	});
	
	
	</script>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body >

 <!-- 채팅목록 & 채팅창 -->
           <div class="messaging">
  <div class="inbox_msg">
	<div class="mesgs">
	  <div class="msg_history">
	  <div class="msgArea">
	  <c:forEach var="c" items="${list }">
	 	 <c:choose>
		  	<c:when test="${c.chatWriter eq 'aaa@naver.com'}">
		  		<div class="outgoing_msg">
				  <div class="sent_msg">
					<p>${c.chatMessage }</p>
			<span class="time_date"> ${c.sendTime }</span> </div>
		</div>
		  	</c:when>
		  	<c:otherwise>
		  	<div class="incoming_msg">
		<div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
		  <div class="received_msg">
			<div class="received_withd_msg">
			  <p>${c.chatMessage }</p>
			  <span class="time_date">${c.sendTime }</span></div>
		  </div>
		</div>
		  	</c:otherwise>
		  	</c:choose>
		  </c:forEach>
		
		
		<!-- <div class="incoming_msg">
		  <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
		  <div class="received_msg">
			<div class="received_withd_msg">
			  <p>하이하이</p>
			  <span class="time_date"> 11:01 AM    |    Yesterday</span></div>
		  </div>
		</div>
		<div class="outgoing_msg">
		  <div class="sent_msg">
			<p>ㅇㅋㅇㅋ</p>
			<span class="time_date"> 11:01 AM    |    Today</span> </div>
		</div> -->
		</div>
	  </div>
	  <div class="type_msg">
		<div class="input_msg_write">
		  <input type="text" class="write_msg" placeholder="Type a message" style="width: 300px;"/>
		  <button class="msg_send_btn" type="button"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
		</div>
	  </div>
	  
	</div>
  </div>
</div>
</body>
<script type="text/javascript">
	
</script>
</html>