// Model
var QuoteModel = Backbone.Model.extend({});

// Collection
var QuoteCollection = Backbone.Collection.extend({});
var quoteCollection = new QuoteCollection();

// Fetch the JSON
var quotesArr = [];
$.getJSON("https://gist.githubusercontent.com/anonymous/8f61a8733ed7fa41c4ea/raw/1e90fd2741bb6310582e3822f59927eb535f6c73/quotes.json")
.done(function(data){
	quotesArr = data;
	quotesArr.forEach(function(obj) {
		obj.id = quotesArr.indexOf(obj) + 1;
	})
	quoteCollection.add(quotesArr.slice(0,5));
});