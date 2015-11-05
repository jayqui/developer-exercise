$(document).ready(function() {

	var currentView = quotesView;
	var currentCollection = quotesCollection;

	ajaxRequest.done(function() {
		quotesView.render();
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

	$(".search").on("input",function() {
		var query = $(this).val();
		queryResults = currentCollection.models.filter(function(model) {return model.attributes.quote.toLowerCase().indexOf(query.toLowerCase()) > -1})
		var queriedCollection = new QuotesCollection(queryResults);
		currentView = new QuotesView({model: queriedCollection});
		currentView.render("preserveOrder");
	})

	$(".theme-dropdown").change(function() {
		var query = $('option:selected').text();
		$(".search").val("");
		if (query === "all") {
			currentView = quotesView;
			currentView.render();
			toggleButtonClasses(currentView);
		} 
		else {
			var queryTheme = currentCollection.where({theme: query});
			var themedCollection = new QuotesCollection(queryTheme);
			currentView = new QuotesView({model: themedCollection});
			currentView.render("preserveOrder");
			toggleButtonClasses(currentView);
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