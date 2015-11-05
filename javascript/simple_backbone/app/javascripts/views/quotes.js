// View for all quotes
var QuotesView = Backbone.View.extend({
	counter: 0,
	incrementBy: 3,
	model: quotesCollection,
	el: $('.quotes-list'),
	render: function(preserveOrder) {
		if (!preserveOrder) {
			this.addIds();
		}
		var self = this;
		this.$el.html('');
		var toArray = this.model.toArray();
		var nextThree = toArray.slice(this.counter,this.counter+this.incrementBy);
		_.each(nextThree, function(quote){
			self.$el.append((new QuoteView({model: quote})).render().$el);
		});
		return this;
	},
	addIds: function() {
		this.model.models.forEach(function(bBModel, index) {bBModel.set({eyeDee: index+1})})
	},
	incrementCounter: function() {
		if (!(this.counter + this.incrementBy > this.model.length-1)) {this.counter += this.incrementBy};
	},
	decrementCounter: function() {
		if (!(this.counter - this.incrementBy < 0)) {this.counter -= this.incrementBy};
	}
});

var quotesView = new QuotesView();