<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    function add_row() {
        var rownum = 1;

        var lecture_column = document.getElementById('lecture_column');
        var row = lecture_column.insertRow(lecture_column.rows.length);
        var num = row.insertCell(0);
        var lecture_name = row.insertCell(1);
        var location = row.insertCell(2);
        var period = row.insertCell(3);
        var start_time = row.insertCell(4);
        var end_time = row.insertCell(5);

        num.innerHTML += rownum;
    }

</script>

<div>
    <button onclick="add_row()">추가</button>
    <button onclick="">삭제</button>
<table>
    <thead>
        <th>번호</th>
        <th>교육회차명</th>
        <th>장소</th>
        <th>모집기한</th>
        <th>강의 시작 시간</th>
        <th>강의 종료 시간</th>
    </thead>
    <tbody id="lecture_column"></tbody>
</table>
</div>