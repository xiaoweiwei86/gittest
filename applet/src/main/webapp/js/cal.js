$(document).ready(function () {
    shuaXin();
    builderIndex();
    var count = 0;
    $("#items").bind('DOMNodeInserted', function (e) {
        shuaXin();
        count = getCount();
    });
    $("#addItemButton").click(function () {
            $("#items").children("div").last().after($("#items").children("div").first().clone());
            $("#items").children("div").find("button").click(
                function () {
                    $(this).parent().parent().remove();
                    if ($("#items").children("div").length == 1) {
                        $("#items").find("button").attr("disabled", true);
                    }
                    builderIndex();
                    cal();
                }
            );
            $("#items").find("button").attr("disabled", false);
            builderIndex();
            //清除添加input组的值
            $("input[id$=" + count + "]").val("");
        }
    );
});


function shuaXin() {
    $("#items").find("input").blur(function () {
            //获取input ID值
            var id_name = this.id;
            //通过ID值来获取第一个num。
            var num = id_name.substr(id_name.length - 1, 1);
            var nominal_value = $("#nominal_value_" + num).val().trim().replace(/\s/g, "");
            var upper_deviation = $("#upper_deviation_" + num).val().trim().replace(/\s/g, "");
            var lower_deviation = $("#lower_deviation_" + num).val().trim().replace(/\s/g, "");
            var max = $("#max_" + num).val().trim().replace(/\s/g, "");
            var min = $("#min_" + num).val().trim().replace(/\s/g, "");
            var tol = $("#tol_" + num).val().trim().replace(/\s/g, "");
            var mean = $("#mean_" + num).val().trim().replace(/\s/g, "");
            var square_tol = $("#square_tol_" + num).val().trim().replace(/\s/g, "");
            if (nominal_value != "" && upper_deviation != "" && lower_deviation != "") {
                max = Number(nominal_value) + Number(upper_deviation);
                min = Number(nominal_value) + Number(lower_deviation);
                $("#max_" + num).val(max.toFixed(6));
                $("#min_" + num).val(min.toFixed(6));
            }
            if (tol < 0) {
                alert("您输入公差小于0，请重新输入！");
                $("#tol_" + num).val("");
            } else {
                if (max != "" && min != "") {
                    if (Number(max) < Number(min)) {
                        alert("您输入的最大值小于了最小值，请重新输入！");
                        $("#max_" + num).val("");
                        $("#min_" + num).val("");
                        $("#nominal_value_" + num).val("");
                        $("#upper_deviation_" + num).val("");
                        $("#lower_deviation_" + num).val("");
                    } else {
                        tol = Number(max) - Number(min);
                        mean = (Number(max) + Number(min)) / 2;
                        $("#tol_" + num).val(tol.toFixed(6));
                        $("#mean_" + num).val(mean.toFixed(6));
                    }
                } else if (max != "" && tol != "") {
                    min = Number(max - tol);
                    mean = (Number(max) + Number(min)) / 2;
                    $("#min_" + num).val(min.toFixed(6));
                    $("#mean_" + num).val(mean.toFixed(6));
                } else if (max != "" && mean != "") {
                    if (Number(mean) > Number(max)) {
                        alert("您输入的平均值有误，请重新输入！");
                        $("#mean_" + num).val("");
                    } else {
                        tol = (Number(max) - Number(mean)) * 2;
                        min = Number(max) - Number(tol);
                        $("#tol_" + num).val(tol.toFixed(6));
                        $("#min_" + num).val(min.toFixed(6));
                    }
                } else if (min != "" && tol != "") {
                    max = Number(min) + Number(tol);
                    mean = (Number(max) + Number(min)) / 2;
                    $("#max_" + num).val(max.toFixed(6));
                    $("#mean_" + num).val(mean.toFixed(6));
                } else if (min != "" && mean != "") {
                    if (Number(mean) < Number(min)) {
                        alert("您输入的平均值有误，请重新输入！");
                        $("#mean_" + num).val("");
                    } else {
                        tol = (Number(mean) - Number(min)) * 2;
                        max = Number(min) + Number(tol);
                        $("#tol_" + num).val(tol.toFixed(6));
                        $("#max_" + num).val(max.toFixed(6));
                    }
                } else if (tol != "" && mean != "") {
                    max = Number(mean) + Number(tol) / 2;
                    min = Number(max) - Number(tol);
                    $("#max_" + num).val(max.toFixed(6));
                    $("#min_" + num).val(min.toFixed(6));
                }
                square_tol = tol * tol;
                if (square_tol != "") {
                    $("#square_tol_" + num).val(square_tol.toFixed(6));
                }
            }
            if (id_name.indexOf("description") < 0) {
                var val = $(this).val().trim().replace(/\s/g, "")
                if (val != "") {  //判断输入框是否为空
                    //input输入自动补全小数点6位
                    $(this).val(Number($(this).val()).toFixed(6));
                }
            }
            cal();
        }
    );
}

function changepic(obj) {
    var newsrc = getObjectURL(obj.files[0]);
    document.getElementById('show').src = newsrc;
}

function getObjectURL(file) {
    var url = null;
    if (window.createObjectURL != undefined) { // basic
        url = window.createObjectURL(file);
    } else if (window.URL != undefined) { // mozilla(firefox)
        url = window.URL.createObjectURL(file);
    } else if (window.webkitURL != undefined) { // webkit or chrome
        url = window.webkitURL.createObjectURL(file);
    }
    return url;
}

function getCount() {
    var count = 0;
    $.each($("input[id^=max]"), function (i, val) {
        count = i;
    });
    return count;
}

function cal() {
    var max = 0, min = 0, tol = 0, mean = 0, sum_sqrt_tol = 0, extremity_max = 0, extremity_min = 0;
    $.each($("input[id^=max]"), function (i, val) {
        max += Number($("#max_" + i).val());
    });
    $("#total_max").val(max.toFixed(3));
    $.each($("input[id^=min]"), function (i, val) {
        min += Number($("#min_" + i).val());
    });
    $("#total_min").val(min.toFixed(3));
    $.each($("input[id^=tol]"), function (i, val) {
        tol += Number($("#tol_" + i).val());
    });
    $("#total_tol").val(tol.toFixed(3));
    $.each($("input[id^=mean]"), function (i, val) {
        mean += Number($("#mean_" + i).val());
    });
    $("#total_mean").val(mean.toFixed(3));
    $.each($("input[id^=square_tol]"), function (i, val) {
        sum_sqrt_tol += Number($("#square_tol_" + i).val());
    });
    $("#sum_sqrt_tol").val(Math.sqrt(sum_sqrt_tol).toFixed(3));

    extremity_max = mean + Math.sqrt(sum_sqrt_tol) / 2;
    extremity_min = mean - Math.sqrt(sum_sqrt_tol) / 2;
    $("#extremity_max").val(extremity_max.toFixed(3));
    $("#extremity_min").val(extremity_min.toFixed(3));
}


function builderIndex() {
    $.each($("#items").children(), function (i, val) {
        $("#items").children("div").eq(i).children().eq(0).find("label").attr("for", "description_" + i);
        $("#items").children("div").eq(i).children().eq(1).find("label").attr("for", "nominal_value_" + i);
        $("#items").children("div").eq(i).children().eq(2).find("label").attr("for", "upper_deviation_" + i);
        $("#items").children("div").eq(i).children().eq(3).find("label").attr("for", "lower_deviation_" + i);
        $("#items").children("div").eq(i).children().eq(4).find("label").attr("for", "max_" + i);
        $("#items").children("div").eq(i).children().eq(5).find("label").attr("for", "min_" + i);
        $("#items").children("div").eq(i).children().eq(6).find("label").attr("for", "tol_" + i);
        $("#items").children("div").eq(i).children().eq(7).find("label").attr("for", "mean_" + i);
        $("#items").children("div").eq(i).children().eq(8).find("label").attr("for", "square_tol_" + i);
        $("#items").children("div").eq(i).children().eq(0).find("input").attr("id", "description_" + i);
        $("#items").children("div").eq(i).children().eq(1).find("input").attr("id", "nominal_value_" + i);
        $("#items").children("div").eq(i).children().eq(2).find("input").attr("id", "upper_deviation_" + i);
        $("#items").children("div").eq(i).children().eq(3).find("input").attr("id", "lower_deviation_" + i);
        $("#items").children("div").eq(i).children().eq(4).find("input").attr("id", "max_" + i);
        $("#items").children("div").eq(i).children().eq(5).find("input").attr("id", "min_" + i);
        $("#items").children("div").eq(i).children().eq(6).find("input").attr("id", "tol_" + i);
        $("#items").children("div").eq(i).children().eq(7).find("input").attr("id", "mean_" + i);
        $("#items").children("div").eq(i).children().eq(8).find("input").attr("id", "square_tol_" + i);
    });
}

/*
$("#max").blur(function () {
    var max = $("#max").val().trim().replace(/\s/g, "");
    var min = $("#min").val().trim().replace(/\s/g, "");
    var tol = $("#tol").val().trim().replace(/\s/g, "");
    var mean = $("#mean").val().trim().replace(/\s/g, "");
    if (max != "" && min != "") {
        if (max < min) {
            alert("您输入的最大值小于了最小值，请重新输入！")
            $("#max").val("");
            $("#min").val("");
        } else {
            tol = Number(max) - Number(min);
            mean = (Number(max) + Number(min)) / 2;
            $("#tol").val(tol.toFixed(4));
            $("#mean").val(mean.toFixed(4));
        }
    } else if (max != "" && tol != "") {
        min = Number(max - tol);
        mean = (Number(max) + Number(min)) / 2;
        $("#min").val(min.toFixed(4));
        $("#mean").val(mean.toFixed(4));
    } else if (max != "" && mean != "") {
        tol = (Number(max) - Number(mean)) * 2;
        min = Number(max) - Number(tol);
        $("#tol").val(tol.toFixed(4));
        $("#min").val(min.toFixed(4));
    }

});
$("#min").blur(function () {
    var max = $("#max").val().trim().replace(/\s/g, "");
    var min = $("#min").val().trim().replace(/\s/g, "");
    var tol = $("#tol").val().trim().replace(/\s/g, "");
    var mean = $("#mean").val().trim().replace(/\s/g, "");
    if (max != "" && min != "") {
        if (max < min) {
            alert("您输入的最大值小于了最小值，请重新输入！")
            $("#max").val("");
            $("#min").val("");
        } else {
            tol = Number(max) - Number(min);
            mean = (Number(max) + Number(min)) / 2;
            $("#tol").val(tol.toFixed(4));
            $("#mean").val(mean.toFixed(4));
        }
    } else if (min != "" && tol != "") {
        max = Number(min) + Number(tol);
        mean = (Number(max) + Number(min)) / 2;
        $("#max").val(max.toFixed(4));
        $("#mean").val(mean.toFixed(4));
    } else if (min != "" && mean != "") {
        tol = (Number(mean) - Number(min)) * 2;
        max = Number(min) + Number(tol);
        $("#tol").val(tol.toFixed(4));
        $("#max").val(max.toFixed(4));
    }
});
$("#tol").blur(function () {
    var max = $("#max").val().trim().replace(/\s/g, "");
    var min = $("#min").val().trim().replace(/\s/g, "");
    var tol = $("#tol").val().trim().replace(/\s/g, "");
    var mean = $("#mean").val().trim().replace(/\s/g, "");
    if (Number(tol) < 0) {
        alert("您输入的公差有误！");
        $("#tol").val("");
    } else {
        if (tol != "" && max != "") {
            min = Number(max) - Number(tol);
            mean = (Number(min) + Number(max)) / 2;
            $("#min").val(min.toFixed(4));
            $("#mean").val(mean.toFixed(4));
        } else if (tol != "" && min != "") {
            max = Number(min) + Number(tol);
            mean = (Number(min) + Number(max)) / 2;
            $("#max").val(max.toFixed(4));
            $("#mean").val(mean.toFixed(4));
        } else if (tol != "" && mean != "") {
            max = Number(mean) + Number(tol) / 2;
            min = Number(max) - Number(tol);
            $("#max").val(max.toFixed(4));
            $("#min").val(min.toFixed(4));
        }
    }
});

$("#mean").blur(function () {
    var max = $("#max").val().trim().replace(/\s/g, "");
    var min = $("#min").val().trim().replace(/\s/g, "");
    var tol = $("#tol").val().trim().replace(/\s/g, "");
    var mean = $("#mean").val().trim().replace(/\s/g, "");
    if (mean != "" && max != "") {
        if (mean > max) {
            alert("您输入的平均值有误，请重新输入！");
            $("#mean").val("");
            $("#max").val("");
        } else {
            tol = (Number(max) - Number(mean)) * 2;
            min = (Number(max) - Number(tol));
            $("#min").val(min.toFixed(4));
            $("#tol").val(tol.toFixed(4));
        }
    } else if (mean != "" && min != "") {
        if(mean<min){
            alert("您输入的平均值有误，请重新输入！");
            $("#mean").val("");
            $("#min").val("");
        }else{
            tol = (Number(mean) - Number(min)) * 2;
            max = (Number(min) + Number(tol));
            $("#max").val(max.toFixed(4));
            $("#tol").val(tol.toFixed(4));
        }

    } else if (mean != "" && tol != "") {
        max = Number(mean) + Number(tol) / 2;
        min = Number(max) - Number(tol);
        $("#max").val(max.toFixed(4));
        $("#min").val(min.toFixed(4));
    }
});
/!*
calculateMoney();
$("#addItemButton").click(
    function(){
        $("#items").children("div").last().after($("#items").children("div").first().clone());
        $("#items").children("div").find("button").click(
            function(){
                $(this).parent().parent().remove();
                if($("#items").children("div").size()==1){
                    $("#items").find("button").attr("disabled",true);
                }
                builderIndex();
                calculateMoney();
            }
        );
        $("#items").find("button").attr("disabled",false);
        builderIndex();
        $(".money").change(
            function(){
                calculateMoney();
            }
        );
        calculateMoney();
    }
);
$(".money").change(
    function(){
        calculateMoney();
    }
);
});/
/ JavaScript Document

function builderIndex(){
$.each($("#items").children(),function(i,val){
    $("#items").children("div").eq(i).children().eq(0).find("select").attr("name","items["+i+"].item");
    $("#items").children("div").eq(i).children().eq(1).find("input").attr("name","items["+i+"].amount");
    $("#items").children("div").eq(i).children().eq(2).find("input").attr("name","items["+i+"].comment");

});
}
function calculateMoney(){
var totalMoney=0;
$.each($(".money"),function(i,val){
    totalMoney+=parseFloat($(".money").eq(i).val());
});
$("#totalMoney").attr("value",totalMoney);
}*!/

*/
