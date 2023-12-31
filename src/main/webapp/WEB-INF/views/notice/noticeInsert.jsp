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
	<title>공지사항 글쓰기</title>
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
					<div class="title-bordered mb-5 has-text-centered" >
						<h1 class="h4"> 공지사항 글쓰기 </h1>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- /page title -->


	<!-- 공지사항 글쓰기 시작 -->
	<div class="content" id="content" >
	    <div class="row column text-center">
	      <div class="container">
	      	<form action="${path }/notice/insert.do" method="post">
				<div class="field is-horizontal" style="height: 60px; margin-bottom:0px;">
					<div class="field-label is-normal">
						<label class="label">제목</label>
					</div>
					<div class="field-body">
						<div class="field">
							<p class="control">
								<input type="text" name="title" id="title" placeholder="제목 입력" maxlength="98" class="input" required>
							</p>
						</div>
					</div>
				</div>
				<div class="field is-horizontal">
					<div class="field-label is-normal">
						<label class="label">내용</label>
					</div>
					<div class="field-body">
						<div class="field">
							<div class="control">
								<textarea name="content" id="content" class="textarea is-focused" placeholder="내용 입력" rows="8" cols="100" maxlength="800" required ></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="button-group" style="margin-top: 30px; margin-left: 1070px; margin-bottom: 100px;">
					<c:if test='${sid eq "admin"}'>
					<input type="submit" class="submit success button" value="글 등록" style="float:right; margin-left:10px;" >
					</c:if>
					<a class="button" href="${path }/notice/list.do" style="float:right;">글 목록</a>
				</div>
		   </form>
	      </div>
	    </div>
	</div>
	<!-- 공지사항 글쓰기 끝 -->

	<!-- 푸터 영영 시작 -->
	<jsp:include page="../layout/footer.jsp"/>
	<!-- 푸터 영역 끝 -->

</body>
</html>