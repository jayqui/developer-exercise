var quotesArr = [];
$.getJSON("https://gist.githubusercontent.com/anonymous/8f61a8733ed7fa41c4ea/raw/1e90fd2741bb6310582e3822f59927eb535f6c73/quotes.json")
.done(function(data){
	quotesArr = data;
	quotesArr.forEach(function(obj) {
		obj.id = quotesArr.indexOf(obj) + 1;
	})
	blogs.add(quotesArr.slice(0,5));
});

// Backbone Model
var Blog = Backbone.Model.extend({});

// Backbone Collection
var Blogs = Backbone.Collection.extend({});

// instantiate a collection
var blogs = new Blogs();

// Backbone view for one blog
var BlogView = Backbone.View.extend({
	model: new Blog(),
	tagName: 'tr',
	initialize: function() {
		this.template = _.template($('.blogs-list-template').html());
	},
	render: function() {
		this.$el.html(this.template(this.model.toJSON()));
		return this;
	}
});

// Backbone view for all blogs
var BlogsView = Backbone.View.extend({
	model: blogs,
	el: $('.blogs-list'),
	initialize: function() {
		this.render();
		this.model.on('add', this.render, this);
	},
	render: function() {
		var self = this;
		this.$el.html('');
		_.each(this.model.toArray(), function(blog){
			self.$el.append((new BlogView({model: blog})).render().$el);
		});
		return this;
	}
});

var blogsView = new BlogsView();


$(document).ready(function() {
	var count = 5;
	blogs.add(quotesArr.slice(count,count+5));
	// count += 5;
	$(".add-blog").on("click", function() {
		// blogs.add(quotesArr[count]);
		blogs.add(quotesArr.slice(count,count+5));
		count +=5;
	})
});