$(document).ready(function(){
  module("Accordion tests");

	var $ah1 = $(".accordion-header:first");
	var $ah1div = $(".accordion-header:first div");
	var $ah2 = $(".accordion-header:nth-of-type(2)");
	var $ah2div = $(".accordion-header:nth-of-type(2) div");
	var $ah3 = $(".accordion-header:nth-of-type(3)");
	var $ah3div = $(".accordion-header:nth-of-type(3) div");
	var $ah4 = $(".accordion-header:nth-of-type(4)");
	var $ah4div = $(".accordion-header:nth-of-type(4) div");
	var $ah5 = $(".accordion-header:nth-of-type(5)");
	var $ah5div = $(".accordion-header:nth-of-type(5) div");


	test("Only the first pane out of five is visible at outset", function(assert){
		assert.expect(5);
		assert.ok($ah1div.is(":visible"));
		assert.ok(!$ah2div.is(":visible"));
		assert.ok(!$ah3div.is(":visible"));
		assert.ok(!$ah4div.is(":visible"));
		assert.ok(!$ah5div.is(":visible"));
	});

	test("Only second pane visible after second header is clicked", function(assert) {
		var done = assert.async();

		$ah2.on("click",function() {
			setTimeout(function(){
				assert.ok(!$ah1div.is(":visible"));
				assert.ok($ah2div.is(":visible"));
				assert.ok(!$ah3div.is(":visible"));
				assert.ok(!$ah4div.is(":visible"));
				assert.ok(!$ah5div.is(":visible"));
				done();
			},500)
		});
	  $ah2.trigger("click");
	});

	for (var i = 0; i < 3; i++) {
		test("If I click on second header again, nothing changes regarding what's visible",function(assert) {
			$ah2.on("click",function() {
			var done = assert.async();

				setTimeout(function(){			
					assert.ok(!$ah1div.is(":visible"));
					assert.ok($ah2div.is(":visible"));
					assert.ok(!$ah3div.is(":visible"));
					assert.ok(!$ah4div.is(":visible"));
					assert.ok(!$ah5div.is(":visible"));
					done();
				});
			});
			$ah2.trigger("click");
		});
	};

	test("Only third pane visible after third header is clicked", function(assert) {
		var done = assert.async();

		$ah3.on("click",function() {
			setTimeout(function(){
				assert.ok(!$ah1div.is(":visible"));
				assert.ok(!$ah2div.is(":visible"));
				assert.ok($ah3div.is(":visible"));
				assert.ok(!$ah4div.is(":visible"));
				assert.ok(!$ah5div.is(":visible"));
				done();
			},500)
		});
	  $ah3.trigger("click");
	});

	test("Only fourth pane visible after fourth header is clicked", function(assert) {
		var done = assert.async();

		$ah4.on("click",function() {
			setTimeout(function(){
				assert.ok(!$ah1div.is(":visible"));
				assert.ok(!$ah2div.is(":visible"));
				assert.ok(!$ah3div.is(":visible"));
				assert.ok($ah4div.is(":visible"));
				assert.ok(!$ah5div.is(":visible"));
				done();
			},500)
		});
	  $ah4.trigger("click");
	});

	for (var i = 0; i < 3; i++) {
		test("If I click on fourth header again, nothing changes regarding what's visible",function(assert) {
			$ah4.on("click",function() {
			var done = assert.async();

				setTimeout(function(){			
					assert.ok(!$ah1div.is(":visible"));
					assert.ok(!$ah2div.is(":visible"));
					assert.ok(!$ah3div.is(":visible"));
					assert.ok($ah4div.is(":visible"));
					assert.ok(!$ah5div.is(":visible"));
					done();
				});
			});
			$ah4.trigger("click");
		});
	};

	test("Only fifth pane visible after fifth header is clicked", function(assert) {
		var done = assert.async();

		$ah5.on("click",function() {
			setTimeout(function(){
				assert.ok(!$ah1div.is(":visible"));
				assert.ok(!$ah2div.is(":visible"));
				assert.ok(!$ah3div.is(":visible"));
				assert.ok(!$ah4div.is(":visible"));
				assert.ok($ah5div.is(":visible"));
				done();
			},500)
		});
	  $ah5.trigger("click");
	});

});
