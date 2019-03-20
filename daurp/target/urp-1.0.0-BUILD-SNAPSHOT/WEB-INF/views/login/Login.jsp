<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div id="wrap lo">
    <div class="login">
        <form id="loginFrm" action="<c:url value='/j_spring_security_check'/>" method="post">
            <div class="tx">
                <label for="id">ID</label>
                <input id="id" name="j_username" type="text" title="아이디" />
            </div>
            <div class="tx">
                <label>비밀번호</label>
                <input id="password" name="j_password" type="password" title="비밀번호" />
            </div>
            <button type="submit" id="loginForm" onclick="login()">로그인</button>
        </form>
    </div>
</div>

<script type="text/javascript">
    function login() {
        if($('#id').val() == ''){
            alert('아이디를 입력해주세요');
            return false;
        } else if($('#password').val() == ''){
            alert('비밀번호를 입력해주세요');
            return false;
        }
    }
</script>