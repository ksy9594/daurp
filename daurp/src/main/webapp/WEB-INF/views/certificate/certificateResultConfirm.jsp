<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
    function check() {
        if($('#Name').val() == '' || $('#Tel').val() == ''){
            alert("수험자 정보를 입력하세요.");
            return false;
        }
    }
</script>

<p>시험 결과 조회</p>
<form action="${pageContext.request.contextPath} /certificate/certificateConfirm/resultConfirm" method="post">
    <div>
        <label for="NAME">성명 : </label>
        <input type="text" name="NAME" id="Name" title="성명">
    </div>
    <div>
        <label for="TEL">연락처 : </label>
        <input type="text" name="TEL" id="Tel" title="이름">
    </div>
    <button type="submit" onclick="check()">확인</button>
</form>