$(document).ready(function() {
	$(".next-button").on("click", function() {
		quotesView.incrementCounter()
		quotesView.render();
	});
	$(".previous-button").on("click", function() {
		quotesView.decrementCounter()
		quotesView.render();
	});
});