Herein lie the solutions to five exercises.

The original challenges can be found in the file `original_README.markdown`.  These challenges were forked from [this repository](https://github.com/watermelonexpress/developer-exercise).

## Javascript/Coffeescript

### Accordion
Self-explanatory.  To see it in action, open the file `accordion.html`.

### Simple Backbone List
TBD

## Ruby

### Array extension
Extending Ruby's `Array` class by adding a method called `#where`.  See the code in `where.rb`.

### Youtube client
This is a YouTube scraper that returns searches from YouTube.  It currently works as a command-line app (run with `ruby scrape_search.rb`).  To build it, I used the Nokogiri gem--very helpful for scraping web content.

### Simplified Blackjack
This is a simplified game of Blackjack with a command-line interface.  It does not incorporate a few features of full-fledged Blackjack--no betting (so no doubling down), no hand-splitting, and no insurance against a dealer with an Ace.  

The purpose of the exercise is to demonstrate proficiency with getting Ruby classes to interact.  That is why it is written without any of the typical backend frameworks such as Rails or Sinatra. 

A guide to the files:
_nagivate to the `blackjack/` folder and:
-  Play the game with `ruby play_blackjack.rb`
-  Simulate the game with `ruby simulate_blackjack.rb` (you still must enter in player names)
-  Run all 49 spec tests with `rspec .`
-  An initial schema, from which I eventually deviated but used in planning stages, is found in `initial_schema.png`.