var QuotesCollection = Backbone.Collection.extend({});
var quotesCollection = new QuotesCollection();

quotesCollection.url = "https://gist.githubusercontent.com/anonymous/8f61a8733ed7fa41c4ea/raw/1e90fd2741bb6310582e3822f59927eb535f6c73/quotes.json";

var ajaxRequest = quotesCollection.fetch();