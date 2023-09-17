<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="<%=request.getContextPath() %>" />

<header class="is-sticky-top bg-white border-bottom border-default" style="background-color: #333333">
    <div class="container" style="background-color: #333333">
        <nav class="navigation navbar" style="background-color: #333333">
            <a class="navbar-brand is-inline-flex ml-0 is-align-items-center" href="${path}">
                <img src="${path}/resources/images/tspoon_logo.png" alt="logo" width="150px">
            </a>
            <!-- 모바일 -->
            <nav class="navbar is-fixed-top is-transparent is-hidden-desktop">
                <div class="navbar-brand">
                    <div class="navbar-burger burger" data-target="mobile-nav">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                </div>
                <div id="mobile-nav" class="navbar-menu">
                    <div class="navbar-end">
                        <div class="navbar-item">
                            <a class="navbar-item" href="${path}">
                                소개
                            </a>
                        </div>
                        <div class="navbar-item">
                            <a class="navbar-item" href="${path}/community/list.do">
                                커뮤니티
                            </a>
                        </div>
                        <div class="navbar-item">
                            <a class="navbar-item" href="${path}/notice/list.do">
                                고객지원
                            </a>
                        </div>
                    </div>
                </div>
            </nav>
            <div id="navigation" class="navbar-menu">
                <div class="navbar-end">
                    <div class="navbar-item has-dropdown is-hoverable">
                        <a href="${path}" class="navbar-item" style="color: #fff;">소개</a>
                    </div>
                    <div class="navbar-item has-dropdown is-hoverable">
                        <a href="${path}" class="navbar-item" style="color: #fff;">커뮤니티</a>
                        <div class="navbar-dropdown">
                            <a href="${path}/community/list.do" class="navbar-item">커뮤니티</a>
                            <a href="${path}/fileboard/list.do" class="navbar-item">자료실</a>
                        </div>
                    </div>
                    <div class="navbar-item has-dropdown is-hoverable">
                        <a href="${path}" class="navbar-item" style="color: #fff;">고객지원</a>
                        <div class="navbar-dropdown">
                            <a href="${path}/notice/list.do" class="navbar-item">공지사항</a>
                            <a href="${path}/faq/list.do" class="navbar-item">FAQ</a>
                            <a href="${path}/qna/list.do" class="navbar-item">Q&A</a>
                        </div>
                    </div>
                    <div class="buttons">
                        <c:if test="${sid eq null}">
                            <a href="${path}/member/term.do" class="button is-primary">
                                <strong>Sign up</strong>
                            </a>
                            <a href="${path}/member/login.do" class="button is-light">
                                Log in
                            </a>
                        </c:if>
                        <c:if test="${sid ne null and sid ne 'admin'}">
                            <a href="${path}/member/login2.do" class="button is-primary">
                                <strong>MyPage</strong>
                            </a>
                            <a href="${path}/member/logout.do" class="button is-light">
                                LogOut
                            </a>
                        </c:if>
                        <c:if test="${sid ne null and sid eq 'admin'}">
                            <a href="${path}/admin/list.do" class="button is-primary">
                                <strong>Admin</strong>
                            </a>
                            <a href="${path}/member/logout.do" class="button is-light">
                                LogOut
                            </a>
                        </c:if>
                    </div>

                </div>
            </div>
        </nav>
    </div>
</header>
