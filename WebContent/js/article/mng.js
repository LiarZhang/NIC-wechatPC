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
    var url=rows[0].picurl;
    if(url==null||url==''){
    	alert('未上传照片');
    }else{
    	window.open("/NIC-wechat/workManager/loadPicture?picurl="+url);
    }
   
    
}

function loadData() {
    $('#table').bootstrapTable('refresh', {query: getQryParams()});
}

function getQryParams() {
    var params = {
        "devicename": $("#devicename").val(),
        "department": $("#department").val(),
        "type": $("#type").val(),
        "username": $("#username").val(),
        "location": $("#location").val(),
        /*"statusId": $("#statusId").val()*/
    };
    console.info(params);
    return params;
}


function tableInit() {
    $('#table').bootstrapTable({
        url: '/NIC-wechat/shownews/getList/',
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
                     field: 'id',
                     title: 'id',
                     halign: 'center',
                     valign: 'middle',
                     align: 'center'
                 },
                {
                    field: 'title',
                    title: '标题',
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
                    field: 'digest',
                    title: '详细内容',
                    halign: 'center',
                    valign: 'middle',
                    align: 'center'
                }
            ]
        ]
    });
}

