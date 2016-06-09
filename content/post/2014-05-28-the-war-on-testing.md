---
date: 2014-05-28T00:00:00Z
description: ""
tags:
- ruby
- testing
- tdd
- rails
- minitest
title: The War on Testing
url: /2014/05/28/the-war-on-testing/
---



Apologies for the slightly inflammatory title, but I'm beginning to get worried about the Ruby community, and sadly my worries are stemming from an area that first made me fall in love with Ruby, testing.

By now you are probably familiar with the whole "[TDD is Dead](https://www.google.com/#q=ruby+tdd+is+dead)" saga that stemmed from a keynote that DHH recently gave at RailsConf. I'm not going to bother recapping that, do a Google search and you'll find out all about it. I'm not even here to weigh in on the matter.

I'm here to discuss an even more trouble matter, the removal of a testing framework from the Ruby standard library in 2.2. The ticket that removed test-unit and MiniTest from Ruby 2.2 can be found at [https://bugs.ruby-lang.org/issues/9711#note-12](https://bugs.ruby-lang.org/issues/9711#note-12).

The reasons behind removing these tools from the standard library is that it is difficult to maintain them inside the standard library, and that if people want to use them they can just install them as gems. This sounds fine, in theory, but is deeply troubling for a few reasons.

When I tweeted about this the other day I got several responses. Here are a couple that caught my eye:

<img src='/assets/images/2014/05/tweet2.png'>
<img src='/assets/images/2014/05/tweet3.png'>

In regards to the later tweet I would encourage the author of the tweet to consult the Rails documentation on how to turn off automatic test generation. These tweets are concerning because they share the same shortsightedness. These tweets are analogous to saying, "Well, I use HashWithIndifferenceAccess so I don't care if they remove Hash from the standard library". This idea that because you use Rspec and not test-unit or MiniTest that this change does not somehow affect you is wrong. This affects the entire Ruby community.

When I first got introduced to Ruby back in 2005 I was blown away by how testing was a first class citizen in Ruby, and of course Rails. Testing was, and I hope still is, a core tenant of the Ruby community. By removing a testing framework from the standard library we are telling newcomers, as well as though who wish Ruby ill that we don't value testing.

<img src='/assets/images/2014/05/tweet1.png'>

Imagine for a second that you are checking out a new language. You scan through their standard library and find no testing framework. What would you think? I would be taken back. I would assume that there some tool I can probably download somewhere that would allow me to write tests in the language, but I honestly wouldn't get that far. I might just turn the page on that language because they clearly don't value testing.

Previously when a newcomer came to Ruby they could install the standard library and start learning the language right away, that included the ability to write tests for the applications they were writing. Now when a newbie comes to Ruby they have to know to also install RubyGems, then to also install a testing library, of course they'll then have to do some research on what RubyGems are and what testing frameworks there are out there, but once they get through all of that then they'll be able to start learning the language, well... at least until they run into some sort of weird bundler issue, or RubyGems.org is down, but newcomers will just be able to figure all of that out, right?

Now I know I've got a reputation as being a big MiniTest supporter, and I am, for lots of very good reasons, but this goes beyond that. This gets to the core of who we are as a community and how we want to be perceived by others, and how we want to welcome those who are interested in Ruby.

Do we really want to be the language that doesn't ship with a testing framework as part of our standard library? Do we really want to be like Java???
