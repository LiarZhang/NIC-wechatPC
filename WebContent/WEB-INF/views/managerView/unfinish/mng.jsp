<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/metronic/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath }/metronic/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath }/metronic/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath }/metronic/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath }/metronic/global/plugins/bootstrap-daterangepicker/daterangepicker.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath }/metronic/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath }/metronic/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath }/metronic/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath }/metronic/global/plugins/clockface/css/clockface.css" rel="stylesheet" type="text/css"/>
  
	<!-- <script src="http://cdn.staticfile.org/webuploader/0.1.0/webuploader.flashonly.min.js"></script> -->

    
    <link href="${pageContext.request.contextPath }/metronic/global/css/components-rounded.min.css" rel="stylesheet" id="style_components"
          type="text/css"/>
    <link href="${pageContext.request.contextPath }/metronic/global/css/plugins.min.css" rel="stylesheet" type="text/css"/>
   
    <link href="${pageContext.request.contextPath }/metronic/layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath }/metronic/layouts/layout/css/themes/darkblue.min.css" rel="stylesheet" type="text/css"
          id="style_color"/>
    <link href="${pageContext.request.contextPath }/metronic/layouts/layout/css/custom.min.css" rel="stylesheet" type="text/css"/>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/metronic/global/plugins/bootstrap-table/bootstrap-table.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/metronic/plugins/nicevalidate/jquery.validator.css">
   
    <script src="${pageContext.request.contextPath }/metronic/global/plugins/jquery.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/metronic/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/metronic/global/plugins/js.cookie.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/metronic/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/metronic/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/metronic/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
   
    <script src="${pageContext.request.contextPath }/metronic/global/plugins/moment.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/metronic/global/plugins/bootstrap-daterangepicker/daterangepicker.min.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/metronic/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"
            type="text/javascript"></script>

    <script src="${pageContext.request.contextPath }/metronic/global/plugins/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js"
            type="text/javascript"></script>

    <script src="${pageContext.request.contextPath }/metronic/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/metronic/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/metronic/global/plugins/clockface/js/clockface.js" type="text/javascript"></script>
   
    <script src="${pageContext.request.contextPath }/metronic/global/scripts/app.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/metronic/pages/scripts/components-date-time-pickers.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/metronic/layouts/layout/scripts/layout.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/metronic/layouts/layout/scripts/demo.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/metronic/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/metronic/global/plugins/bootstrap-table/bootstrap-table.js"></script>
    <script src="${pageContext.request.contextPath }/metronic/global/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
    <script src="${pageContext.request.contextPath }/metronic/global/plugins/jquery-inputmask/jquery.inputmask.bundle.min.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/metronic/plugins/nicevalidate/jquery.validator.min.js"></script>
    <script src="${pageContext.request.contextPath }/metronic/plugins/nicevalidate/local/zh-CN.js"></script>

	<script src="${pageContext.request.contextPath }/js/common.js?"></script>
	
</head>


<div class="row">
    <div class="col-md-12">
        <div class="portlet light portlet-fit bordered">
            <div class="portlet-title">
                <div class="row">
					<div class="col-md-2">
                        <select class="form-control " id="parent" onchange="change()">
                              <option value="">请选择分类</option> 
				              <option value="service">业务类型</option>
				              <option value="department">部门</option>
				              <option value="address">地点</option>
				           <!--    <option value="uptime">提交时间</option> -->
                        </select>
                    </div>
                    <div class="col-md-2" id="child">
                        <select id="city" name="addressid" class="form-control " data-rule="required;">
                        </select>
                    </div>
                    <div class="col-md-2" id="inputs">
                        <input id="inputsearch" type="text" placeholder="请输入搜索关键字" name="val" style="font-size:14px;padding:10px;border:solid 1px #ddd;border-radius:3px;width:180px; line-height:17px;display: none;" />
                    </div>
                    
                    <!--  <div class="col-md-2">
                        <input id="devicename" class="form-control" type="text" placeholder="设备名称"/>
                    </div>
                    <div class="col-md-2">
                        <input id="department" class="form-control" type="text" placeholder="部门"/>
                    </div>
                    <div class="col-md-2">
                        <select class="form-control " id="type">
                            <option selected value="">类型</option>
                            <option value="设备报修">设备报修</option>
                            <option value="技术支持">技术支持</option>
                            <option value="日常运维">日常运维</option>
                        </select>
                    </div>
                     <div class="col-md-2">
                        <input id="username" class="form-control" type="text" placeholder="用户"/>
                    </div>
                    <div class="col-md-2">
                        <input id="location" class="form-control" type="text" placeholder="地点"/>
                    </div> -->
                  <!--   <div class="col-md-2">
                        <select class="form-control " id="statusId">
                            <option selected value="">状态</option>
                            <option value="1">已提交</option>
                            <option value="2">已接收</option>
                            <option value="3">已排班</option>
                            <option value="4">正在处理</option>
                            <option value="5">已完成</option>
                        </select>
                    </div> -->
                    <div class="col-md-2 ">
                        <button id="btnQry" type="button" class="btn blue ">查询</button>
                    </div>
                </div>
            </div>

            <div class="portlet-body">
                 <div id="toolbar" class="btn-group columns columns-left" >
                    <button id="btnAdd" type="button" class="btn btn-success"  >
                        <span >查看图片</span>
                    </button>
					 <button id="btnWork" type="button" class="btn btn-danger" >
                        <span>提交</span>
                    </button>
                    <button id="btnFeedback" type="button" class="btn btn-info" >
                        <span>反馈</span>
                    </button>

                </div>

                <!--iconsPrefix 'Glyphicon' or 'fa' for FontAwesome 使用"fa"时需引用 FontAwesome，并且配合 icons 属性实现效果-->
                <table id="table"
                       data-toolbar="#toolbar"
                       data-method="post"
                       data-toolbar-align="left"
                       data-striped="true"
                       data-undefined-text="-"
                       data-content-type="application/x-www-form-urlencoded"
                       data-show-refresh="true"
                       data-show-columns="true"
                       data-pagination="true"
                       data-query-params-type="false"
                       data-click-to-select="true"
                       data-pagination-v-align="bottom"
                       data-page-size="10"
                       data-page-list="[10, 25, 50, 100]"
                       data-show-footer="false"
                       data-params-type="false"
                       data-side-pagination="server"
                        ></table>
            </div>
        </div>
    </div>
</div>


<!--新增充值记录对话框-->
<div id="modalMng" class="modal fade modal-scroll" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1"
    aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">业务办理反馈</h4>
            </div>
            <div class="modal-body">
                <form id="mngForm" action="" class="form-horizontal">
                    <div class="form-body">

                        <div class="form-group ">
                            <label class="control-label col-md-3">反馈信息</label>

                            <div class="col-md-6">
                                <textarea id="feedback" name="feedback" class="form-control" rows="5"
                                          placeholder="请输入反馈信息"
                                          maxlength="100" data-rule="length[~100]"></textarea>
                            </div>
                        </div>
                    </div>
                  <input type="hidden" id="techsupportId" name="id" >
                </form>

            </div>
            <div class="modal-footer">
                <button class="btn default" type="reset" data-dismiss="modal" aria-hidden="true">关闭</button>
                <button class="btn green" id="btnSave" type="button">保存</button>
            </div>
        </div>
    </div>
</div>
<div id="work" class="modal fade modal-scroll" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1"
    aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">业务办理</h4>
            </div>
            <div class="modal-body">
                <form id="mngFormWork" action="" class="form-horizontal">
                    <div class="form-body">

                        <div class="form-group ">
                            <label class="control-label col-md-3">处理人</label>

                            <div class="col-md-6">
                               <select id="manager" class="form-control " data-rule="required;">
                           		</select>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="control-label col-md-3">处理进度</label>
                            <div class="col-md-6">
                               <select id="workstatus" class="form-control " data-rule="required;">
                           		</select>
                            </div>
                        </div>
                    </div>
                  <input type="hidden" id="techsupportId" name="id" >
                </form>

            </div>
            <div class="modal-footer">
                <button class="btn default" type="reset" data-dismiss="modal" aria-hidden="true">关闭</button>
                <button class="btn green" id="workSubmit" type="button">保存</button>
            </div>
        </div>
    </div>
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="modalConfirm" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    提示
                </h4>
            </div>
            <div class="modal-body" id="modalConfirmContent">
                确认要进行新增吗？
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button id="btnConfirm" type="button" class="btn btn-primary">
                    确认
                </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal -->
</div>

<div class="modal fade" id="modalInfo" tabindex="-1" role="dialog" aria-labelledby="myErrorModal">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content ">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body">
                <div class="alert alert-warning mb10" id="modalInfoMsg">
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath }/js/unfinish/mng.js"></script>

</html>