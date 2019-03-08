<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form>
    <div class="pull-right">
        <div class="btn-group">
            <button id="btnAddRow" type="button" class="btn btn-default btn-ssm" onclick="addRow()"> 행추가</button>
            <button id="btnDelRow" type="button" class="btn btn-default btn-ssm" onclick="delRow()">행삭제</button>
            <button type="button" class="btn btn-default btn-ssm" onclick="saveRow()">저장</button>
            <button type="button" id= "SelDelRow" name = "SelDelRow" class="btn btn-default btn-ssm">삭제</button>

        </div>
    </div>
    <div>
        <div>
            <div id="divGrdMain" class="panel panel-primary">
                <div class="panel-heading">
                    <span class="title">목록</span>
                </div>
                <table class="grid">
                    <thead>
                        <th>번호</th>
                        <th>
                            <input type="checkbox" id="totalCol">
                        </th>
                        <th>코드번호</th>
                        <th>권한명</th>
                        <th>설명</th>
                        <th>수정일</th>
                    </thead>
                    <tbody id="grdMain">

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</form>
<script type="text/javascript">
    //var rowCount = $('#grdMain > tbody > tr').length;

    var index = 1;

    function saveRow() {
        var addCol = $('#grdMain tr td input[value="insert"]').length;


        for(var i = 0; i < addCol; i++){

            //authCode.push($("#grdMain tr:eq("+i+") td input").eq(0).val());
            var authCode = {"authCode" : $("#grdMain tr:eq("+i+") td input").eq(1).val(),
                            "authName" : $("#grdMain tr:eq("+i+") td input").eq(2).val(),
                            "authComment" : $("#grdMain tr:eq("+i+") td input").eq(3).val(),
                                                        };
            $.ajax({
                url : '${pageContext.request.contextPath} /cms/cmsAuthList/add',
                data : authCode,
                success : function () {
                    searchAuthList();
                    console.log("성공");
                },
                error : function (xhr,stat,err) {
                    console.error(err);
                }
            });
        }
    }

    function addRow(){

        var table = document.getElementById('grdMain');
        var row = table.insertRow(0);
        var seq  = row.insertCell(0);
        seq.innerHTML = index;

        var rowCheck = row.insertCell(1);
        var rowCheckType = document.createElement("input");
        rowCheckType.type = "checkbox";
        rowCheck.appendChild(rowCheckType);

        var authCode = row.insertCell(2);
        var authCodeType =  document.createElement("input");
        authCodeType.id = "codeNum";
        authCodeType.name = "codeNum";
        authCodeType.title = "코드번호";
        authCode.appendChild(authCodeType);

        var authNm = row.insertCell(3);
        var authCommentType = document.createElement("input");
        authCommentType.id = "authNm";
        authCommentType.name = "authNm";
        authCommentType.title = "권한명";
        authNm.appendChild(authCommentType);
        
        var authComment = row.insertCell(4);
        var authCommentType = document.createElement("input");
        authCommentType.id = "authComment";
        authCommentType.name = "authComment";
        authCommentType.title = "권한설명";
        authComment.appendChild(authCommentType);

        var colStatus = row.insertCell(5);
        var colStatusType = document.createElement("input");
        colStatusType.type = "hidden";
        colStatusType.id = "colStatus";
        colStatusType.name = "colStatus";
        colStatusType.value = "insert";
        colStatus.appendChild(colStatusType);

        index++;
    }
    function delRow() {
      document.getElementById('grdMain').deleteRow(0);
    }
    function searchAuthList(){
        $.ajax({
            url : '${pageContext.request.contextPath} /cms/cmsAuthList/select',
            data : {},
            success : function (data) {

                $('#grdMain').html('');

                for(var i = 0; i < data.length; i++){
                    var row = '';
                    row += '<tr>\n';
                    row += '<td>'+(i+1)+'</td>\n';
                    row += '<td><input type="checkbox" name="colSelected"></td>\n';
                    row += '<td>\n';
                    row += '<input type="text" id="codeNum" name ="codeNum" value='+data[i].AUTH_CODE+'>\n';
                    row += '</td>\n';
                    row += '<td>\n';
                    row += '<input type="text" id="authNm" name ="authNm" value='+data[i].AUTH_NAME+ '>\n';
                    row += '</td>\n';
                    row += '<td>\n';
                    row += '<input type="text" id="authComment" name ="authComment" value='+data[i].AUTH_COMMENT+'>\n';
                    row += '</td>\n';
                    row += '<td>'+data[i].AUTH_LAST_MODIFY_DATE+'</td>\n';
                    row += '<td>\n';
                    row += '<input type="hidden" id="colStatus" name="colStatus" value="select">';
                    row += '</td>\n';
                    row += '</tr>';

                    $('#grdMain').append(row);
                    index = data.length + 1;
                }
            }, error : function (xhr,stat,err) {
                console.error(err);
            }
            });
    }

    $(document).ready(function () {

        searchAuthList();

        $('#totalCol').click(function () {
            if($('#totalCol').prop("checked")){
                $("input[name=colSelected]").prop("checked", true);
            } else {
                $("input[name=colSelected]").prop("checked", false);
            }
        });

        $('#SelDelRow').click(function () {
            var rowData = new Array();
            var tdArr = new Array();

            var checkboxCol = $("input[name=colSelected]:checked");

            checkboxCol.each(function (i) {
                var tr = checkboxCol.parent().parent().eq(i);
                var td = tr.children();

                rowData.push(tr.text());

                var codeNum = td.eq(2).find('input[type="text"]').val();
                var authNm = td.eq(3).find('input[type="text"]').val();
                var authComment = td.eq(4).find('input[type="text"]').val();
                var colStatus = td.eq(6).find('input[type="hidden"]').val();

                tdArr.push(codeNum);
                tdArr.push(authNm);
                tdArr.push(authComment);
                tdArr.push(colStatus);

                $.ajaxSettings.traditional = true;

                $.ajax({
                    url : '${pageContext.request.contextPath} /cms/cmsAuthList/deleteSelRow',
                    data : {
                        param : tdArr
                    },
                    success : function () {
                        console.log("성공적으로 삭제되었습니다.");
                        searchAuthList();
                    },
                    error : function (xhr, stat, err) {
                        console.error(err);
                    }
                });

                console.log("RowData       :    " + rowData);
                console.log("tdArr       :    " + tdArr);

                rowData = [];
                tdArr = [];

            });

        });

    });
</script>