// Fetch the JSON
var quotesArr = [];
$.getJSON("https://gist.githubusercontent.com/anonymous/8f61a8733ed7fa41c4ea/raw/1e90fd2741bb6310582e3822f59927eb535f6c73/quotes.json")
.done(function(data){
	quotesArr = data;
	quotesArr.forEach(function(obj) {
		obj.id = quotesArr.indexOf(obj) + 1;
	})
	quotesCollection.add(quotesArr.slice(0,3));
});

$(document).ready(function() {
	var count = 0;
	$(".next-button").on("click", function() {
		quotesCollection.reset();
		if (!(count + 3 > quotesArr.length)) count +=3;
		quotesCollection.add(quotesArr.slice(count,count+3));
	});
	$(".previous-button").on("click", function() {
		quotesCollection.reset();
		if (!(count - 3 < 0)) count -=3;
		quotesCollection.add(quotesArr.slice(count,count+3));
	});
});