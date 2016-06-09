---
date: 2011-04-15T00:00:00Z
meta:
  _edit_last: "1"
  aktt_notify_twitter: "yes"
  aktt_tweeted: "1"
published: true
status: publish
tags:
- active record
- coffee script
- erb
- General
- haml
- jquery
- rails
- rspec
- ruby
title: Because everybody has an opinion...
type: post
url: /2011/04/15/because-everybody-has-an-opinion/
---

In case you've been living in a cave this week you've probably heard that [Ruby on Rails](http://www.rubyinside.com/rails-3-1-adopts-coffeescript-jquery-sass-and-controversy-4669.html) is going to be including both the [CoffeeScript](http://coffeescript.org/) and [SASS](http://sass-lang.com/) libraries, it will also make [jQuery](http://jquery.com/) the default JavaScript framework, replacing the [Prototype](http://www.prototypejs.org/) framework.

I would like to start by addressing my experiences with CoffeeScript. My opinion of it is of ambivalence. I've used it on a project, I've played with and in the end I've come out with the opinion of "it's ok". It didn't blow me away, but at the same time I can see why so many people like. It offers some really cool features that I really wish JavaScript had and you can cut down on the amount of code you have to write. On the other hand the apps I tend to write don't tend to be that JavaScript heavy that I really needed to reach out for something like CoffeeScript.

<img style="float: left; padding-right: 10px" src="http://blogs.worldbank.org/files/publicsphere/public%20opinion_JGRNLY.jpeg" alt="" width="326" height="246" />

So, how do I feel about CoffeeScript being included with Rails? Well, I'll get to that. Let's go over some of the most common arguments I've heard from people this week about why they're anti-CoffeeScript in Rails.

> "It's an abstraction layer of JavaScript! JavaScript isn't that bad, why can't you just write JavaScript?"
> 
> "It's going to be a hinderance to newbies. It'll be too much of a learning curve!"

Let's start with that second point first, shall we? I agree, it does represent a new element that needs to be learned when coming to Rails. But here's the pretty nifty thing about how it's all implemented in Rails. In order to actually use CoffeeScript in Rails you have to create your files named foo.js.coffee if, however, you just name your file foo.js then, guess what? You will have to write plain old JavaScript! Seems like newbies, and those who don't like CoffeeScript, can just keep writing plain old JavaScript without anything stopping them at all.

Now, let's talk about the abstraction layer argument. Yes, CoffeeScript is an abstraction on top of JavaScript, but let's take a look at a few other parts of the Rails stack and see how they hold up against this argument.

Here's a fairly common Rails stack:

* ActiveRecord
* Haml
* jQuery
* RSpec

What do all those things have in common? Well, they're all abstraction layers that sit on top of something else, don't they? Let's look at that list again?

* ActiveRecord - SQL (Structured Query Language)
* Haml - HTML
* jQuery - JavaScript, you could just as easily hand roll those AJAX calls in pure JavaScript.
* RSpec - Test/Unit

What I've found funny about the particular argument is that I've heard it MOST from those who use things like HAML, which is a DEFINITELY an abstraction layer that sits on top of HTML. See where I'm going with this one? Good, I don't want to belabor the point. :)

So, finally, where do I stand on this whole thing? Well, I view like it Test/Unit and Prototype. Those are both the current standard (although jQuery will replace Prototype in 3.1) and I don't like or use either of them. Instead I configure Rails to use jQuery and RSpec. I don't like Haml, but those that do simply replace ERB with Haml and they move on with their day. So my take is this, it's there, it's included. Use it if you like, or don't. Is it really that big a deal? No, it really isn't. If Rails dropped ERB and went with Haml as the default, would I bitch and moan, probably a bit, but then I'd just install the Rails-ERB gem and move on with my day, just like I do with jQuery and RSpec today.

So sit back, relax, use the libraries that you want to use, Rails let's you do that. Oh, while you're relaxing why not try out CoffeeScript, who knows, you might just enjoy it. Or not.