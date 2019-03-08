<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="pull-right">
    <div class="btn-group">
        <button type="button" id="btnAddRow" class="btn btn-default btn-ssm" disabled> 행추가</button>
        <button type="button" id="btnDelRow" class="btn btn-default btn-ssm" disabled>행삭제</button>
    </div>
    <div class="btn-group">
        <button type="button" id="SelSaveRow" class="btn btn-default btn-ssm" disabled>저장</button>
        <button type="button" id="SelDelRow" class="btn btn-default btn-ssm" disabled>삭제</button>
    </div>
</div>

<div class="row">
    <div class="col-md-4">
        <div id="divGrdMaster" class="panel panel-primary">
            <div class="panel-heading">
                <span class="title">권한 목록</span>
            </div>
            <table class="table-bordered table-hover text-left">
                <thead>
                    <th></th>
                    <th>권한명</th>
                    <th>설명</th>
                </thead>
                <tbody id="grdAuthList">

                </tbody>
            </table>
        </div>
    </div>
    <div class="col-md-8">
        <div id="divGrdSlave" class="panel panel-primary">
            <div class="panel-heading">
                <span class="title">페이지 목록</span>
            </div>
            <table id="grdUrlList" class="grid"></table>
        </div>
    </div>
    <div id="debug"></div>
</div>

<script type="text/javascript">
    var authListIndex = 1;

    function searchAuthList(){
        $.ajax({
           url : '${pageContext.request.contextPath} /cms/cmsAuthList/select',
            data : {},
            success : function (data) {
               console.log(data);

                $('#grdAuthList').html('');

                for (var i = 0; i < data.length; i++) {
                    var row = '';
                    row += '<tr onclick="testLogger(\'' + data[i].AUTH_CODE + '\');">\n';
                    row += '<td>' + (i + 1) + '</td>\n';
                    row += '<td>' + data[i].AUTH_NAME+'</td>\n';
                    row += '<td>'+data[i].AUTH_COMMENT+'</td>\n';
                    row += '</tr>';

                    $('#grdAuthList').append(row);
                    authListIndex = data.length + 1;
                }
            },
            error : function(xhr, stat, err) {
                    console.error(err);
                }
        });
    }

    function testLogger (code) {
        console.log('Code: ' + code);
    }

    $(document).ready(function () {
        searchAuthList();

        // $('#grdAuthList tr td').on('click', function () {
        //     console.log("121212");
        // });

        console.log('pageLoaded');
    });
</script>