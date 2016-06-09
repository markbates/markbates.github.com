---
date: 2011-08-31T00:00:00Z
meta:
  _edit_last: "1"
  aktt_notify_twitter: "yes"
  aktt_tweeted: "1"
published: true
status: publish
tags:
- book
- coffee script
- coffeescript
- General
- rack
- rails
- ruby
- sprockets
- Tutorials
title: Using Sprockets without Rails
type: post
url: /2011/08/31/using-sprockets-without-rails/
---

I've started working this week on an example application for the next book I'm about to write and I wanted a simple way for my readers to easily run the app (it's going to be a single HTML file with a ton of cool JavaScript going on in it). My first choice for running this app was to use the popular Ruby library, [Rack](http://rack.rubyforge.org/). If you are unfamiliar with Rack, please check it out. It provides a simple interface for writing web applications. By writing a simple Ruby file readers can use their favorite Rack compatible web server to launch the application. Sounds simple, eh? That's because it is.

With a simple Rack application written in a few lines of code I was able to start developing my example application. That's when I realized I needed a good way to serve up all my [CoffeeScript](http://jashkenas.github.com/coffee-script/) and [Sass](http://sass-lang.com/) files. I was going to write a watchr script that did this, but I thought that was a bit heavy handed, and not very flexible, so I turned to [Sprockets](https://github.com/sstephenson/sprockets).

Sprockets recently gained a lot of attention because it is bundled in with [Rails 3.1](http://guides.rubyonrails.org/3_1_release_notes.html) to serve up an application's assets. It's a clever little library that will process your files using CoffeeScript, Sass, etc... and let you bundle them up in to a single asset by using a manifest. That was exactly what I wanted. After I spent the better part of an afternoon doing a bit of research and debugging here is the Rack configuration file I came up with:

<script src="https://gist.github.com/1184400.js"> </script>

That will serve
<pre>/assets/application.css</pre>
via Sprockets. The file itself will live in
<pre>&lt;pwd&gt;/app/assets/stylesheets/application.scss</pre>
The same goes for JavaScript files.

Hopefully this will save someone else a little of time when they're trying to do the same thing. Enjoy!
