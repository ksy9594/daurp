<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
    #student-list:after {
        content: '';
        display: table;
        clear: both;
    }

    #student-list li {
        display: block;
        width: 19%;
        height: 100px;
        margin-right: 1%;
        margin-bottom: 16px;
        border: 1px solid #d2d2d2;
        -webkit-border-radius: 4px;
        -moz-border-radius: 4px;
        border-radius: 4px;
        float: left;
    }

    #student-list li a {
        display: block;
        width: 100%;
        height: 100%;
        /*border-bottom: 1px solid #d2d2d2;*/
        padding: 20px 2%;
        font-size: 0;
    }
    #student-list li span {
        display: block;
        font-weight: 400;
        font-size: 14px;
        /*vertical-align: middle;*/
        text-align: center;
    }
    #student-list li span.txt-name {
        /*width: 100%;*/
        font-weight: 600;
    }
    #student-list li span.txt-tel {
        /*width: 100%;*/
        /*text-align: right;*/
    }

    @media only screen and (max-width: 480px) {

        #student-list li {
            display: block;
            width: 100%;
            margin-right: 0;
        }
    }
</style>
<script type="text/javascript">
    function studentInfoModal(seq) {
        $.ajax({
            url : '${pageContext.request.contextPath} /attndchk/attndChk/attndStudentInfo',
            data : {
                LEC_SEQ : seq
            },
            success : function (data) {

                $('#LEC_SEQ').val('');
                $('#txt-student-name').val('');
                $('#txt-student-birth').val('');
                $('#txt-student-tel').val('');
                $('#lecture_code').val('');
                $('#btn-modal-submit').attr('disabled', false);


                $('#LEC_SEQ').val(data.LEC_SEQ);
                $('#txt-student-name').val(data.LEC_NAME);
                $('#txt-student-birth').val(data.LEC_BIRTHDAY);
                $('#txt-student-tel').val(data.LEC_TEL);
                $('#lecture_code').val(data.lecture_code);

                if(data.entranceChk == null){
                    $('#btn-modal-submit').text('입실');
                } else if(data.entranceChk.entrance_time != null && data.entranceChk.getout_time == null) {
                    $('#btn-modal-submit').text('퇴실');
                } else if(data.entranceChk.entrance_time != null && data.entranceChk.getout_time != null) {
                    $('#btn-modal-submit').text('출석 완료');
                    $('#btn-modal-submit').attr('disabled', true);
                }
            }
        });
    }
    function searchStudent (char) {
        if (!char) char = '';

        $.ajax({
            url: '${pageContext.request.contextPath}/attndchk/searchStudent/'
            , data: {consonant: char}
            , success: function (data) {
                console.log(data);

                // Reset(clear) list
                $('#student-list').html('');

                // Print list
                for (var i = 0; i < data.length; i++) {
                    var row = '';
                    row += '<li>\n';
                    row +=     '<a href="javascript:" onclick="studentInfoModal(\'' + data[i].LEC_SEQ + '\');">\n';
                    row +=         '<span class="txt-name">' + data[i].LEC_NAME + '</span>\n';
                    row +=         '<span class="txt-tel">' + data[i].LEC_TEL + '</span>\n';
                    row +=     '</a>\n';
                    row += '</li>';
                    $('#student-list').append(row);
                }
            }
            , error: function (xhr, stat, err) {
                console.error(err);
            }
        });
    }
    function attndChk(lec_seq, lecture_code){
        var attndVal = { "LEC_SEQ" : $(lec_seq).val(),
                         "lecture_code" : $(lecture_code).val() };
        $.ajax({
            url : '${pageContext.request.contextPath} /attndchk/attndChk/isAttendChk',
            data : attndVal,
            success : function () {
                alert('성공');
            }
        });
    }
    $(document).ready(function () {
        searchStudent();

        console.log(document.getElementById('student-list'));

        $('.consonantInfo input[type="button"]').on('click', function () {
            var thisVal = $(this).val();
            console.log(thisVal);
            searchStudent(thisVal);
        })
    });
</script>

<p>스마트팩토리 운영관리사 양성과정 2기</p>

<ul id="student-list">
    <li>
        <a href="javascript:" onclick="studentInfoModal('ㅁㅁㅁㅁ', '000-000-0000', '0000-00-00')">
            <span class="txt-name">NAME HERE</span>
            <span class="txt-tel">TEL HERE</span>
        </a>
    </li>
</ul>

<form>
    <div class="consonantInfo">
        <input type="button" id="first" name="consonant" value="ㄱ" />
        <input type="button" id="second" name="consonant" value="ㄴ" />
        <input type="button" id="third" name="consonant" value="ㄷ" />
        <input type="button" id="four" name="consonant" value="ㄹ" />
        <input type="button" id="five" name="consonant" value="ㅁ" />
        <input type="button" id="six" name="consonant" value="ㅂ" />
        <input type="button" id="seven" name="consonant" value="ㅅ" />
        <input type="button" id="eight" name="consonant" value="ㅇ" />
        <input type="button" id="nine" name="consonant" value="ㅈ" />
        <input type="button" id="ten" name="consonant" value="ㅊ" />
        <input type="button" id="eleven" name="consonant" value="ㅋ" />
        <input type="button" id="twelve" name="consonant" value="ㅌ" />
        <input type="button" id="thirteen" name="consonant" value="ㅍ" />
        <input type="button" id="fourteen" name="consonant" value="ㅎ" />
    </div>
</form>


<%--Student Info--%>
<div id="studentInfo" style="padding-top: 32px;">
    <div>
        <div>
            <label for="LEC_SEQ"></label>
            <input type="text" id="LEC_SEQ" name="LEC_SEQ" hidden>
            <input type="text" id="lecture_code" name="lecture_code" hidden>
        </div>
        <div>
            <label for="txt-student-name">성명</label>
            <input type="text" id="txt-student-name" name="studentName" readonly/>
        </div>
        <div>
            <label for="txt-student-birth">생년월일</label>
            <input type="text" id="txt-student-birth" name="studentBirth" readonly />
        </div>
        <div>
            <label for="txt-student-tel">연락처</label>
            <input type="text" id="txt-student-tel" name="studentTel" readonly />
        </div>
            <button type="button">취소</button>
            <button type="button" id="btn-modal-submit" onclick="attndChk($('#LEC_SEQ'), $('#lecture_code'))"></button>
    </div>
</div>