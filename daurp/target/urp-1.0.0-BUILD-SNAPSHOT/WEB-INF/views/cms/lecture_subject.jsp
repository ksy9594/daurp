<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form>
    <div>
        <label for="lectureName">교육과정</label>
        <select name="lectureName" id="lectureName">
            <option value="">선택</option>
            <c:forEach var="item" items="${lecName}">
                <option value="${item.lecture_code}">${item.lecture_name}</option>
            </c:forEach>
        </select>
    </div>
    <div>
        <label for="subjectName">교육과목</label>
        <input type="text" name="subjectName" id="subjectName">
    </div>
    <div>
        <label for="subjectDate">교육일자</label>
        <input type="date" name="subjectDate" id="subjectDate">
    </div>
    <div>
        <label for="subjectDate">강의 시간</label>
        <input type="time" name="startTime" id="startTime">~
        <input type="time" name="endTime" id="endTime">
    </div>
    <button type="submit">등록하기</button>
</form>