$(function () {

	tableInit();
	loadManager();
	$("#inputs").hide();
    $('#li-goods').addClass("active open");
    $('#li-goods-mng').addClass("active open");

    $('#btnQry').click(function () {
        loadData();
    });

    $('#btnAdd').click(function () {
        toadd();
    });
    $('#btnWork').click(function () {
    
    	loadupdate();
    });
    $('#btnSave').click(function () {
    	worklogAdd();
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


function loadData() {
    $('#table').bootstrapTable('refresh', {query: getQryParams()});
}

function getQryParams() {
	
    var params = {
        "location": $("#location1").val(),
        "content": $("#content1").val(),
        "managerid": $("#managerid1").val()/*,
        "username": $("#username").val(),
        "location": $("#location").val(),*/
        /*"statusId": $("#statusId").val()*/
    };
    console.info(params);
    return params;
}


function tableInit() {
    $('#table').bootstrapTable({
        url: '/NIC-wechat/worklog/getList/',
        idField: 'userId',
       // singleSelect: true,//单选
        queryParams: function (params) {
            return $.extend(params, getQryParams());

        },//提交ajax时候的附加参数
        columns: [
            [
            	{
            		radio: true
                },
                {
                    field: 'createtime',
                    title: '时间',
                    halign: 'center',
                    valign: 'middle',
                    align: 'center',
                    formatter: function (value, row, index) {
                     	return Common.changeMsToTime(value);
                    }
                },
                {
                    field: 'location',
                    title: '地点',
                    halign: 'center',
                    valign: 'middle',
                    align: 'center'
                },
                {
                    field: 'content',
                    title: '内容',
                    halign: 'center',
                    valign: 'middle',
                    align: 'center'
                },
                {
                    field: 'remark',
                    title: '备注',
                    halign: 'center',
                    valign: 'middle',
                    align: 'center'
                },
                {
                    field: 'managername',
                    title: '操作人',
                    halign: 'center',
                    valign: 'middle',
                    align: 'center'
                },
                {
                    field: 'id',
                    title: '操作',
                    halign: 'center',
                    valign: 'middle',
                    align: 'center',
                    formatter: function (value, row, index) {
                        return "<button type='button' class='btn btn-danger' onclick=dele("+value+")>删除</button>";
                   }
                }
            ]
        ]
    });
}
function dele(id){
	$.ajax({
	    url: "/NIC-wechat/worklog/delete",
	    type: "POST",
	    dataType: "json",
	    data:{"id":id},
	    success: function (data) {
	        if (data.flag) {
	        	$('#table').bootstrapTable('refresh');
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
function loadManager(){
	$.ajax({
	    url: "/NIC-wechat/manager/getList/",
	    type: "POST",
	    success: function (data) {
	        if (data.flag) {
	        	var managerStr = "<option selected value=''>--请选择处理人--</option>";
	        	var managerList = data.result;
	        	for(var m=0;m<managerList.length;m++){
	        		var managerInfo = managerList[m];
	        		managerStr += "<option value="+managerInfo.managerId+">"+managerInfo.managerName+"</option>";
	        		$("#managerid1").html(managerStr);
	        	}
	        	
	        //	Common.showModalMng('modalMng');
	        } else {
	            Common.showModalError(data.errmsg);
	        }
	    },
	    error: function (data) {
	        Common.showModalError(data.errmsg);
	    }
	});
}
//加载新增页面
function  toadd() {
	Common.clearFormValidatorMsg('mngForm');
	Common.clearFormData('mngForm');
	$('#action').val('add');
    Common.showModalMng('modalMng');
}
/**
 * 加载更新页面
 */
function loadupdate() {
	Common.clearFormValidatorMsg('mngFormWork');

	var row = $('#table').bootstrapTable('getSelections');
	console.log(row[0]);
	if (row.length == 0) {
		Common.showModalWarn("请选择一条记录进行操作！");
		return null;
	}
	$('#createtime').val(Common.changeMsToTime(row[0].createtime));
	$('#location').val(row[0].location);
	$('#content').val(row[0].content);
	$('#remark').val(row[0].remark);
	$('#id').val(row[0].id);	
	
	// Common.clearFormValidatorMsg('mngFormWork');
	// Common.clearFormData('mngFormWork');
	Common.showModalMng('modalMng');
}
function worklogAdd() {
	var ctime=$('#createtime').val();
	console.log(ctime);
	var now = new Date(ctime);
	console.log(now);
    $.ajax({
        url: "/NIC-wechat/worklog/add",
        type: "POST",
        dataType: "json",
     //traditional:true,//这使json格式的字符不会被转码  
        data:/*$('#mngForm').serialize()*/
        	{
        		"id":$('#id').val(),
        		"createtime":now,
        		"location":$('#location').val(),
        		"content":$('#content').val(),
        		"remark":$('#remark').val()
        	},
        success: function (data) {
                $('#modalMng').modal('hide');
                $('#modalConfirm').modal('hide');
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
