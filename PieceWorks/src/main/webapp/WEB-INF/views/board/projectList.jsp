<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- SIDEBAR -->
		<%@include file="../common/sidebar.jsp" %>       

		<!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
            <div id="content">

				<!-- TOPBAR -->
				<%@include file="../common/topbar.jsp" %>

<!-- 기능 작성 시작 부분 -->
					<!-- Begin Page Content -->
					<div class="container-fluid">
                	    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    	    <h1 class="h3 mb-0 text-gray-800">프로젝트 리스트</h1>
                    	</div>

						<div class="row">
                       	 <!-- 내용 작성 하는 영역 --> 
                       	   <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" text-align: center>
                                    <thead>
                                        <tr>
                                            <th>프로젝트</th>
                                            <th>생성자</th>
                                            <th>진행상황</th>
                                            <th>시작날짜</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                        <tr>
                                            <td>세미프로젝트_1</td>
                                            <td>강건강</td>
                                            <td>진행중</td>
                                            <td>2021-1-10</td>
                                        </tr>
                                        <tr>
                                            <td>세미프로젝트_1</td>
                                            <td>강건강</td>
                                            <td>진행중</td>
                                            <td>2021-1-10</td>
                                        </tr>
                                        <tr>
                                            <td>세미프로젝트_2</td>
                                            <td>박로즈</td>
                                            <td>진행전</td>
                                            <td>2021-1-8</td>
                                        </tr>
                                        <tr>
                                           <td>세미프로젝트_2</td>
                                            <td>강건강</td>
                                            <td>진행전</td>
                                            <td>2021-1-10</td>
                                        </tr>
                                        <tr>
                                            <td>세미프로젝트_2</td>
                                            <td>유재식</td>
                                            <td>완료</td>
                                            <td>2021-3-18</td>
                                        </tr>
                                        <tr>
                                            <td>세미프로젝트_2</td>
                                            <td>강건강</td>
                                            <td>진행중</td>
                                            <td>2021-1-10</td>
                                        </tr>
                                        <tr>
                                            <td>세미프로젝트_2</td>
                                            <td>강건강</td>
                                            <td>완료</td>
                                            <td>2021-1-10</td>
                                        </tr>
                                        <tr>
                                            <td>세미프로젝트_1</td>
                                            <td>강건강</td>
                                            <td>진행중</td>
                                            <td>2021-1-10</td>
                                        </tr>
                                        <tr>
                                            <td>세미프로젝트_2</td>
                                            <td>강건강</td>
                                            <td>진행전</td>
                                            <td>2021-1-10</td>
                                        </tr>
                                        <tr>
                                           <td>세미프로젝트_2</td>
                                            <td>강건강</td>
                                            <td>진행중</td>
                                            <td>2021-1-10</td>
                                        </tr>
                                        <tr>
                                            <td>세미프로젝트_2</td>
                                            <td>강건강</td>
                                            <td>완료</td>
                                            <td>2021-1-10</td>
                                        </tr>
                                       <tr>
                                           <td>세미프로젝트_2</td>
                                            <td>강건강</td>
                                            <td>진행전</td>
                                            <td>2021-1-10</td>
                                        </tr>
                                        <tr>
                                            <td>세미프로젝트_2</td>
                                            <td>강건강</td>
                                            <td>진행중</td>
                                            <td>2021-1-10</td>
                                        </tr>
                                        <tr>
                                            <td>세미프로젝트_2</td>
                                            <td>윤예의</td>
                                            <td>완료</td>
                                            <td>2021-1-10</td>
                                        </tr>
                                        <tr>
                                            <td>세미프로젝트_2</td>
                                            <td>강건강</td>
                                            <td>진행중</td>
                                            <td>2021-1-10</td>
                                        </tr>
                                        <tr>
                                           <td>세미프로젝트_2</td>
                                            <td>강건강</td>
                                            <td>진행중</td>
                                            <td>2021-1-10</td>
                                        </tr>
                                        <tr>
                                            <td>세미프로젝트_2</td>
                                            <td>남나눔</td>
                                            <td>진행중</td>
                                            <td>2021-5-10</td>
                                        </tr>
                                        <tr>
                                           <td>세미프로젝트_2</td>
                                            <td>강건강</td>
                                            <td>진행중</td>
                                            <td>2021-1-10</td>
                                        </tr>
                                       
                                    </tbody>
                                </table>
                                <script>
                                	$('td:contains("진행전")').css('background','#FDAB3D');
                                	$('td:contains("진행중")').css('background','#28BA37');
                                	$('td:contains("완료")').css('background','#3479FF');
                                	
                                	$('td:contains("진행전")').css('color','white');
                                	$('td:contains("진행중")').css('color','white');
                                	$('td:contains("완료")').css('color','white');
                                </script>



                   		</div>					
					</div>
					<!-- container-fluid 끝 -->
<!-- 기능 작성 끝 부분 -->
			</div>
			<!-- Main Content 끝 -->

				<!-- FOOTER -->
				<%@include file="../common/footer.jsp" %>

			</div>
			<!-- Content Wrapper 끝 -->
		</div>
		<!-- Page Wrapper 끝 -->    
</body>

</html> 