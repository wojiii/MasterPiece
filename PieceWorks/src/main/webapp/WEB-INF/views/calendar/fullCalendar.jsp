<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>FullCalendar</title>
    <link rel=" shortcut icon" href="resource/img/favicon.ico">

    <link rel="stylesheet" href="resource/vendor/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="resource/vendor/css/bootstrap.min.css">
    <link rel="stylesheet" href='resource/vendor/css/select2.min.css' />
    <link rel="stylesheet" href='resource/vendor/css/bootstrap-datetimepicker.min.css' />

    <link rel="stylesheet" href="resource/css/main.css">
</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
	
		<!-- SIDEBAR -->
		<%@include file="../common/project-sidebar.jsp" %>       
	
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
                    	    <h1 class="h3 mb-0 text-gray-800">메인 내용 제목</h1>
                    	</div>

						<div class="row">
                       	     <div class="container">

						        <!-- 일자 클릭시 메뉴오픈 -->
						        <div id="contextMenu" class="dropdown clearfix">
						            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
						                style="display:block;position:static;margin-bottom:5px;">
						                <li><a tabindex="-1" href="#">진행중</a></li>
						                <li><a tabindex="-1" href="#">진행전</a></li>
						                <li><a tabindex="-1" href="#">완료</a></li>
						                <li class="divider"></li>
						                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
						            </ul>
						        </div>
						
						        <div id="wrapper">
						            <div id="loading"></div>
						            <div id="calendar"></div>
						        </div>
						
						
						        <!-- 일정 추가 MODAL -->
						        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
						            <div class="modal-dialog" role="document">
						                <div class="modal-content">
						                    <div class="modal-header">
						                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
						                                aria-hidden="true">&times;</span></button>
						                        <h4 class="modal-title"></h4>
						                    </div>
						                    <div class="modal-body">
						
						                        <div class="row">
						                            <div class="col-xs-12">
						                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
						                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"/>
						                            </div>
						                        </div>
						                        <div class="row">
						                            <div class="col-xs-12">
						                                <label class="col-xs-4" for="creator">작성자</label>
						                                <input class="inputModal" id="nickName" value="${ loginUser.nickName }" readonly/>
						                                <input type="hidden" id="email" value="${ loginUser.email }"/>
						                            </div>
						                        </div>
						
						                        <div class="row">
						                            <div class="col-xs-12">
						                                <label class="col-xs-4" for="edit-title">일정명</label>
						                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
						                                    required="required" />
						                            </div>
						                        </div>
						                        <div class="row">
						                            <div class="col-xs-12">
						                                <label class="col-xs-4" for="edit-start">시작</label>
						                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
						                            </div>
						                        </div>
						                        <div class="row">
						                            <div class="col-xs-12">
						                                <label class="col-xs-4" for="edit-end">끝</label>
						                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
						                            </div>
						                        </div>
						                        <div class="row">
						                            <div class="col-xs-12">
						                                <label class="col-xs-4" for="edit-type">구분</label>
						                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
						                                    <option value="진행전">진행전</option>
						                                    <option value="진행중">진행중</option>
						                                    <option value="완료">완료</option>
						                                </select>
						                            </div>
						                        </div>
						                        <div class="row">
						                            <div class="col-xs-12">
						                                <label class="col-xs-4" for="edit-color">색상</label>
						                                <select class="inputModal" name="color" id="edit-color">
						                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
						                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
						                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
						                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
						                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
						                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
						                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
						                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
						                                    <option value="#495057" style="color:#495057;">검정색</option>
						                                </select>
						                            </div>
						                        </div>
						                        <div class="row">
						                            <div class="col-xs-12">
						                                <label class="col-xs-4" for="edit-desc">설명</label>
						                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
						                                    id="edit-desc"></textarea>
						                            </div>
						                        </div>
						                    </div>
						                    <div class="modal-footer modalBtnContainer-addEvent">
						                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
						                    </div>
						                    <div class="modal-footer modalBtnContainer-modifyEvent">
						                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
						                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
						                    </div>
						                </div><!-- /.modal-content -->
						            </div><!-- /.modal-dialog -->
						        </div><!-- /.modal -->
						
						        <div class="panel panel-default">
						
						            <div class="panel-heading">
						                <h3 class="panel-title">필터</h3>
						            </div>
						
						            <div class="panel-body">
						
						                <div class="col-lg-6">
						                    <label for="calendar_view">진행도별</label>
						                    <div class="input-group">
						                        <select class="filter" id="type_filter" multiple="multiple">
						                            <option value="진행전">진행전</option>
						                            <option value="진행중">진행중</option>
						                            <option value="완료">완료</option>
						                        </select>
						                    </div>
						                </div>
						
<!-- 						                <div class="col-lg-6"> -->
<!-- 						                    <label for="calendar_view">등록자별</label> -->
<!-- 						                    <div class="input-group"> -->
<!-- 						                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="주희" -->
<!-- 						                                checked>주희</label> -->
<!-- 						                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="영화" -->
<!-- 						                                checked>영화</label> -->
<!-- 						                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="지선" -->
<!-- 						                                checked>지선</label> -->
<!-- 						                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="윤오" -->
<!-- 						                                checked>윤오</label> -->
<!-- 						                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="현우" -->
<!-- 						                                checked>현우</label> -->
<!-- 						                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="정은" -->
<!-- 						                                checked>정은</label> -->
<!-- 						                    </div> -->
<!-- 						                </div> -->
						
						            </div>
						        </div>
						        <!-- /.filter panel -->
						    </div>
						    <!-- /.container -->
						
						    <script src="resource/vendor/js/jquery.min.js"></script>
						    <script src="resource/vendor/js/bootstrap.min.js"></script>
						    <script src="resource/vendor/js/moment.min.js"></script>
						    <script src="resource/vendor/js/fullcalendar.min.js"></script>
						    <script src="resource/vendor/js/ko.js"></script>
						    <script src="resource/vendor/js/select2.min.js"></script>
						    <script src="resource/vendor/js/bootstrap-datetimepicker.min.js"></script>
						    <script src="resource/js/main.js"></script>
						    <script src="resource/js/addEvent.js"></script>
						    <script src="resource/js/editEvent.js"></script>
						    <script src="resource/js/etcSetting.js"></script>              
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