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