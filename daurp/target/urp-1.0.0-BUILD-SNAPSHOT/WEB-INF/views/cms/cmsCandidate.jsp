<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<p>스마트팩토리 운영 관리사 양성과정 교육생 명단</p>
<table>
    <tr>
        <th>이름</th>
        <th>연락처</th>
        <th>생년월일</th>
        <th>전체 출석률</th>
        <th>수료증 출력</th>
    </tr>
    <c:forEach var="item" end="10" items="${list}">
        <tr>
            <td>${item.LEC_NAME}</td>
            <td>${item.LEC_TEL}</td>
            <td>${item.LEC_BIRTHDAY}</td>
            <td></td>
            <td>
                <button type="button">수료증 출력</button>
            </td>
        </tr>
    </c:forEach>
</table>