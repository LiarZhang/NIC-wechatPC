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
        url: '/NIC-wechat/workManager/getUnFinishList/',
        idField: 'userId',
       // singleSelect: true,//单选
        queryParams: function (params) {
            return $.extend(params, getQryParams());

        },//提交ajax时候的附加参数
        columns: [
            [
            	{
            		checkbox: true
                },
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
                } ,
                 {
                    field: 'techsupportDescribe',
                    title: '描述',
                    align: 'center',
                    valign: 'middle',
                    halign: 'center',
                },
                 {
                      field: 'status_name',
                      title: '进度',
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


//加载managerlist
function loadManager() {
	Common.clearFormValidatorMsg('mngFormWork');
    var rows = $('#table').bootstrapTable('getSelections');
    console.log(rows.length);
    console.log(rows);
    if (rows.length == 0) {
        Common.showModalWarn("请选择一条记录进行操作！");
        return null;
    }
  //  Common.clearFormValidatorMsg('mngFormWork');
  //  Common.clearFormData('mngFormWork');
    Common.showModalMng('work');
    $.ajax({
        url: "/NIC-wechat/manager/getList",
        type: "POST",
        success: function (data) {
            if (data.flag) {
            	var managerStr = "<option selected value=''>--请选择处理人--</option>";
            	var managerList = data.result;
            	for(var m=0;m<managerList.length;m++){
            		var managerInfo = managerList[m];
            		managerStr += "<option value="+managerInfo.managerId+">"+managerInfo.managerName+"</option>";
            		$("#manager").html(managerStr);
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
/**
 * 加载进度
 * @returns
 */
function loadStatus() {
	 $.ajax({
	        url: "/NIC-wechat/status/getStatusList",
	        type: "POST",
	        success: function (data) {
	            if (data.flag) {
	            	var statusStr = "<option selected value=''>--请选择处理进度--</option>";
	            	var statusList = data.result;
	            	for(var m=0;m<statusList.length;m++){
	            		var status = statusList[m];
	            		statusStr += "<option value="+status.statusId+">"+status.statusName+"</option>";
	            		$("#workstatus").html(statusStr);
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
