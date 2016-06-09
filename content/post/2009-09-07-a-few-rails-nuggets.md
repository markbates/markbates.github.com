---
date: 2009-09-07T00:00:00Z
meta:
  _edit_last: "1"
  aktt_notify_twitter: "yes"
  aktt_tweeted: "1"
published: true
status: publish
tags:
- authlogic
- book
- cucumber
- delayed job
- distributed programming with ruby
- General
- rails
- webrat
title: A Few Rails Nuggets
type: post
url: /2009/09/07/a-few-rails-nuggets/
---

So with my book, [Distributed Programming with Ruby](http://my.safaribooksonline.com:80/9780321669919), finally finished, and a nice long weekend I was able to sit down and work on a little pet project of mine. I decided to work on a little site that I could use to track my rather large Pez collection. (Yes, I know, I collect Pez - so what!)

While working on it I got to use some new technologies that I really haven't had a chance to play, so I thought I would talk a bit about some of the ones I liked the most.
<h3>Authlogic</h3>
Love it! Finally a decent authentication system! The thing I love most about it? It doesn't generate a lot of crap in your project. If I were to say one bad thing about it, it would be that it doesn't generate enough in your project. :) I know that sounds silly, but it's the truth. It gives you so much power, without having to generate a ton of lib code and crazy controller code, which is awesome. However, it would be nice if it had a generator that generated a 'basic' application for you. Just a little thing, apart from that, love it!

[http://github.com/binarylogic/authlogic/tree/master](http://github.com/binarylogic/authlogic/tree/master)
<h3>Cucumber/Webrat</h3>
I'm sure by now everyone has heard of Cucumber. I'm not going to pretend that I'm the first to that party! Over the last month or so I've really started to use it and it has completely changed my life. That's not an overstatement.

Cucumber lets you write features and scenario in human readable format. Combine that with Webrat, which lets you do things like click buttons and follow links, you can write some amazing tests that look like something a project manager would write! Brilliant!

These tests beat the hell out of Rails integration tests. Trust me! I love watching Cucumber and Webrat click around my site while I just watch.

[http://cukes.info/](http://cukes.info/)
[http://github.com/brynary/webrat/tree/master](http://github.com/brynary/webrat/tree/master)
<h3>Web App Theme Generator</h3>
This cool little plugin helps you to quickly generate a very useful, and laid out, theme for your application. The themes would be familiar to anyone who has used sites like Lighthouse. They're basic, but they are very well coded and get you on your quickly so you can have something that looks fairly decent.

My only gripe with this plugin is that it is a bit clumsy to use, but thankfully you don't have to run it very often, only when you create a new controller/resource.

[http://gravityblast.com/2009/07/30/2-minutes-admin-layout-with-rails-and-the-web-app-theme-generator/](http://gravityblast.com/2009/07/30/2-minutes-admin-layout-with-rails-and-the-web-app-theme-generator/)
<h3>Delayed Job</h3>
The last piece of tech is Delayed Job. I first discovered Delayed Job when I wrote about it in my [book](http://my.safaribooksonline.com:80/9780321669919). It is a great way to handle and process background tasks. It's easy, reliable, and scales really well. I've been using the Collective Idea fork of the project. It has a generator to create the migration you need. It also has a nice binary to run in the background on your server.

I've also been using a little gem I wrote that gives me hooks into Hoptoad, the is_paranoid gem, and a nice subclass for writing workers.

I have been completely enamored with Delayed Job from the first moment I used it, and I'm sure if you haven't checked it out yet, and you do, you'll feel the same!

[http://github.com/collectiveidea/delayed_job/tree/master](http://github.com/collectiveidea/delayed_job/tree/master)
[http://github.com/markbates/delayed_job_extras/tree/master](http://github.com/markbates/delayed_job_extras/tree/master )

There you go, that's just a few things I've been playing with lately, that I think are going to become mainstays in any Rails project I work on. Hopefully this has given you a little for for thought on things you can use in your next project.
