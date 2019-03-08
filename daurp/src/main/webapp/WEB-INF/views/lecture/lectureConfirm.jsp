<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">

    function check() {
        if($('#Name').val() == '' || $('#Tel').val() == ''){
            alert("신청 정보를 입력하세요.");
            return false;
        }
    }
</script>
<form action="${pageContext.request.contextPath} /lecture/lectureConfirm/confirm" method="post">
    <div>
        <select name="attendLecName" id="attendLecName" title="교육명">
            <option value="">선택</option>
            <c:forEach var="item" items="${lecName}">
                <option value="${item.lecture_code}">
                    ${item.lecture_name}
                </option>
            </c:forEach>
        </select>
    </div>
    <div>
        <label for="NAME">성명 : </label>
        <input type="text" name="NAME" id="Name" title="성명">
    </div>
    <div>
        <label for="Tel">연락처 : </label>
        <input type="text" name="TEL" id="Tel" title="전화번호 첫 번째 자리" />
    </div>
    <button type="submit" onclick="check()">확인</button>
</form>


