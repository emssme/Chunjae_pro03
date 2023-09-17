<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title> 커뮤니티 글 등록 </title>
    <c:set var="path" value="${pageContext.request.contextPath}"/>
    <jsp:include page="../setting/head.jsp" />

    <style>
        h1 { font-size: 40pt; }
        h3 { font-size: 20pt; }
    </style>
</head>
<body>
<%@ include file="../layout/header.jsp"%>

<!-- page title -->
<section class="section-sm">
    <div class="container">
        <div class="columns is-multiline">
            <div class="column is-12">
                <div class="title-bordered mb-5 has-text-centered" >
                    <h1 class="h4">커뮤니티 글 등록</h1>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- /page title -->

<section class="section">
    <form action="${path}/community/insert.do" method="post" class="container">
        <div class="columns">
            <div class="column is-one-quarter">
                <label for="cate"> 카테고리 </label>
                <select name="cate" id="cate" class="input">
                    <c:forEach var="category" items="${categories}">
                        <option value="${category.cate}">${category.cateName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="column">
                <label for="title"> 제목 </label>
                <input type="text" id="title" name="title" class="input">
            </div>
        </div>
        <div class="columns">
            <div class="column">
                <label for="content"> 내용 </label>
                <textarea class="textarea" id="content" name="content" cols="30" rows="10" maxlength="1000"></textarea>
            </div>
        </div>
        <div class="columns">
            <div class="column">
                <input type="submit" class="button is-fullwidth is-link" value="등록하기"/>
            </div>
        </div>
    </form>
</section>

<%@ include file="../layout/footer.jsp"%>

</body>
</html>
