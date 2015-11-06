$(document).ready(function() {
	module("Tests");

	var t = setTimeout(function() {
		test("There should be three quotes on the page", function() {
			equal($(".quote").length, 3)
			ok(true);
		});	
	},300);

	var u = setTimeout(function() {
		clickGames();
		test("when I use the drop-down menu to select 'games', the word 'movies' is not contained anywhere in any of the `QuoteView`s", function() {
				var themes = findThemesOnPage();
				equal(themes.indexOf("movies"), -1);
		});
	},500);

	setTimeout(function() {
		clickMovies();
		test("when I use the drop-down menu to select 'movies', the word 'games' is not contained anywhere in any of the `QuoteView`s", function() {
				var themes = findThemesOnPage();
				equal(themes.indexOf("games"), -1);
		});
	},1000)

	setTimeout(function() {
		typeWord("ass");
		test("when I type a word it searches all quotes and only returns quotes with that word", function() {
			var quotes = findQuotesOnPage();
			quotes.forEach(function(quote){
				notEqual(quote.indexOf("ass"),-1);
			})
		});
		test("it can be from both games and movies (if both types of quote-source contain that word)",function() {
			var themes = findThemesOnPage();
			notEqual(themes.indexOf("games"),-1);
			notEqual(themes.indexOf("movies"),-1);
		});
	},1500)

	setTimeout(function() {
		typeWord("");
	},2000);

});
function clickGames() {
	$(".theme-dropdown").val("games").trigger("click").trigger("change");
}
function clickMovies() {
	$(".theme-dropdown").val("movies").trigger("click").trigger("change");
}
function typeWord(word) {
	$(".search").val(word).trigger("input");
}
function findThemesOnPage() {
	$themes = $(".attributions .theme");
	var array = $themes.map(function(ele,obj){
		return obj.innerHTML;
	}).toArray();
	return array;
}
function findQuotesOnPage() {
	$quotes = $(".quote");
	var array = $quotes.map(function(ele,obj){
		return obj.innerHTML;
	}).toArray();
	return array;
}
