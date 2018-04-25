$(function () {


    $('#btnPasswordReset').click(function () {
    	doResetPassword();
    });

});
function doResetPassword() {
    $.ajax({
        url: "/managerManager/password/reset",
        type: "POST",
        async: true,
        dataType: "json",
        data: $('#passwordForm').serialize(),
        beforeSubmit: function () {
            return true;
        },
        success: function (data) {
            if (data.flag) {
                $('#passwordModal').modal('hide');
                $('#passwordForm')[0].reset();
                alert(data.result);
                window.location.href ="/login";
            } else {
                $('#modalInfo2').modal('show');
            }
        }
    });
}

function resetPassword() {
    Common.clearFormData('passwordModal');
    Common.clearFormValidatorMsg('passwordModal');
    Common.showModalMng('passwordModal');
}