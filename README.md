Herein lie the solutions to five exercises.

The original challenges can be found in the file `original_README.markdown`.  These challenges were forked from [this repository](https://github.com/watermelonexpress/developer-exercise).

## Javascript/Coffeescript

### Accordion
A clone of the [jquery UI accordion interface](https://jqueryui.com/accordion/).  To see it in action, open the file `accordion.html`.

### Simple Backbone List
This is a client-side project written in Backbone.js that organizes some quotations pulled off the web from a JSON file.

In addition to the responive design, it includes a dynamic, case-insensitive, client-side search box as well as topical filtering by drop-down menu.

Stretch goals would include:
-  I've demonstrated Qunit tests of what's on the screen.  However, it would be nice to also test the Backbone.js components more directly (e.g., what are the contents of the collection whose view is being displayed at a given time?). Apparently this could be tested using [Chai-Backbone](http://chaijs.com/plugins/chai-backbone). 
-  Combining the topical drop-down search with the client-side live search.  At the moment they merely function independently.
-  Adding a schema of numbers at the bottom of the search so the user can jump to results.


## Ruby

### Array extension
Extending (monkey-patching) Ruby's `Array` class by adding a method called `#where`.  See the code in `where.rb`.

### Youtube client
This is a YouTube scraper that returns searches from YouTube.  It currently works as a command-line app (run with `ruby scrape_search.rb`).  To build it, I used the Nokogiri gem--very helpful for scraping web content.

Steps for future coolness can include:
- Adding an in-browser front end that supplies the string and number via html <input>s
- Embedding the results right on the search page with the 'embed' feature (see tab below any video)--they just give you an iframe like so:

```
<iframe width="560" height="315" src="https://www.youtube.com/embed/Cmuc2Zu7I0Q" frameborder="0" allowfullscreen></iframe>
```

### Simplified Blackjack
This is a simplified game of Blackjack with a command-line interface.  It does not incorporate a few features of full-fledged Blackjack--no betting (so no doubling down), no hand-splitting, and no insurance against a dealer with an Ace.  

The purpose of the exercise is to demonstrate proficiency with getting Ruby classes to interact.  That is why it is written without any of the typical backend frameworks such as Rails or Sinatra. 

A guide to the files:
_nagivate to the `blackjack/` folder and:_
-  Play the game with `ruby play_blackjack.rb`
-  Simulate the game with `ruby simulate_blackjack.rb` (you still must enter in player names)
-  Run all 49 spec tests with `rspec .`
-  An initial schema, from which I eventually deviated but used in planning stages, is found in `initial_schema.png`.