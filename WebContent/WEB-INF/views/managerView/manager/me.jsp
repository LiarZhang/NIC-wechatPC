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
    
     <script src="${pageContext.request.contextPath }/js/common/common.js"></script>
</head>

<div class="row">
    <div class="col-md-12">
        <div class="portlet light portlet-fit bordered">
            <div class="portlet-title">
                <div class="row">

                    <div >
                        <lable  class="form-control" >我的信息</lable>
                    </div>
                </div>
            </div>

            <div class="portlet-body">
                <div id="toolbar" class="btn-group columns columns-left">
				 	
                    <button id="btnEdit" type="button" class="btn blue" data-original-title="标签更新">
                        <span>修改信息</span>
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


<!--修改个人信息-->
<div id="modalMng" class="modal fade modal-scroll" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1"
    aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">个人信息</h4>
            </div>
            <div class="modal-body">
                <form id="mngForm" action="#" class="form-horizontal">
                    <div class="form-body">
                        <div class="form-group ">
                            <label class="control-label col-md-3">用户名称</label>

                            <div class="col-md-6 ">
                                <input id="managerName" name="managerName" type="text" class="form-control" maxlength="20"
                                       data-rule="required;length[2~20];"
                                       placeholder="请输入用户名称">
                            </div>
                        </div>
						<div class="form-group " id="passwordDiv">
                            <label class="control-label col-md-3">原密码</label>

                            <div class="col-md-6 " id="passwordDiv2">
                                <input id="managerPassword" name="managerPassword"  type="password" class="form-control" 
                                       data-rule="length[6~20];"
                                       placeholder="请再输入原密码">
                            </div>
                        </div>
                        <div class="form-group " id="passwordDiv">
                            <label class="control-label col-md-3">新密码</label>

                            <div class="col-md-6 " id="passwordDiv2">
                                <input id="newPassword" name="newPassword" class="form-control" 
                                       data-rule="length[6~20];"
                                       placeholder="若不填系统默认为123456">
                            </div>
                        </div>
                        <div class="form-group " id="passwordDiv">
                            <label class="control-label col-md-3">密码确认</label>

                            <div class="col-md-6 " id="passwordDiv2">
                                <input id="newPassword1" name="newPassword1"  class="form-control" 
                                       data-rule="length[6~20];match[newPassword]"
                                       placeholder="若不填系统默认为123456">
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="control-label col-md-3">手机号</label>

                            <div class="col-md-6 ">
                                <input id="managerTelephone"  name="managerTelephone" type="text" class="form-control" maxlength="20"
                                       data-rule="required;length[11];integer[+0];"
                                       placeholder="请输入手机号">
                            </div>
                        </div>

                    </div>
                    <input type="hidden" id="managerDuty" name="managerDuty" value="">
                    <input type="hidden" id="managerTyp" name="managerTyp" value="">
                    <input type="hidden" id="managerId" name="managerId" value="">
                    <input type="hidden" id="action" name="action" value="">
                </form>

            </div>
            <div class="modal-footer">
                <button class="btn default" type="reset" data-dismiss="modal" aria-hidden="true">关闭</button>
                <button class="btn green" id="btnSave" type="button">保存</button>
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
<script src="${pageContext.request.contextPath }/js/manager/me.js"></script>

</html>