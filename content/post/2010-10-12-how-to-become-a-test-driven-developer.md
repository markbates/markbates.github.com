---
date: 2010-10-12T00:00:00Z
meta:
  _edit_last: "1"
  _wp_old_slug: ""
  aktt_notify_twitter: "yes"
  aktt_tweeted: "1"
published: true
status: publish
tags:
- bdd
- General
- rspec
- ruby
- tdd
- testing
- tests
title: How to Become a Test-driven Developer
type: post
url: /2010/10/12/how-to-become-a-test-driven-developer/
---

In a previous post, [Testing Is Not An Option](http://www.metabates.com/2010/07/01/testing-is-not-an-option/), I talked a lot about why you should write tests, and the arguments you can put forth to your client, manager, or whoever it may be as to why you should write tests. What I didn't talk about was how to start writing tests. So let's talk about that for a bit, shall we?

When I'm talking with a potential client, well at least a client that has an existing code base, I always ask what their code coverage stats are. Now, I know at code coverage stats aren't the be all end all of measuring how good your tests are, but they're a basic enough metric to use as a guide. If they say they're high, then I usually dig in more about how they're testing; what frameworks, BDD, TDD, that sort of thing. Usually though I get a few minutes where they apologize and sheepishly give me their reasons for having little or no tests.

Here are few of those reasons:
  * We don't/didn't have the time.
  * We don't know how.
  * It was/is too complicated.
  * It was/is too overwhelming.

Let's talk about each of this points for a minute.

### "We don't/didn't have the time."

I never accept time as an argument against testing. Testing ends up repaying it's time investment, and will ultimately give you more time than if you didn't write code. It's a win-win. Again see my previous post in how to get the time signed off on as part of t he project timeline.

### "We don't know how."

Learn. There's no better time than the present and no better way to learn than being thrown into the deep end. The web is crawling with documentation, screen casts, how to articles and tutorials, and there are plenty of books to get you going. In short the k knowledge is literally at your finger tips, and to be honest it's easier than you think.

### "It was/is too complicated."

That usually means you're doing i
t wrong. Take a step back and assess what it is you're trying to do. You're tests should be simple and concise. Don't write tests that are hundreds of lines long. They're tests, not entrance exams to MIT.

### "It was/is too overwhelming."

Certainly if you didn't write tests as you went along it can get quite overwhelming thinking about all the tests you now need to write for your monolithic app. I'll talk about how you can solve that problem in a minute.

## Making It Happen

Ok, so now that we've identified a few of the excuses let's talk about how you can starting writing tests today for your application. So, take a deep breath and let's begin.

If you're staring at an existing application, don't try to tackle it all at once, you'll just get overwhelmed, scared, and confused. Instead take it one file/class at a time. First start with your models, as this is where the majority of your application business logic should be. Alphabetically each day pick the next class (or a couple of them) in the list and start to fill our your test files.

What do I mean by fill out your tests files, I mean creating pending tests for each of the methods of your model. Here's an example of a basic Ruby* class and what the pending RSpec spec file would look like:

```ruby
# Class:
class Entity
  def tax_id
    if self.person?
      # code here
    else
      # code here
    end
  end

  def person?
    # code here
  end
end

# Spec:
describe Entity do
  describe "tax_id" do
    it "should return a Social Security number if the entity is a Person" do
      pending
    end
    it "should return a Tax ID number if the entity is a Corporation" do
      pending
    end
  end
  describe "person?" do
    it "should return true if the entity is a person" do
      pending
    end
    it "should return false if the entity is not a person" do
      pending
    end
  end
end
```

Notice how the method that has the if/else statement in it has two pending tests for it. We need to test each variation of the method.

Now when you run your tests you'll see that you have a bunch of pending tests. Great! Now you just need to fill them in, but at least you know what should be filled in.

I also recommend that you do this every time you create a new method. As soon as you give your method a name go to your corresponding test and create a pending test for that method. This way you know that you have to test that method later. (In a perfect world I would love to see you write your test before returning to your class to fill in the method itself, but baby steps for now.)

Once you have all your pending tests setup each day try to fill in the details of each pending test for a whole class. If that's too much, then try to set aside an hour a day and fill in as many pending tests as you can. Alternatively you can also fill in the tests during the course of the day as you use one of the methods without tests.

Another great way to start filling in your test suite is each time you get a new bug, write a test to reproduce it. This is a great habit to get into as you'll eventually have a great suite of regression tests in place to help prevent those nasty bugs from returning. Write the test, see that it fails, then fix your bug. When your teat passes then you know you've fixed the bug!

Finally, start small. Start by writing unit tests. These are the types of tests I just described. They test a very particular part of your code base to ensure that it does what it should do. These tests are typically easy to write and act as a great corner stone to your test suite as a whole. Don't try to jump right in with full integration tests. The frameworks typically have a steep learning curve, and are more complicated to get up and running. This will lead to frustration and the old feeling of being overwhelmed. You can add these tests in later as you gain experience.

Well, there you have it, a few simple tricks to help you get started testing today. I know this post was a bit on the lengthy side, but I'm glad you stuck with me. Your life will be better for it. When you have a large and expansive test suite life is just better. Food tastes better. The sky is bluer. There will be a skip in your step. And you can use your incredibly high code coverage stats as a pick up line in a bar. On second thought, scratch that last thought. I wrote a test to see if that would work and it failed. It failed miserably.
<h6>* Please not that while I use Ruby as the example language here, the concept applies to whatever language you use.</h6>
