$(function () {
	// initial setup: show first
	$(".accordion-header div").hide();
	$(".accordion-header:first-of-type").addClass("active").children("div").show();

	// 
	$(".accordion-header").on("click",function(event) {
		event.preventDefault();
		if (!$(this).hasClass("active")) {
			$(".accordion-header").removeClass("active");
			$(".accordion-header div").slideUp();

			$(this).addClass("active").children("div").slideToggle();
		};
	});

});