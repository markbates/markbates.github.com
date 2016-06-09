---
date: 2011-03-04T00:00:00Z
meta:
  _edit_last: "1"
  aktt_notify_twitter: "no"
published: true
status: publish
tags:
- cucumber
- General
- rspec
- ruby
- steak
- testing
- tests
title: Testing Tools Aren't All the Same, Choose Wisely
type: post
url: /2011/03/04/407-testing-tools-arent-all-the-same-choose-wisely/
---

> "Testing is painful."

> "Testing is hard."

> "Testing is complicated."

> "Testing is not fun."

I hear those sorts of things all the time when I talk to people about testing. I agree that sometimes testing can be all of those things, but if you choose the right tools, the tools that best suite you, testing doesn't have to be. Let me give you an example of what I'm talking about, how choosing the right tools can make a huge impact on how you feel about testing.

When working for a client recently I came across the need for end to end integration testing. I needed to test, amongst other things, the flow of a user registering through the application in a few different ways. Because registration behaves differently based on where you come from and where you want to go, I needed a good way to test that entire flow, so simple unit and functional tests just were not going to cut it.

In the Ruby community there is a big push to use a testing framework called, [Cucumber](http://cukes.info/). Cucumber is a behavior driven development (BDD) tool that let's you write user stories in plain English. Those stories then get translated into Ruby code that tests those stories against your application. Because of it's popularity, and some of it's quite amazing features, this was my first stop on the path to integration testing bliss.

Let me give you an example of a Cucumber script:

<script src="https://gist.github.com/854764.js"> </script>

That script tests the user registration flow through an application in a couple of different ways, first through 'standard' registration, and then through being invited to join. Now, the beauty of Cucumber is that these scripts are 'human' readable. Your product manager, or other stake holders, should be able to write these scripts themselves, and you, the developer, should be able to just plug them in and code until those scripts pass.

Unfortunately, while that sounds like a little slice of Heaven, the reality is far from it in practice. First, getting stake holders to actually write these 'stories', as their typically called, is a tough chore to begin with. If they do write them, they're typically not going to be 'plug and play'. Why? Well, when Cucumber reads these scripts it goes line by line and tries to find some code that matches the regular expression of that line and then execute it. If it doesn't find matching code, then it fails. That means that your stake holders need to write these scripts in a very particular way or developers need to sit down and massage those stories to fit the correct regular expression.

Now, let me just take this opportunity to say that this is not a post about how much I hate Cucumber, in fact I think Cucumber is a pretty amazing piece of software, and does in fact have a lot of great uses. Instead, what I'm talking about it is how Cucumber turned out not to be the right tool for the job for me on a recent project.

So why wasn't Cucumber the right tool for the job? Great question, glad you asked. Cucumber turned out not to be the right tool for a few reasons. The biggest of which was that I was the one who was writing the user stories. The stake holders had no desire to write these stories, which meant I had to write them. The I had to write the 'steps' that back each line of the script. In all fairness, Cucumber does give you some great steps right out of the box. After some fiddling I finally got the Cucumber scripts up and running and testing my work flow. But I definitely ran into some issues.

Because Cucumber isn't pure Ruby I had a hard time doing something as simple as just printing out the request's body and headers without having to write a step that did just that, then add that step to my story, etc... It's overall fiddlyness and non-intuitive way of doing things caused me a lot of grief and time. And, most importantly, I wasn't really getting the big benefit of Cucumber, stake holder's writing the stories. So I was doing all this work and not getting the benefits of Cucumber.

So what did I do? I turned to a library called [Steak](https://github.com/cavalle/steak). Steak allows you to write integration tests using pure Ruby and integrates directly in with [RSpec](http://relishapp.com/rspec), my preferred testing framework. With Steak I was able to write my integration tests in just a few minutes.

<script src="https://gist.github.com/854844.js"> </script>

While my Steak scripts a bit more wordy and are definitely not 'human' readable and editable by stakeholders, they did achieve my goal of allowing me to write integration tests quickly.

So here you see I picked a very powerful tool, that has a lot of great benefits, Cucumber, but I picked it for the wrong reasons. I picked it because it was popular, and not because it would help me achieve my goals. If my goals where to have stakeholders write the stories and hand them off to development, than it would've been a better choice. But in the end my goal was to write integration tests and write them quickly, which is why Steak ended up being the right tool for that job.

This has all been a really long winded way of saying doing some research before choosing your testing frameworks, or any framework for that matter. Play with it, research it, make sure it meets your goals, not somebody else's. If you choose the right tools then testing doesn't need to be scary, complicated, frustrating, etc... Testing is a [requirement](/2010/07/01/testing-is-not-an-option/) and a must have, so why not make it fun?
