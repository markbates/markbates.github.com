---
date: 2011-06-28T00:00:00Z
meta:
  _edit_last: "1"
  aktt_notify_twitter: "yes"
  aktt_tweeted: "1"
published: true
status: publish
tags:
- configatron
- General
- rails
- ruby
- yaml
title: Let's say goodbye to YAML for configuration, shall we?
type: post
url: /2011/06/28/lets-say-goodbye-to-yaml-for-configuration-shall-we/
---

<img style="float: left; padding-right: 10px" class="size-medium wp-image-489" title="yml" src="/assets/images/2011/06/yml-300x300.png" alt="" width="180" height="180" />

I have to ask a question to my fellow Rubyists out there? Why are you still using YAML? I know why you _think_ you like YAML. You think it's a great way to write configuration files, but it's really not. You know what's a great way of writing configuration files for Ruby apps? RUBY!

I know it's crazy, isn't it? But why not? Why would you not want to use Ruby for configuring your applications instead of YAML?

I'm the maintainer of a pretty popular configuration tool for Ruby apps, [Configatron](http://github.com/markbates/configatron), so I think I have a little experience in this field. I also write and maintain a lot of libraries that require configuration and I have never thought that YAML is the best way to do this.

Let's look at an example of what a library developer has to do to load a YAML file to get configurations:

<script src="https://gist.github.com/1051635.js"> </script>

I don't know about you, but I think that's kind of lame. Most everybody runs their YAML files through ERB so that they can make their YAML files more 'Ruby-ish'. Why not just use Ruby?? Here's the same example in Ruby:

<script src="https://gist.github.com/1051638.js"> </script>

In addition to not having to deal with all the whitespace, tabs, crazy nesting, etc... that YAML brings we get to use the full power of Ruby for our configurations! Try storing a Proc in YAML. Yeah, that's what I thought. You can drive configurations from the database, environment variables, crazy equations, etc... the world is your oyster. All you need to do now is stop using YAML!

I've decided to drop YAML support in Configatron 2.9 (coming sometime this Summer) and I encourage all other library developers to do the same. It's just not needed, or very nice for that matter. Now, if we can only get Rails to drop the database.yml file, I think we'll be all set.

<address>Ps. Make sure to check out my app [FluxTracker.com](http://www.fluxtracker.com?ref=yaml) for all your issue, project, and error tracking needs. Also check out [TweetKO.com](http://tweetko.com?ref=yaml) for backing up and bookmarking your favorite tweets.</address>
