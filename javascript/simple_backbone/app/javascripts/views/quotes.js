// View for all quotes
var QuotesView = Backbone.View.extend({
	count: 0,
	model: quotesCollection,
	el: $('.quotes-list'),
	initialize: function() {
		ajaxRequest.done(function(){
			quotesView.render();
		});
	},
	render: function() {
		this.model.models.forEach(function(ele, index) {ele.set({eyeDee: index+1})})

		var self = this;
		this.$el.html('');
		var toArray = this.model.toArray();
		var nextThree = toArray.slice(this.count,this.count+3);
		_.each(nextThree, function(quote){
			self.$el.append((new QuoteView({model: quote})).render().$el);
		});
		return this;
	},
	incrementCounter: function() {
		if (!(this.count + 3 > this.model.length-1)) {this.count += 3};
	},
	decrementCounter: function() {
		if (!(this.count - 3 < 0)) {this.count -= 3};
	}
});

var quotesView = new QuotesView();