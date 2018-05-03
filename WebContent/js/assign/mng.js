$(function () {

	tableInit();
	loadManager();
	loadStatus();
	$("#inputs").hide();
    $('#li-goods').addClass("active open");
    $('#li-goods-mng').addClass("active open");

    $('#btnQry').click(function () {
        loadData();
    });

    $('#btnAdd').click(function () {
        toadd();
    });
    $('#btnSave').click(function () {
    	assign();
    });
    $('#btnEdit').click(function () {
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

function loadData() {
    $('#table').bootstrapTable('refresh', {query: getQryParams()});
}

function getQryParams() {
	
    var params = {
    		"location": $("#location1").val(),
            "content": $("#content1").val(),
            "managerid": $("#managerid1").val(),
        "status": $("#status1").val()/*,
        "location": $("#location").val(),*/
        /*"statusId": $("#statusId").val()*/
    };
    console.info(params);
    return params;
}


function tableInit() {
    $('#table').bootstrapTable({
        url: '/NIC-wechat/assignManager/getList/',
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
                /*{
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
                },*/
                {
                    field: 'createtime',
                    title: '指派时间',
                    halign: 'center',
                    valign: 'middle',
                    align: 'center',
                    formatter: function (value, row, index) {
                         	return Common.changeMsToTime(value);
                    }
                 },
                 {
                    field: 'location',
                    title: '具体地点',
                    align: 'center',
                    valign: 'middle',
                    halign: 'center',
                } ,
                 {
                    field: 'content',
                    title: '描述',
                    align: 'center',
                    valign: 'middle',
                    halign: 'center',
                },
                {
                    field: 'remark',
                    title: '备注',
                    align: 'center',
                    valign: 'middle',
                    halign: 'center',
                },
                 {
                      field: 'status',
                      title: '进度',
                      align: 'center',
                      valign: 'middle',
                      halign: 'center',
                      formatter: function (value, row, index) {
	                      	if(value=="0"){
	                      		return "未分配";
	                      	}
	                      	if(value=="1"){
	                      		return "已分配";
	                      	}
	                      	if(value=="2"){
	                      		return "正在处理";
	                      	}
	                      	if(value=="3"){
	                      		return "已完成";
	                      	}
                      }
                  },
                  {
                    field: 'managername',
                    title: '处理人',
                    align: 'center',
                    valign: 'middle',
                    halign: 'center',
                }
            ]
        ]
    });
}
/*//改变下拉框
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
	
}*/


//加载分配页面
function toadd() {
	loadManager();
	loadStatus();
	Common.clearFormValidatorMsg('mngForm');
   	Common.clearFormData('mngForm');
    Common.showModalMng('modalMng');
}
//修改进度页面
function edit() {
	Common.clearFormValidatorMsg('mngForm');
    Common.clearFormData('mngForm');
    var rows = $('#table').bootstrapTable('getSelections');
    if (rows == null || rows.length == 0) {
        Common.showModalWarn("请选择一条记录进行操作！");
        return null;
    }
    if (rows.length >1) {
        Common.showModalWarn("请选择一条记录进行操作！");
        return null;
    }
    console.log(rows[0]);
    loadManager();
    loadStatus() ;
    $('#id').val(rows[0].id);
    $('#managerid').val(rows[0].managername);
    $('#location').val(rows[0].location);
    $('#content').val(rows[0].content);
    $('#remark').val(rows[0].remark);
    
    Common.showModalMng('modalMng');
}


//加载managerlist
function loadManager() {
/*	Common.clearFormValidatorMsg('mngFormWork');
    var rows = $('#table').bootstrapTable('getSelections');
    console.log(rows.length);
    console.log(rows);
    if (rows.length == 0) {
        Common.showModalWarn("请选择一条记录进行操作！");
        return null;
    }
  //  Common.clearFormValidatorMsg('mngFormWork');
  //  Common.clearFormData('mngFormWork');
    Common.showModalMng('work');*/
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
            		$("#managerid").html(managerStr);
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
/**
 * 加载进度
 * @returns
 */
function loadStatus() {
	var statusStr = "<option selected value=''>--请选择处理进度--</option>";
	statusStr += "<option value="+0+">"+'未分配'+"</option>";
	statusStr += "<option value="+1+">"+'已分配'+"</option>";
	statusStr += "<option value="+2+">"+'正在处理'+"</option>";
	statusStr += "<option value="+3+">"+'已完成'+"</option>";
	
	$("#status").html(statusStr);
	$("#status1").html(statusStr);    	
	 
}

function assign() {
	$.ajax({
		url : "/NIC-wechat/assignManager/assign",
		type : "POST",
		dataType: "json",
        data:$('#mngForm').serialize(),
		success : function(data) {
			if (data.flag) {
				$('#modalMng').modal('hide');
				$('#table').bootstrapTable('refresh');
	        	Common.showModalSuccess(data.result);
				// Common.showModalMng('modalMng');
			} else {
				Common.showModalError(data.errmsg);
			}
		},
		error : function(data) {
			Common.showModalError(data.errmsg);
		}
	});		
}
