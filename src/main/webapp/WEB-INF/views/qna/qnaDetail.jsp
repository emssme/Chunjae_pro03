<%@ page contentType="text/html;" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <title>Q&A 상세보기</title>
    <jsp:include page="../setting/head.jsp"></jsp:include>

</head>
<body>

<!--헤더 영역 시작 -->
<jsp:include page="../layout/header.jsp"/>
<!-- page title -->
<section class="section-sm">
    <div class="container">
        <div class="columns is-multiline">
            <div class="column is-12">
                <div class="title-bordered mb-5 has-text-centered">
                    <h1 class="h4"> Q&A 상세보기 </h1>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- /page title -->

<!--QnA 상세보기-->

<div class="content" id="content">
    <div class="row column text-center">
        <div class="container">
            <table id="table">
                <tbody>
                    <tr style="border-top: solid grey 1px;">
                        <td style="font-weight: bold; font-size: 30px;">${dto.title }</td>
                        <td style="min-width:10%; max-width: 15%; text-align: right; padding-top:30px;">
                            작성자 | ${dto.author}
                        </td>
                        <td style="width: 170px; padding-right: 0px; padding-top:30px;">
                            작성일 | <fmt:parseDate value="${dto.resdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                            <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
                        </td>
                    </tr>
                    <tr style="border-bottom: solid grey 1px;">
                        <td style="padding-top: 50px; padding-bottom: 50px;"><p>${dto.content }</p></td>
                    </tr>
                </tbody>
            </table>
            <div class="button-group" style="margin-top: 30px; float: right; margin-bottom: 100px;">
                <a class="button" href="${path }/qna/list.do">글 목록</a>
                <c:if test='${sid eq "admin" && not empty sid}'>
                    <a class="button" href="${path }/qna/answerInsert.do?qno=${dto.qno}">답변 등록</a>
                    <a class="button" href="${path }/qna/delete.do?qno=${dto.qno}">글 삭제</a>
                </c:if>
                <c:if test='${sid eq dto.author && not empty sid}'>
                    <a class="button" href="${path }/qna/delete.do?qno=${dto.qno}">글 삭제</a>
                    <a class="button" href="${path }/qna/edit.do?qno=${dto.qno}">글 수정</a>
                </c:if>
            </div>
        </div>
    </div>
</div>

</body>
</html>