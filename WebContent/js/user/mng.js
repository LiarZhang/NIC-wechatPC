$(function () {

	tableInit();
    $('#li-goods').addClass("active open");
    $('#li-goods-mng').addClass("active open");

    $('#btnQry').click(function () {
        loadData();
    });

    $('#btnAdd').click(function () {
        add();
    });
    $('#btnFeedback').click(function () {
        edit();
    });
    $('#btnWork').click(function () {
    	loadManager();
    	loadStatus();
    });
    $('#btnSave').click(function () {
    	feedback();
    });
    $('#workSubmit').click(function () {
    	work();  
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
//查看图片
function add() {
	Common.clearFormValidatorMsg('mngFormForUpdate');
    var rows = $('#table').bootstrapTable('getSelections');
    if (rows == null || rows.length == 0) {
        Common.showModalWarn("请选择一条记录进行操作！");
        return null;
    }
    var url=rows[0].techsupportPicture;
    console.log(url);
    if(url==null||url==''){
    	alert('用户未上传照片');
    }else{
    	window.open("/NIC-wechat/workManager/loadPicture?picurl="+url);
    }
}

function loadData() {
    $('#table').bootstrapTable('refresh', {query: getQryParams()});
}

function getQryParams() {
    var params = {
        "userName": $("#userName").val(),
        "userDepartment": $("#userDepartment").val(),
        "userSex": $("#userSex").val(),
        "userNickname": $("#userNickname").val(),
        "userTelephone": $("#userTelephone").val(),
    };
    console.info(params);
    return params;
}


function tableInit() {
    $('#table').bootstrapTable({
        url: '/NIC-wechat/userManager/getList/',
        idField: 'userId',
       // singleSelect: true,//单选
        queryParams: function (params) {
            return $.extend(params, getQryParams());

        },//提交ajax时候的附加参数
        columns: [
            [
                {
                    field: 'userName',
                    title: '微信用户',
                    halign: 'center',
                    valign: 'middle',
                    align: 'center'
                },
                {
                    field: 'userNickname',
                    title: '微信昵称',
                    halign: 'center',
                    valign: 'middle',
                    align: 'center'
                },
                {
                    field: 'userSex',
                    title: '性别',
                    halign: 'center',
                    valign: 'middle',
                    align: 'center',
                    formatter: function (value, row, index) {
                    	if(value=='1'){
                    		return '男';
                    	}
                     	return '女';
                    }
                },
                {
                    field: 'userTelephone',
                    title: '手机号',
                    halign: 'center',
                    valign: 'middle',
                    align: 'center'
                },
                {
                    field: 'userDepartment',
                    title: '部门',
                    halign: 'center',
                    valign: 'middle',
                    align: 'center'
                },
                 {
                    field: 'userHeadimgurl',
                    title: '头像',
                    align: 'center',
                    valign: 'middle',
                    halign: 'center',
                    formatter: function (value, row, index) {
                    	return Common.getFieldFormatterImg(value,50,50);
                    }
                 },
                 {
                    field: 'userSubscribetime',
                    title: '注册时间',
                    align: 'center',
                    valign: 'middle',
                    halign: 'center',
                    formatter: function (value, row, index) {
                     	return Common.changeMsToTime(value);
                    }
                }
            ]
        ]
    });
}

//反馈
function edit() {
	Common.clearFormValidatorMsg('mngForm');
    var rows = $('#table').bootstrapTable('getSelections');
    if (rows == null || rows.length == 0) {
        Common.showModalWarn("请选择一条记录进行操作！");
        return null;
    }
    Common.clearFormValidatorMsg('mngForm');
    Common.clearFormData('mngForm');
    $("#parentIdDiv").html("");
    Common.showModalMng('modalMng');
}
function feedback() {
	var feedbackIdArray= $('#table').bootstrapTable('getSelections');
	var IdArray=new Array(feedbackIdArray.length);
	for (var int = 0; int < feedbackIdArray.length; int++) {
		IdArray[int]=feedbackIdArray[int].techsupportId;
	}
	var IdList=JSON.stringify(IdArray);
	//var idlist=IdList["techsupportId"];
    $.ajax({
        url: "/NIC-wechat/workManager/feedback",
        type: "POST",
        dataType: "json",
        traditional:true,//这使json格式的字符不会被转码  
        data:{"IdList":IdList, "feedback":$("#feedback").val()	
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
function work() {
	var techArray= $('#table').bootstrapTable('getSelections');
	var IdArray=new Array(techArray.length);
	for (var int = 0; int < techArray.length; int++) {
		IdArray[int]=techArray[int].techsupportId;
	}
	var IdList=JSON.stringify(IdArray);
    $.ajax({
        url: "/NIC-wechat/workManager/doWork",
        type: "POST",
        dataType: "json",
        traditional:true,//这使json格式的字符不会被转码  
        data:{"IdList":IdList, 
        	"managerId":$("#manager").val(),	
        	"statusId":$("#workstatus").val()
        },
        success: function (data) {
                $('#work').modal('hide');
                $('#work').modal('hide');
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
