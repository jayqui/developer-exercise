$(function () {
	// initial setup: show first tab
	$(".accordion-header div").hide();
	$(".accordion-header:first-of-type").addClass("active").children("div").show();

	// on click of non-active tab, deactivate active tabs & slide-hide all the tabs' child divs . . .

	$(".accordion-header").on("click",function(event) {
		event.preventDefault();
		if (!$(this).hasClass("active")) {
			$(".accordion-header").removeClass("active");
			$(".accordion-header div").slideUp();

			// . . . then make the clicked-on one active and slide-show its child div

			$(this).addClass("active").children("div").slideToggle();
		};
	});

});