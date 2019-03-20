<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col-md-8">
        <div id="divGrdMaster" class="panel panel-primary">
            <div class="pull-right">
                <div class="btn-group">
                    <button type="button"  class="btn btn-default btn-ssm" onclick="addUrlRow()" disabled> 행추가
                    </button>
                    <button type="button" class="btn btn-default btn-ssm" onclick="delUrlRow()" disabled>행삭제</button>
                </div>
                <div class="btn-group">
                    <button type="button" class="btn btn-default btn-ssm" onclick="saveUrlRow()" disabled>저장
                    </button>
                    <button type="button" class="btn btn-default btn-ssm" disabled>삭제</button>
                    <button type="button" class="btn btn-default btn-ssm" disabled>복사</button>
                </div>
            </div>
            <div class="panel-heading">
                <span class="title">강의 차수</span>
            </div>
            <table class="table-bordered table-hover text-left">
                <thead>
                    <th></th>
                    <th>교육회차</th>
                    <th>장소</th>
                    <th>모집기한</th>
                    <th>시작시간</th>
                    <th>종료시간</th>
                </thead>
                <tbody id="grdLectureDegreeList">

                </tbody>
            </table>
        </div>
    </div>
    <div class="col-md-6">
        <div id="divGrdSlave" class="panel panel-primary">
            <div class="pull-right">
                <div class="btn-group">
                    <button type="button"  class="btn btn-default btn-ssm" onclick="addUrlRow()" disabled> 행추가
                    </button>
                    <button type="button" class="btn btn-default btn-ssm" onclick="delUrlRow()" disabled>행삭제</button>
                </div>
                <div class="btn-group">
                    <button type="button" class="btn btn-default btn-ssm" onclick="saveUrlRow()" disabled>저장
                    </button>
                    <button type="button" class="btn btn-default btn-ssm" disabled>삭제</button>
                </div>
            </div>
            <div class="panel-heading">
                <span class="title">교육 과목</span>
            </div>
            <table class="table-bordered table-hover text-left">
                <thead>
                <th></th>
                <th>
                    <input type="checkbox" id="totalUrlCol">
                </th>
                <th>일자</th>
                <th>과목명</th>
                <th>시작시간</th>
                <th>종료시간</th>
                </thead>
                <tbody id="grdLectureSubjectList">

                </tbody>
            </table>
        </div>
    </div>
    <div id="debug"></div>
</div>

<script>
    var grdLectureDegreeListIndex = 1;
    var grdLectureSubjectList = 1;
    var lectureCode;

    function degreeList(){
        $.ajax({
            url : '${pageContext.request.contextPath} /cms/lectureManager/select',
            data : {},
            success : function (data) {
                console.log(data);
                $('#grdLectureDegreeList').html('');

                for(var i=0; i < data.length; i++){
                    var row = '';
                    row +='<tr onclick="subjectList(\''+data[i].code+'\')">\n';
                    row +='<td>'+(i+1)+'</td>';
                    row += '<td><input type="text" id="lectureName" name="lectureName" value="'+data[i].name+'"></td>\n';
                    row += '<td><input type="text" id="lectureLocation" name="lectureLocation" value="'+data[i].location+'"></td>\n';
                    row += '<td><input type="date" id="lecturePeriod" name="lecturePeriod" value="'+data[i].period+'"></td>\n';
                    row += '<td><input type="time" id="lectureStartDate" name="lectureStartDate" value="'+data[i].start+'"></td>\n';
                    row += '<td><input type="time" id="lectureEndDate" name="lectureEndDate" value="'+data[i].end+'"></td>\n';
                    row += '<td><input type="hidden" id="colStatus" name="colStatus" value="select"></td>\n';
                    row += '</tr>';

                    $('#grdLectureDegreeList').append(row);
                    grdLectureDegreeListIndex = data.length + 1;
                }
            },
            error : function (xhr,stat,err) {
                console.error(err);
            }
        });
    }
    function subjectList(code){
        lectureCode = code;

        $.ajax({
           url : '${pageContext.request.contextPath} /cms/lectureManager/subjectSelect',
           data : {
                code : lectureCode
           },
            success : function (data){
                $('#grdLectureSubjectList').html('');

                for(var i=0; i < data.length; i++){
                    var row = '';
                    row += '<tr>\n';
                    row += '<td>'+ (i+1) + '</td>\n';
                    row += '<td><input type="checkbox" name="colSubject" id="colSubject"></td>\n';
                    row += '<td><input type="text" name="subjectName" id="subjectName" value="'+data[i].name+'"></td>\n';
                    row += '<td><input type="time" name="startTime" id="startTime" value="'+data[i].start+'"></td>\n';
                    row += '<td><input type="time" name="endTime" id="endTime" value="'+data[i].end+'"></td>\n';
                    row += '<td><input type="hidden" name="colStatus" id="colStatus" value="select"></td>\n';
                    row += '<td><input type="hidden" name="subSeq" id="subSeq" value="'+data[i].seq+'"></td>\n';
                    row += '</tr>';

                    $('#grdLectureSubjectList').append(row);
                    grdLectureSubjectList = data.length + 1;
                }
            }
        });
    }
    $(document).ready(function(){
        degreeList();
    });
</script>


