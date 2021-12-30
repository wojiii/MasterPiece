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
	  <div class="type_msg">
		<div class="input_msg_write">
		  <input type="text" class="write_msg" placeholder="Type a message" />
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