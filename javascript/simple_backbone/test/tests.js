$(document).ready(function() {
	module("Tests");

	setTimeout(function() {
		test("There should be three quotes on the page", function() {
			equal($(".quote").length, 3)
			ok(true);
		});	
	},300);

	setTimeout(function() {
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

	setTimeout(function() {
		test("Nothing happens when you click the 'previous' button over and over", function() {
			var originalQuotes = findQuotesOnPage();
			for (var i = 0; i < 20; i++) {
				clickPrevious();
				var quotes = findQuotesOnPage();
				ok(compareArrays(quotes, originalQuotes));
			};
		});
	},2500);

	setTimeout(function() {
		test("The quotes change when you click next (if there are more)",function(){
			var originalQuotes = findQuotesOnPage();
			clickNext();
			var quotes = findQuotesOnPage();
			notOk(compareArrays(originalQuotes,quotes));
		});
	},2600);

	setTimeout(function() {
		test("The quotes do not change when you click next repeatedly (if there are no more)",function(){
			for (var i = 0; i < 500; i++) {
				clickNext();
			}
			var originalQuotes = findQuotesOnPage();
			for (var i = 0; i < 20; i++) {
				clickNext();
				var quotes = findQuotesOnPage();
				ok(compareArrays(originalQuotes,quotes));
			}
		});
	},3000);

	setTimeout(function() {
		typeWord("");
	},4500);

});

function clickGames() {
	$(".theme-dropdown").val("games").trigger("click").trigger("change");
}
function clickMovies() {
	$(".theme-dropdown").val("movies").trigger("click").trigger("change");
}
function clickPrevious() {
	$(".previous-button").trigger("click");
}
function clickNext() {
	$(".next-button").trigger("click");
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
function compareArrays(array1,array2){
	if (array1.length !== array2.length) {	
		return false
	}
	for (var i = 0; i < array1.length; i++) {
		if (array1[i] !== array2[i]) {
			return false
		}
	}
	return true
}

console.log("// tests of compareArrays()")
console.log("[1,2] equals [1,2]",compareArrays([1,2],[1,2]))
console.log("[1,2] equals [1,3]",compareArrays([1,2],[1,3]))
console.log("[1,2] equals [1,2,3]",compareArrays([1,2],[1,2,3]))
