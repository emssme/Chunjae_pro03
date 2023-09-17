<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<footer class="section-sm pb-0 border-top border-default" style="background-color: #333333">
    <div class="container">
        <div class="columns is-multiline is-justify-content-space-between">
            <div class="column is-3-desktop">
                <a class="mb-5 is-block" href="${path}">
                    <img class="" width="150px" src="${path}/resources/images/tspoon_logo.png" alt="Logo">
                </a>
            </div>

            <div class="column is-2-widescreen is-3-desktop is-6">
                <h6 class="mb-4" style="color: #fff">Quick Links</h6>
                <ul class="list-unstyled footer-list">
                    <li><a href="${path}" style="color: #fff">소개</a></li>
                    <li><a href="${path}" style="color: #fff">커뮤니티</a></li>
                    <li><a href="${path}" style="color: #fff">고객지원</a></li>
                </ul>
            </div>
        </div>
        <div class="scroll-top">
            <a href="#" id="scrollTop"><i class="ti-angle-up"></i></a>
        </div>
        <div class="content has-text-centered">
            <p style="color:#fff">
                <a href="${path}"><strong>TSpoon</strong></a><br>
                Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                All rights reserved by Tspoon
            </p>
        </div>
    </div>
</footer>