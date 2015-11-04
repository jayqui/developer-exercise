// Model
var QuoteModel = Backbone.Model.extend({});

// Collection
var QuotesCollection = Backbone.Collection.extend({});
var quotesCollection = new QuotesCollection();

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

// View for one quote
var QuoteView = Backbone.View.extend({
	model: new QuoteModel(),
	tagName: 'tr',
	initialize: function() {
		this.template = _.template($('.quotes-list-template').html());
	},
	render: function() {
		this.$el.html(this.template(this.model.toJSON()));
		return this;
	},
	events: {
	  'click .theme-link' : 'sortByTheme'
	},
	sortByTheme: function(event) {
		event.preventDefault();
	}
});

// View for all quotes
var QuotesView = Backbone.View.extend({
	model: quotesCollection,
	el: $('.quotes-list'),
	initialize: function() {
		this.render();
		this.model.on('add', this.render, this);
	},
	render: function() {
		var self = this;
		this.$el.html('');
		_.each(this.model.toArray(), function(quote){
			self.$el.append((new QuoteView({model: quote})).render().$el);
		});
		return this;
	}
});

var quotesView = new QuotesView();

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