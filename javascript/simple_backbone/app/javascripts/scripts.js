$(document).ready(function() {

	var currentView = quotesView;

	ajaxRequest.done(function() {
		toggleButtonClasses(currentView);
	})

	$(".next-button").on("click", function() {
		currentView.incrementCounter()
		currentView.render("preserveOrder");
		toggleButtonClasses(currentView);
	});

	$(".previous-button").on("click", function() {
		currentView.decrementCounter()
		currentView.render("preserveOrder");
		toggleButtonClasses(currentView);
	});

	$(".theme-dropdown").change(function() {
		var query = $('option:selected').text();
		if (query === "all") {
			currentView = quotesView;
			currentView.render();
		} 
		else {
			var queryTheme = quotesCollection.where({theme: query});
			var themedCollection = new QuotesCollection(queryTheme);
			currentView = new QuotesView({model: themedCollection});
			currentView.render("preserveOrder");
		}
	})
});

function toggleButtonClasses(currentView) {
	if (currentView.counter === 0) {
		$(".previous-button").addClass("disabled");
	}
	else {
		$(".previous-button").removeClass("disabled");
	}
	if (currentView.counter + currentView.incrementBy > currentView.model.length-1) {
		$(".next-button").addClass("disabled"); 
	}
	else {
		$(".next-button").removeClass("disabled");
	}
}