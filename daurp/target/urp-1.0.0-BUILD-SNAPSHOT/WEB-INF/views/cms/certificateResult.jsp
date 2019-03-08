<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table>
    <tr>
        <th>이름</th>
        <th>연락처</th>
        <th>시험 결과</th>
    </tr>
    <c:forEach var="item" end="10" items="${list}">
        <tr>
            <td>${item.CER_NAME}</td>
            <td>${item.CER_TEL}</td>
            <td>${item.CER_SCORE}</td>
        </tr>
    </c:forEach>
</table>
<form action="" method="post">
    <div>
        <button type="button">시험 결과 문자 발송</button>
    </div>
</form>