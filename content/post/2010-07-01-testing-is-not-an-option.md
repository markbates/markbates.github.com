---
date: 2010-07-01T00:00:00Z
meta:
  _edit_last: "1"
  _wp_old_slug: ""
  aktt_notify_twitter: "yes"
  aktt_tweeted: "1"
published: true
status: publish
tags:
- cucumber
- General
- rails
- rspec
- testing
- tests
title: Testing is NOT an Option
type: post
url: /2010/07/01/testing-is-not-an-option/
---

Five years ago I left the world of contracting and reentered the world of the full time employee, and I enjoyed every minute of it (well, almost). Now fast forward five years and I find myself once again at a crossroads. Do I continue on as an FTE or do I become a contractor, and play the field, so to speak? Looks like I'm going to go with the hired gun route for a little while, but that's not really the point of this post.

During the past week or so I've spoken with many great companies and people. I've been fortunate enough to have a high degree of interest in what I can bring to the table. During those discussions I talked with a really nice guy at a what seems to be a really cool company, I won't name names, because this isn't about either the person or the company, but rather something the engineer said during our phone conversation that got me to thinking.

<img style="float: left; padding-right: 10px" title="Failure Testing" src="http://www.commercialventvac.com/finao/failure_testing.jpg" alt="" width="400" height="240" />

"We don't have any tests because I couldn't convince the company to allocate the time for them." That statement really hung with me. After I got off the phone I started thinking really hard about that statement, and all I could think of was how testing is not an option and people shouldn't need to be convinced to have time allocated to them.

As developers it is our responsibility to insist on testing. Always include testing in your time estimates. Never give the client (or your company) an option that includes a time estimate without testing. If a feature takes 2 days to code and a day to write tests, then your estimate is 3 days, never 2. You should never say, "Well, I can get it done in two days if I don't write any tests." That's just an unacceptable thing to say. What you should be saying is, "That feature will take three days to code".

I don't feel I should sit here and tell you all the reasons why you should test, you should know them already, and frankly, they're all very obvious! But, if you need a few bullet points to 'convince' your client, here are a few:

* Less bugs - The more tests you have the less bugs you will have. It's just a fact. You won't have 100% bug free code, that's a nearly impossible goal, but you highly reduce the likely hood that as soon as you get your code into production your users will find all the breaking points of your code.
* Better maintainability, means faster feature turn around - When you have a large test suite it means adding, updating, or even removing features because a whole lot easier, which means it SAVES time! Why? Simple, you don't have to go through and manually test every aspect of your code to make sure you didn't break something elsewhere by adding that validation, or by refactoring that bit of code, etc... That translates into real $ savings.
* Test driven development saves time - this isn't quite the same as my last bullet point. Imagine, if you will, you are writing a four step wizard in your application. If you write a few test scripts using something like Cucumber first before you write your code you can simply keep re-running those to make sure your code is working. If you don't have those test scripts written then you continually have to keep going to a browser and entering all the information in each of the steps so you can test something in step four. Which one do you think takes longer, having a few test scripts you can run, or manually going through the four page wizard each time you make a change?
* It's an investment - thinking of having test scripts like owning a house. When you don't have tests and you just keep testing in the browser or the command line what you are doing is a kin to "renting". There is money being spent, but at the end of the day you have nothing to show for it. You've spent hours "testing", but tomorrow when you come in you have to do it all over again. When you spend those hours writing tests you are actually "buying" something. You have something to show for that time and money you've spent. Tomorrow, next week, next month, next year, those scripts will still be there, they'll still be working for you, giving  you a return on your investment.

Well, I hope I have hopefully made a case to you the engineer as to why you should insist on testing. It's the right thing to do, for you, for your application and for you client. If if anyone tries to give you grief about it, send them my way, I'll sort em out!
