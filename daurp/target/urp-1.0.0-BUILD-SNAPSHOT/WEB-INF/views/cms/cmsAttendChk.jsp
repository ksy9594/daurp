<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
    // document.getElementById('attendDate').value = new Date().toISOString().substring(0, 10);

    function selectDegree(date,lecName){
        var path = "${pageContext.request.contextPath} /cms/cmsAttendChk/?date="+date+"$lec_code="+lecName;

        return location.href = path;
    }

    $(document).ready(function () {
        if ($('#attndDate').val() === '') {
            var date = new Date().toISOString().substring(0, 10);
            $('#attndDate').val(date);
        }
    });
</script>
 <form name="selectValue" onsubmit="return selectDegree($('#attndDate'),$('#attendLecName'))">
    <div>
        <label for="attndDate">날짜</label>
        <input type="date" name="attndDate" value="${params.attndDate}" id="attndDate" title="날짜"/>
    </div>
    <div>
        <label for="attendLecName">교육 회차</label>
        <select name="attendLecName" id="attendLecName" title="교육명">
            <option value="">선택</option>
            <c:forEach var="item" items="${lecName}"  varStatus="status">
            <option value="${item.lecture_code}" ${item.lecture_code eq params.attendLecName  ? 'selected':""}>
                    ${item.lecture_name}(${item.start_time}~${item.end_time})
            </option>
            </c:forEach>
        </select>
        <button type="submit">검색</button>
    </div>
 </form>
    <div>
        <button type="button" name="attendTotal">전체</button>
        <button type="button" name="isAttendTrue">출석</button>
        <button type="button" name="isAttendFalse">미출석</button>
    </div>
    <table>
        <tr>
            <th>이름</th>
            <th>연락처</th>
            <th>생년월일</th>
            <th>출석 상태</th>
            <th>출석정보</th>
        </tr>
        <c:choose>
            <c:when test="${list eq null}">
                <p>데이터가 존재하지 않습니다.</p>
            </c:when>
            <c:otherwise>
                <c:forEach var="item" items="${list}">
                    <tr>
                        <td>${item.NAME}</td>
                        <td>${item.TEL}</td>
                        <td>${item.BIRTH}</td>
                        <td>${item.atndDATE}</td>
                        <td>
                            <button type = "button">출석 정보</button>
                        </td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </table>