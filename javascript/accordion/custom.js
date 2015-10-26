$(function () {
	$(".accordion-header div").hide();
	$(".accordion-header").on("click",function(event) {
		event.preventDefault();
	$(".accordion-header div").hide();
		$(this).children("div").show();
	});
});