---
date: 2010-08-13T00:00:00Z
meta:
  _edit_last: "1"
  _wp_old_slug: ""
  aktt_notify_twitter: "yes"
  aktt_tweeted: "1"
published: true
status: publish
tags:
- gem
- News
- rails
- rcov
- release
- Releases
- rspec
- ruby
- testing
- tests
title: CoverMe - Code Coverage for Ruby 1.9
type: post
url: /2010/08/13/coverme-code-coverage-for-ruby-1-9/
---

Ruby 1.9(.2) is an amazing language to develop applications in. It's faster, more powerful, cleaner, and a huge improvement over Ruby 1.8.x. Because of those reasons every Ruby developer should move to this exciting new version of our language.

When making a move of this size it's important to have the right tools to help us along. Unfortunately, one of the most useful tools as a Ruby developer, [RCov](http://github.com/relevance/rcov), does not work with Ruby 1.9.

RCov, for those unfamiliar analyzes your code and tells you which part of your code was not executed. This is INCREDIBLY useful when hooked up to your test suite. While, it's not the only metric you should use when determining how good your test coverage it, it certainly is a great first step to point out exactly which parts of your code haven't been touched at all!

Enter [CoverMe](http://github.com/markbates/cover_me).

##History

While working on a Ruby 1.9/Rails 3 project, and loving everything about it (except for the lack of RCov), I came across a [post](http://engineering.attinteractive.com/2010/08/code-coverage-in-ruby-1-9/) by Aaron Patterson (of [Nokogiri](http://github.com/tenderlove/nokogiri) fame). In this post he quickly outlined a very basic coverage tool using the new built-in Coverage module in Ruby 1.9.

After spending a morning playing with it, I was quickly able to grow the idea into something useful for the project. Later that day the company I was consulting for [BiddingForGood.com](http://www.biddingforgood.com), and in particular their chief architect, [Stuart Garner](http://twitter.com/stuartmg), told me to take a day or two and clean it up and release it for the world to use, and so [here](http://github.com/markbates/cover_me) it is.
##Features

Here is a brief overview of the features of CoverMe:

###Index Page

* Sortable column headers (File, Lines, Lines of Code, Tested %).
* Searching/filtering by file name.
* Filtering by coverage percent.
* Color coded list of files to quickly see which ones are 100% covered, &gt; 90% covered, or less than 90% covered.
* Large color coded average coverage percent, for quick reference.

###Detail Page

* Line by line coverage report
* Color coded lines to quickly see which lines where executed and which ones were not.
* Side by side viewing with the corresponding test/spec file (if one exists).

See the [README](http://github.com/markbates/cover_me) file for more information on installation and usage.

##Thanks

I would just quickly like to give another quick thanks to Aaron Patterson for pointing out the Coverage module in Ruby 1.9 and inspiring this, hopefully, helpful little gem. Also another big thanks to Stuart Garner for pushing me to package this up and release it to the world.