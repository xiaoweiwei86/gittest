$(document).ready(function(){
	builder();
	var number = getNumber();
	$("#asset").bind('DOMNodeInserted', function (e) {
		number = getNumber();
	});
	$("#asset").children("div").find("button").click(
		function() {
			$(this).parent().parent().remove();
			if ($("#asset").children("div").length == 1) {
				$("#asset").find("button").attr("disabled", true);
			}
		});

	$("#addButton").click(
		function(){
			$("#asset").children("div").last().after($("#asset").children("div").first().clone());
			$("#asset").children("div").find("button").click(
				function(){
					$(this).parent().parent().remove();
					if($("#asset").children("div").length==1){
						$("#asset").find("button").attr("disabled",true);
					}
					builder();
				}
			);
			$("#asset").find("button").attr("disabled",false);
			builder();
			$("input[id$="+number+"]").val("");
			$("button[id$="+number+"]").val("");
		}
	);
});

function getNumber() {
	var number = 0;
	$.each($("input[id^=number]"), function (i) {
		number = i;
	});
	return number;
}
function builder(){
	$.each($("#asset").children(),function(number){
		$("#asset").children("div").eq(number).children().eq(0).find("input").attr("id","number_"+number);
		$("#asset").children("div").eq(number).children().eq(1).find("input").attr("id","name_"+number);
		$("#asset").children("div").eq(number).children().eq(2).find("input").attr("id","specification_"+number);
		$("#asset").children("div").eq(number).children().eq(3).find("input").attr("id","usingTeam_"+number);
		$("#asset").children("div").eq(number).children().eq(4).find("button").attr("id","remove_"+number);
	});	
}

