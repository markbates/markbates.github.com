---
date: 2009-07-31T00:00:00Z
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
- release
- Releases
- Updates
title: APN on Rails 0.3.0 Released
type: post
url: /2009/07/31/apn-on-rails-0-3-0-released/
---

The latest version of Apple Push Notifications on Rails (APN on Rails) has been released. This release brings a few bug fixes, a new migration, and Feedback processing.

Installing/upgrading is easy:

<code>$ sudo gem install apn_on_rails
$ ruby script/generate apn_migrations
$ rake db:migrate
</code>

It's important to always run the migrations generator after each update to get the latest database schema needed for the the gem.

To use the new Feedback integration you have to first make sure that you update the new <code>last_registered_at</code> column when your iPhone application calls home. This column is checked against the timestamp Apple returns with the device token. If the <code>last_registered_at</code> is older than Apple's date then the device is deleted, otherwise the Feedback is ignored.

To get and process the list of devices from Apple's Feedback service just run the following Rake task:

<code>$ rake apn:feedback:process</code>

Enjoy!
