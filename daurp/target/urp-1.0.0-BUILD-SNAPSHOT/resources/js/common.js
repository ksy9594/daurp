function authList(path,grd,authListIndex) {
    $.ajax({
        url : path,
        data : {},
        success : function (data) {
            console.log(data);

            grd.html('');

            for(var i = 0; i < data.length; i++){
                var row = '';
                row += '<tr onclick="urlList(\'' + data[i].AUTH_CODE + '\');">\n';
                row += '<td>' + (i + 1) + '</td>\n';
                row += '<td>' + data[i].AUTH_NAME + '</td>\n';
                row += '<td>' + data[i].AUTH_COMMENT + '</td>\n';
                row += '</tr>';

                grd.append(row);
                authListIndex = data.length + 1;
            }
        },
        error : function (xhr, stat, err) {

        }
    });
}