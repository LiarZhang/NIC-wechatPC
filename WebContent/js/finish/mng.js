$(function () {

	tableInit();
	$("#inputs").hide();
    $('#li-goods').addClass("active open");
    $('#li-goods-mng').addClass("active open");

    $('#btnQry').click(function () {
        loadData();
    });

    $('#btnAdd').click(function () {
        add();
    });
});


function loadData() {
    $('#table').bootstrapTable('refresh', {query: getQryParams()});
}

function getQryParams() {
	var params = {
	        "parent": $("#parent").val(),
	        "son": $("#city").val(),
	        "inputsearch": $("#inputsearch").val()/*,
	        "username": $("#username").val(),
	        "location": $("#location").val(),*/
	        /*"statusId": $("#statusId").val()*/
	};
    console.info(params);
    return params;
}


function tableInit() {
    $('#table').bootstrapTable({
        url: '/NIC-wechat/workManager/getFinishList/',
        idField: 'userId',
        singleSelect: true,
        queryParams: function (params) {
            return $.extend(params, getQryParams());

        },//提交ajax时候的附加参数
        columns: [
            [
                {
                    field: 'user_name',
                    title: '联系人',
                    halign: 'center',
                    valign: 'middle',
                    align: 'center'
                },
                {
                    field: 'user_nickname',
                    title: '微信昵称',
                    halign: 'center',
                    valign: 'middle',
                    align: 'center'
                },
                {
                    field: 'type',
                    title: '业务类型',
                    halign: 'center',
                    valign: 'middle',
                    align: 'center'
                },
                {
                    field: 'techsupportDevicename',
                    title: '设备名称',
                    halign: 'center',
                    valign: 'middle',
                    align: 'center'
                },
                {
                    field: 'techsupportDepartment',
                    title: '部门',
                    halign: 'center',
                    valign: 'middle',
                    align: 'center'
                },
                {
                    field: 'techsupportUptime',
                    title: '提交时间',
                    halign: 'center',
                    valign: 'middle',
                    align: 'center',
                    /*formatter: function (value, row, index) {
                         	return Common.changeMsToTime(value);
                    }*/
                 },
               {
                    field: 'techsupportLocation',
                    title: '具体地点',
                    align: 'center',
                    valign: 'middle',
                    halign: 'center',
                },
                 {
                      field: 'status_name',
                      title: '状态',
                      align: 'center',
                      valign: 'middle',
                      halign: 'center',
                  },
                  {
                    field: 'manager_name',
                    title: '处理人',
                    align: 'center',
                    valign: 'middle',
                    halign: 'center',
                }
            ]
        ]
    });
}
//改变下拉框
function change(){
	var type = $("#parent").val();
	console.log(type);
	alert(type);
	switch(type){
	case "service":
		$("#city").html("");
		$("#child").show();
		$("#inputs").hide();
		var addressStr = "<option selected value=''>--请选择业务类型--</option>";
    		addressStr += "<option value=技术支持"+">"+'技术支持'+"</option>";
    		addressStr += "<option value=设备报修"+">"+'设备报修'+"</option>";
    		addressStr += "<option value=日常运维"+">"+'日常运维'+"</option>";
    		$("#city").html(addressStr);
		break;
	case "department":
		$("#city").html("");
		$("#child").show();
		$("#inputs").hide();
		$.ajax({
	        url: "/NIC-wechat/departmentManager/getList",
	        type: "POST",
	       // async: true,
	       // dataType: "json",
	       // data: {"areaParentId":provinceId},
	        success: function (data) {
	            if (data.flag) {
	            	var addressStr = "<option selected value=''>--请选择部门--</option>";
	            	var addressInfoList = data.result;
	            	for(var m=0;m<addressInfoList.length;m++){
	            		var addressInfo = addressInfoList[m];
	            		addressStr += "<option value="+addressInfo.departmentName+">"+addressInfo.departmentName+"</option>";
	            		$("#city").html(addressStr);
	            	}
	            	console.log(addressInfo);
	            } else {
	                Common.showModalError(data.errmsg);
	            }
	        },
	        error: function (data) {
	            Common.showModalError(data.errmsg);
	        }
	    });
		break;
	default:
		$("#child").hide();
		$("#inputs").show();
	    $("#inputsearch").show();
	    $("#inputsearch").style.display="inline-block";
		
	}
}

