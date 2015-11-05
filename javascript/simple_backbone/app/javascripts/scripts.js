$(document).ready(function() {
	$(".next-button").on("click", function() {
		quotesView.incrementCounter()
		quotesView.render("preserveOrder");
	});
	$(".previous-button").on("click", function() {
		quotesView.decrementCounter()
		quotesView.render("preserveOrder");
	});
	$(".theme-dropdown").change(function() {
		var query = $('option:selected').text();
		if (query === "all") {
			quotesView.render();
		} 
		else {
			var queryTheme = quotesCollection.where({theme: query});
			var themedCollection = new QuotesCollection(queryTheme);
			themedQuotesView = new QuotesView({model: themedCollection});
			themedQuotesView.render("preserveOrder");
		}
	})
});