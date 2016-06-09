---
date: 2010-08-15T00:00:00Z
meta:
  _edit_last: "1"
  _wp_old_slug: ""
  aktt_notify_twitter: "yes"
  aktt_tweeted: "1"
published: true
status: publish
tags:
- factories
- fixtures
- General
- rails
- testing
- tests
title: Fixtures v. Factories - Can't We All Just Get Along?
type: post
url: /2010/08/15/fixtures-v-factories-cant-we-all-just-get-along/
---

Testing in Ruby on Rails is incredibly easy. I mean stupidly easily. So easy that if you're not doing it, you are a very, very bad developer and should re-evaluate your career choices. (Yes, I believe in testing that much!) One thing that is not all that easy, however, is object creation and populating your test database. Five years ago when I first started working with Rails the only options we had to get data into the database were fixtures, or hastily written 'factory'-esque methods custom to each application.

Fixtures, for those who don't know, are YAML files that contain YAML-ized versions of objects that then get loaded into the test database when you run your test suite. These objects can then be pulled back from the database during your tests. Sounds great, doesn't it? Well, not everybody thinks so. One of the biggest problems with fixtures is they can very quickly get out of control. Keeping track of all the different scenarios your tests needs can get very confusing and frustrating to deal with.

<img style="float: left; padding-right: 10px" title="Factory Workers" src="http://www.uni.edu/schneidj/webquests/adayinthelife/lotsofworkers.jpg" alt="" width="360" height="283" />

So how do we fix this problem? Well, most developers have turned to using factories. Factories allow us to quickly build the data we need for each test, now the building of the data you need for your test is right there in a setup or before method. Easy to manage and keep track of. Now there are a plethora of different factory libraries meant to make this task nicer, a few of the popular ones are [Factory Girl](http://github.com/thoughtbot/factory_girl), [Machinist](http://github.com/notahat/machinist), and [Object Daddy](http://github.com/flogic/object_daddy). The problem with this approach, however, is that it can slow down your tests as you are building database objects for nearly every test, and as we all know, object creation and database inserting can be expensive.

So, what can we do to help solve both of these problems? Well, we can use both of these technologies. Together. Yeah, that's right I'm saying you should use fixtures as well as factories. Sound crazy? Not really. Let me explain.

Most Rails applications have most, if not all, of their functionality behind a login. So whenever we're testing some controller action that sites behind a login we need a user to login with. If we were using factories we would have a setup or before method that would create a new User object and save it to the database, and it would do that for every variant of the test, as well as every other test in our suite that needs a user object.

Why not, create one user object and use that repeatedly through our tests? What I like to do is stick one or two users in my fixtures, so that they're there whenever I need one. I like to do this with most of my major models. Then, when I need to have some custom scenarios, I can break out the factories and build those custom scenarios.

So what does this achieve? Well, I've sped up my tests by already having a few objects in the database, and not having to create them (and roll them back) with each single test. I've also cleaned up my tests significantly by eliminating a lot of setup and/or before methods where these objects were being created. I've also eliminated the biggest problems with fixtures, that they can get overwhelming, because we are only keeping one or two objects in them and using factories for the rest.

I hoped this helped you to understand that we don't have to throw the baby out with the bath water when it comes to fixtures and factories, we can use both. Not go forth and test! Test like your life depends on it (because it does!!).
