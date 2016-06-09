---
date: 2009-07-24T00:00:00Z
meta:
  _edit_last: "1"
  aktt_notify_twitter: "yes"
  aktt_tweeted: "1"
published: true
status: publish
tags:
- apn
- apple
- gem
- General
- iphone
- News
- push notification
- rails
- Releases
- ruby
title: Apple Push Notifications on Rails
type: post
url: /2009/07/24/apple-push-notifications-on-rails/
---

The other night I submitted a new iPhone application to the Apple Store. The app, which I'll speak about when, and if it gets approved, uses the new Apple Push Notification service available in iPhone OS 3.0. On the server side I have a Rails application that I am using to send the notifications to Apple. The problem I ran into was how.

Enter the APN on Rails gem. While searching I found one plugin for Rails that mostly worked for me, Sam Soffes' apple_push_notification plugin. It was a great place to start, but I found that there were things that didn't suite me. For starters, not having any tests is always a big turn off for me when it comes to any code. I also didn't like that you didn't need to save a notification in order to send it. That means you don't have a record of what was sent and when. I also wanted to have devices stored separately from the notification. Finally, I wanted to be able to easily configure the plugin. Sam's was using constants that would need to be changed when it hit production.

So, with all that said and done I took Sam's great work, ripped it apart, and put it back together again, this time in gem form instead of a plugin, and here it is.

There are a few migrations, a few models, and a few Rake tasks, but here is the basic idea of how it works:

<script src="http://gist.github.com/154516.js"></script>

To get a better understanding of exactly how it works, and what it does, I highly recommend reading the [RDOC](http://apnonrails.metabates.com/).

There are a few things I still would like to add, for example, a controller to do CRUD for devices so iPhones can register with the Rails app. I'd also like to add a task that talks to Apple and finds out which devices are no longer accepting messages so they can be removed.

If you'd like to contribute, please feel free and for the project on GitHub: 
[http://github.com/markbates/apn_on_rails/tree](http://github.com/markbates/apn_on_rails/tree)

Again, a special thanks to Fabien Penso and Sam Soffes for their initial work on this project.
