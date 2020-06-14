
/*$('input').bind('input propertychange', function() {
    var part_number=$("#part_number").val().trim().replace(/\s/g, "");
    var cal_number=$("#cal_number").val().trim().replace(/\s/g, "");
    if(part_number==""||cal_number==""){
        $("#print_btn").attr("type","hidden");
    }else {
        $("#print_btn").attr("type","button");
    }
});*/

function print() {
    $("#print").css("display", "none");
    $("#upload_img").css("display", "none");
    $("#close").css("display", "none");
    $("#addItem").css("display", "none");
    $("#reset").css("display", "none");
    $("#content").print({
        globalStyles: true,
        mediaPrint: false,
        stylesheet: null,
        noPrintSelector: ".no_print",
        iframe: true,
        append: null,
        prepend: null,
        manuallyCopyFormValues: true,
        deferred: $.Deferred(),
        timeout: 750,
        title: null,
        doctype: '<!doctype html>',
    });
    $("#print").css("display", "block");
    $("#upload_img").css("display", "block");
    $("#close").css("display", "block");
    $("#addItem").css("display", "block");
    $("#reset").css("display", "block");
}