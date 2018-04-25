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
    	add();
    });
    $('#btnUpdate').click(function () {
    	edit();  
    });
});

function save() {
    $('#mngForm').trigger("validate");
    var instance = $('#mngForm').validator().data("validator");
    if (!instance.isFormValid()) {
        return;
    }
    $('#modalConfirmContent').html("确认要新增吗？");
    Common.showModalConfirm('modalConfirm');
}
//去新增页面
function toadd() {
	Common.clearFormValidatorMsg('modalMng');
	$("#action").val('add');
    Common.showModalMng('modalMng');
}
function add() {
	var action =$("#action").val();
	alert($("#departName").val());
	console.log($("#departName").val());
	$.ajax({
        url: "/NIC-wechat/departmentManager/"+action,
        type: "POST",
        dataType: "json",
        traditional:true,//这使json格式的字符不会被转码  
        data:$('#mngForm').serialize(),
        	/*{
        	//"departmentName":$("#departName").val()
        },*/
        success: function (data) {
        	 $('#modalMng').modal('hide');
             $('#table').bootstrapTable('refresh');
             $('#mngForm')[0].reset();
            if (data.flag) {
                Common.showModalSuccess(data.result);
            } else {
                Common.showModalError(data.errmsg);
            }
        },
        error: function (data) {
            Common.showModalError(data.errmsg);
        }
    });
}

function loadData() {
    $('#table').bootstrapTable('refresh', {query: getQryParams()});
}

function getQryParams() {
    var params = {
        "departmentName": $("#departmentName").val()
    };
    console.info(params);
    return params;
}


function tableInit() {
    $('#table').bootstrapTable({
        url: '/NIC-wechat/departmentManager/getDepartmentList/',
        idField: 'userId',
       // singleSelect: true,//单选
        queryParams: function (params) {
            return $.extend(params, getQryParams());

        },//提交ajax时候的附加参数
        columns: [
            [
            	{
                   radio:true
                },
                {
                    field: 'departmentId',
                    title: '序号',
                    halign: 'center',
                    valign: 'middle',
                    align: 'center'
                },
                {
                    field: 'departmentName',
                    title: '系部、院部名称',
                    halign: 'center',
                    valign: 'middle',
                    align: 'center'
                },
                {
                    field: 'departmentId',
                    title: '操作',
                    halign: 'center',
                    valign: 'middle',
                    align: 'center',
                    formatter: function (value, row, index) {
                    	return "<button type='button' class='btn btn-danger ' onclick=check("+value+")>删除</button>";
                    }
                }
            ]
        ]
    });
}

//修改
function edit() {
	Common.clearFormValidatorMsg('mngForm');
    var rows = $('#table').bootstrapTable('getSelections');
    if (rows == null || rows.length == 0) {
        Common.showModalWarn("请选择一条记录进行操作！");
        return null;
    }
    Common.clearFormValidatorMsg('mngForm');
    Common.clearFormData('mngForm');
    $("#action").val('update');
    $("#departName").val(rows[0].departmentName);
    $("#departmentId").val(rows[0].departmentId);
    Common.showModalMng('modalMng');
}
//删除
function check(id) {
	$.ajax({
        url: "/NIC-wechat/departmentManager/delete",
        type: "POST",
        dataType: "json",
        traditional:true,//这使json格式的字符不会被转码  
        data:{
        	"id":id
        },
        success: function (data) {
             $('#table').bootstrapTable('refresh');
             $('#mngForm')[0].reset();
            if (data.flag) {
                Common.showModalSuccess(data.result);
            } else {
                Common.showModalError(data.errmsg);
            }
        },
        error: function (data) {
            Common.showModalError(data.errmsg);
        }
    });
}

