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