// View for one quote
var QuoteView = Backbone.View.extend({
	model: new QuoteModel(),
	tagName: 'li',
	initialize: function() {
		this.template = _.template($('.quotes-list-template').html());
	},
	render: function() {
		this.$el.html(this.template(this.model.toJSON()));
		return this;
	},
});