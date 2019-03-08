<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
    function checkFileType(filePath) {
        var fileFormat = filePath.split(".");
        if (fileFormat.indexOf("xlsx") > -1) {
            return true;
        } else {
            return false;
        }
    }
    function check() {
        var file = $("#excelFile").val();

        if(confirm("업로드 하시겠습니까?")){
            if (file == "" || file == null) {
                alert("파일을 선택해주세요.");
                return false;
            } else if (!checkFileType(file)) {
                alert("엑셀 파일만 업로드 가능합니다.");
                return false;
            }
        }
    }
</script>
<table>
    <table>
        <tr>
            <td>성명</td>
            <td>입금내역</td>
        </tr>
        <c:forEach var="item" end="10" items="${list}">
            <tr>
                <td>${item.CER_NAME}</td>
                <td>${item.CER_ENTERPRISENAME}</td>
                <td>
                    <button type="button">입금확인 문자 발송</button>
                </td>
            </tr>
        </c:forEach>
    </table>
</table>
<form action="${pageContext.request.contextPath}/cms/isDespoitChk/excelUpload/" method="post" enctype="multipart/form-data">
    <div>
        <label for="excelFile">첨부파일</label>
        <input type="file" name="excelFile" id="excelFile">
    </div>

    <button type = "button" onclick="return check()">엑셀 파일 업로드</button>
</form>