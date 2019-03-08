<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>

    <p>성명 :      ${candidate.NAME}</p>
    <p>생년월일 :  ${candidate.BIRTH}</p>
    <p>교육명 : 스마트팩토리 운영관리사 자격증</p>
    <p>접수일자 : ${candidate.RECDATE}</p>
</div>
<div>
    <button type ="button">확인</button>
    <button type="button">수험표 출력</button>
</div>
