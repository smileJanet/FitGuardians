<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trainee's Dashboard</title>
<!-- Custom fonts for this template-->
    <link href="resources/templates/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
	<!-- sweetalert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.14.1/dist/sweetalert2.all.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.14.1/dist/sweetalert2.min.css" rel="stylesheet">
    
    <!-- FullCalendar cdn -->
    <script src="
    https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js
    "></script>

</head>

<body id="page-top">

	<c:if test="${ not empty alertMsg }">
    		<script>
		   		 Swal.fire({
				      icon: 'success',
				      title: '성공',
				      text: "${alertMsg}",
				    });
    		</script>
    		<c:remove var="alertMsg" scope="session"/>
   	</c:if>
    	
	<!-- Page Wrapper -->
    <div id="wrapper">
     <c:choose>
    	<c:when test="${ not empty loginUser }">
    		<c:choose>
    			<c:when test="${ loginUser.userLevel == 2 }">
			     	<jsp:include page="../common/sideTrainee.jsp" />
    			</c:when>
    			<c:otherwise>
    				<jsp:include page="../common/sideTrainer.jsp" />
    			</c:otherwise>
    		</c:choose>
    	</c:when>
	    <c:otherwise>
	    	<jsp:include page="../common/sideTrainee.jsp" />
	    </c:otherwise>
    </c:choose>
     <div id="content-wrapper" class="d-flex flex-column">
     <!-- Main Content -->
     	<div id="content">
     		<jsp:include page="../common/topBar.jsp"/>
     		<!-- Begin Page Content -->
                <div class="container-fluid">
					여기다 본인의 컨텐츠 작성하면 됨!
                </div>
     	
     	
     	</div>
     </div>
    </div>
</body>

</html>