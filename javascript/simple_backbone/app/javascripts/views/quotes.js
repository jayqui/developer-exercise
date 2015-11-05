// View for all quotes
var QuotesView = Backbone.View.extend({
	counter: 0,
	model: quotesCollection,
	el: $('.quotes-list'),
	initialize: function() {
		ajaxRequest.done(function(){
			quotesView.render();
		});
	},
	render: function(preserveOrder) {
		if (!preserveOrder) {
			this.addIds();
		}
		var self = this;
		this.$el.html('');
		var toArray = this.model.toArray();
		var nextThree = toArray.slice(this.counter,this.counter+3);
		_.each(nextThree, function(quote){
			self.$el.append((new QuoteView({model: quote})).render().$el);
		});
		return this;
	},
	addIds: function() {
		this.model.models.forEach(function(bBModel, index) {bBModel.set({eyeDee: index+1})})
	},
	incrementCounter: function() {
		if (!(this.counter + 3 > this.model.length-1)) {this.counter += 3};
	},
	decrementCounter: function() {
		if (!(this.counter - 3 < 0)) {this.counter -= 3};
	}
});

var quotesView = new QuotesView();