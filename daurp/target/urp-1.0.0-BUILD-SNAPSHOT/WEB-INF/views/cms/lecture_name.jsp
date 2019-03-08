<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form action="${pageContext.request.contextPath} /cms/lecture_name/add" method="post">
    <div>
        <label for="lectureName">강의명</label>
        <input type="text" id="lectureName" name="lectureName" title="강의명">
    </div>
    <div>
        <label for="lectureLocation">교육장소</label>
        <input type="text" name="lectureLocation" id="lectureLocation" title="교육장소">
    </div>
    <div>
        <label for="start_date">개강일</label>
        <input type="date" name="start_date" id="start_date" title="개강일">
    </div>
    <div>
        <label for="end_date">종강일</label>
        <input type="date" name="end_date" id="end_date" title="개강일">
    </div>
    <div>
        <label for="app_period">모집기한</label>
        <input type="date" name="app_period" id="app_period" title="모집기한">
    </div>
    <button type="submit">등록하기</button>
</form>