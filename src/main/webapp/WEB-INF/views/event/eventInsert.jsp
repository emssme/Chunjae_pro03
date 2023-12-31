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
    <title>이벤트 글 쓰기</title>
    <jsp:include page="../setting/head.jsp"></jsp:include>
    <script type="text/javascript" src="${path}/resources/ckeditor/ckeditor.js"></script>
    <script src="//cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
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
                    <h1 class="h4"> 이벤트 글 쓰기 </h1>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- /page title -->

<!-- 이벤트 상세보기-->

<div class="content">
    <div class="row column text-center">
        <div class="container">
            <form action="${path }/event/insert.do" method="post">
                <div class="field is-horizontal mb-0" style="height: 60px;">
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
                <div class="field is-horizontal" style="height: 60px; margin-bottom:0px;">
                    <div class="field-label is-normal">
                        <label class="label">이벤트 상태</label>
                    </div>
                    <div class="field-body">
                        <div class="field">
                            <div class="control" style="padding-top:10px;">
                                <label class="radio">
                                    <input type="radio" name="status" id="now" value="1" checked>
                                    진행중
                                </label>
                                <label class="radio">
                                    <input type="radio" name="status" id="end" value="0">
                                    종료
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="field is-horizontal" style="height: 60px; margin-bottom:0px;">
                    <div class="field-label is-normal">
                        <label class="label">시작일</label>
                    </div>
                    <div class="field-body">
                        <div class="field">
                            <p class="control">
                                <input type="date" name="sdate" id="sdate" class="input" placeholder="시작일 지정해주세요" autocomplete="off" required>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="field is-horizontal" style="height: 60px; margin-bottom:0px;">
                    <div class="field-label is-normal">
                        <label class="label">종료일</label>
                    </div>
                    <div class="field-body">
                        <div class="field">
                            <p class="control">
                                <input type="date" name="edate" id="edate" class="input" placeholder="종료일 지정해주세요" autocomplete="off" required>
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
                                <textarea name="content" id="content" class="textarea" placeholder="내용 입력" rows="8" cols="100" maxlength="1400" required></textarea>
                                <script>
                                    var ckeditor_config = {
                                        resize_enaleb : false,
                                        enterMode : CKEDITOR.ENTER_BR,
                                        shiftEnterMode : CKEDITOR.ENTER_P,
                                        filebrowserUploadUrl : "${path}/event/imageUpload.do"
                                    };
                                    CKEDITOR.replace("content", ckeditor_config);
                                </script>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="button-group" style="margin-top: 30px; margin-bottom: 100px;">
                    <c:if test='${sid eq "admin"}'>
                        <input type="submit" class="button is-primary" style="float:right; margin-left:10px;" value="글 등록" >
                        <a class="button" href="${path }/event/list.do" style="color:#000000; text-decoration:none; float:right;">글 목록</a>
                    </c:if>
                </div>
            </form>
            <script>
                // 시작일 변경 시 종료일 처리
                $("#sdate").change(() => {
                    $("#edate").prop("min", $("#sdate").val());
                    // 종료일이 변경한 시작일보다 빠른 경우
                    if($("#edate").val() < $("#sdate").val()) {
                        $("#edate").val($("#sdate").val());
                    }
                });
                // 종료일 변경 시 시작일 처리
                $("#edate").change(() => {
                    $("#sdate").prop("max", $("#edate").val());
                })
            </script>
        </div>
    </div>
    </div>
</div>

</body>
</html>