<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>공지사항 상세보기</title>
	<jsp:include page="../setting/head.jsp"></jsp:include>
</head>
<body>

	<!-- 헤더 영역 시작 -->
	<jsp:include page="../layout/header.jsp" />
	<!-- 헤더 영역 끝 -->

	<!-- page title -->
	<section class="section-sm">
		<div class="container">
			<div class="columns is-multiline">
				<div class="column is-12">
					<div class="title-bordered mb-5 has-text-centered">
						<h1 class="h4"> 공지사항 상세보기 </h1>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- /page title -->

	<!-- 공지사항 글 상세보기 시작-->
	<div class="content" id="content">
	    <div class="row column text-center">
	      <div class="container">
		      <table id="table">
		      	<tbody>
		      		<tr style="border-top: solid grey 1px;">
						<td style="font-weight: bold; font-size: 30px;">${notice.title }</td>
						<td style="min-width:10%; max-width: 15%; text-align: right; padding-top:30px;">
							작성자 | ${notice.nickname }
						</td>
						<td style="width: 170px; padding-right: 0px; padding-top:30px;">
							작성일 | <fmt:parseDate value="${notice.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
									<fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
						</td>
						<td style="width: 110px; padding-top:30px;">
							조회수 | ${notice.visited}
						</td>
		      		</tr>
		      		<tr style="border-bottom: solid grey 1px;">
		      			<td style="padding-top: 50px; padding-bottom: 50px;"><p>${notice.content }</p></td>
		      		</tr>
		      	</tbody>
		      </table>
				<div class="button-group" style="margin-top: 30px; margin-left: 1070px; margin-bottom: 100px;">
				  <c:if test='${sid eq "admin"}'>
					  <a class="button" href="${path }/notice/delete.do?seq=${notice.seq}">글 삭제</a>
					  <a class="button" href="${path }/notice/edit.do?seq=${notice.seq}">글 수정</a>
				  </c:if>
				  <a class="button" href="${path }/notice/list.do" style="float:right;">글 목록</a>
				</div>
	      </div>
	    </div>
	</div>
	<!-- 공지사항 글 상세보기 끝 -->

	<!-- 푸터 영영 시작 -->
	<jsp:include page="../layout/footer.jsp"/>
	<!-- 푸터 영역 끝 -->

</body>
</html>