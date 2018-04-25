$(function () {

	tableInit();
    $('#li-goods').addClass("active open");
    $('#li-goods-mng').addClass("active open");

    $('#btnQry').click(function () {
        loadData();
    });

    $('#btnAdd').click(function () {
    	toadd();
    });
    $('#btnSave').click(function () {
    	save();
    });
    $('#btnEdit').click(function () {
    	toEdit();
    });
});

//调新增页面
function toadd(){
	Common.clearFormValidatorMsg('modalMng');
	//var rows = $('#table').bootstrapTable('getSelections');
	 $('#action').val('add');
 	Common.showModalMng('modalMng');
}
//调更新页面
function toEdit(){
	Common.clearFormValidatorMsg('modalMng');
	var rows= $('#table').bootstrapTable('getSelections');
	if (rows == null || rows.length == 0) {
        Common.showModalWarn("请选择一条记录进行操作！");
        return null;
    }
	var record=rows[0];
	console.log(record);
	 $('#passwordDiv').hide();
	 $('#managerId').val(record.managerId);
	 $('#managerName').val(record.managerName);
	 $('#managerTelephone').val(record.managerTelephone);
	 $('#managerDuty').val(record.managerDuty);
	 $('#managerTyp').val(record.managerTyp);
	 $('#action').val('updateManager');
 	Common.showModalMng('modalMng');
}

function deleteManager(id) {
    $.ajax({
        url: "/NIC-wechat/manager/deleteManager",
        type: "POST",
        async: false,
        dataType: "json",
        data: {"managerId":id},
        success: function (data) {
            if (data.flag) {
                alert(data.result);
                $('#table').bootstrapTable('refresh');
            } else {
            	alert(data.errmsg);
            }
        },
        error: function (data) {
            alert(data.errmsg);
        }
    });
}

function save() {
    $('#mngForm').trigger("validate");
    var instance = $('#mngForm').validator().data("validator");
    if (!instance.isFormValid()) {
        return;
    }
	var action = $('#action').val();
    $.ajax({
        url: "/NIC-wechat/manager/"+action,
        type: "POST",
        async: false,
        dataType: "json",
        data: $('#mngForm').serialize(),
        success: function (data) {
            if (data.flag) {
            	$('#modalMng').modal('hide');
                alert(data.result);
                $('#table').bootstrapTable('refresh');
            } else {
            	alert(data.errmsg);
            }
        },
        error: function (data) {
            alert(data.errmsg);
        }
    });
}
function loadData() {
    $('#table').bootstrapTable('refresh', {query: getQryParams()});
}

function getQryParams() {
    var params = {
        "telephone": $("#telephone").val(),
        "type": $("#type").val(),
        "name": $("#name").val(),
        "duty": $("#duty").val()
    };
    console.info(params);
    return params;
}


function tableInit() {
    $('#table').bootstrapTable({
        url: '/NIC-wechat/manager/getManagerList/',
        idField: 'userId',
        singleSelect: true,
        queryParams: function (params) {
            return $.extend(params, getQryParams());

        },//提交ajax时候的附加参数
        columns: [
            [
            	{
                    radio:true
                },
                {
                    field: 'managerName',
                    title: '用户名',
                    halign: 'center',
                    valign: 'middle',
                    align: 'center'
                },
                {
                    field: 'managerTelephone',
                    title: '手机号',
                    halign: 'center',
                    valign: 'middle',
                    align: 'center'
                },
                {
                    field: 'managerDuty',
                    title: '职责',
                    halign: 'center',
                    valign: 'middle',
                    align: 'center'
                },
                {
                    field: 'managerTyp',
                    title: '用户类型',
                    halign: 'center',
                    valign: 'middle',
                    align: 'center',
                    formatter: function (value, row, index) {
                        if(value=='1'){
                            return '普通管理用户';
                        }else{
                        	return '管理用户';
                        }
                    }
                },
                {
                    field: 'managerId',
                    title: '操作',
                    halign: 'center',
                    valign: 'middle',
                    align: 'center',
                    formatter: function (value, row, index) {
                    	return "<button type='button' class='btn blue ' onclick=deleteManager("+value+")>删除</button>";
                    }
                }
                
            ]
        ]
    });
}

