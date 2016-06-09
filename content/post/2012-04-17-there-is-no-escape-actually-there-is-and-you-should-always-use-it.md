---
date: 2012-04-17T00:00:00Z
description: ""
tags:
- javascript
- backbone
- rails
- xss
title: There is No Escape! (Actually There is and You Should Always Use It.)
url: /2012/04/17/there-is-no-escape-actually-there-is-and-you-should-always-use-it/
---



### Beware Your Users:

<img src="/assets/images/2012/04/17/escape_pod.jpg" class="img-right" style="width: 300px" />

Every developer should already know about, and work to prevent, [scripting attacks](http://en.wikipedia.org/wiki/Cross-site_scripting) on their site. Scripting attacks are one of the easiest ways for a hacker to attack your site, they are also one of the easiest attacks to prevent.

Whenever you let an end user enter text into a form on your site, and then display that text to other users on your site, you've opened yourself up to this sort of attack.

What can a hacker do in these sorts of attacks? Well, they can run malicious JavaScript that appears to the world to have come from your site. That means they can read cookies? Alter the page and ask for things such as passwords, credit card numbers, etc... All the while the end user believes these requests are coming from your site. That's not good.

So how do you prevent against this? Well, you should always escape any text that orginally came from an end user to get rid of any <code>&lt;script&gt;</code> tags for a start. I would say go all out and get rid of, or escape, anything inside of <code>&lt;</code> or <code>&gt;</code> brackets.

A lot of web frameworks are trying to build this in now, to make it easier for developers to protect against such attacks. For example, in [Rails](http://rubyonrails.org/) all data that comes from the database is considered tainted and will be automatically escaped when displayed to the screen. The developer has to go out of their way to tell Rails that a particular string is safe. I, personally, really like this approach.

Lately I've been doing a lot of work with [Backbone.js](http://documentcloud.github.com/backbone/), it has replaced the view layer in Rails for me. When working with a Backbone model if you want to get an attribute you would normally call the <code>get</code> function. Let me demonstrate:

```javascript
var model = new Backbone.Model({foo: "Bar"});
$("h1").html(model.get("foo"));
```

That code will set the <code>h1</code> tag on the page to whatever the value of the attribute <code>foo</code> is, in this case the value <code>"Bar"</code>. That's all fine and dandy, but what if we set the value of the <code>foo</code> attribute to something a bit more malicious:

```javascript
var model = new Backbone.Model({foo: "<script>alert('xss')</script>"});
$("h1").html(model.get("foo"));
```

If we were to run that code this time we would get an alert window that said <code>xss</code>. Not the worse thing that can happen, but it's still pretty darn bad!

How can you prevent this from happening when using Backbone? Stop using the <code>get</code> function! There are only two places where I can see ever using the <code>get</code>function, and I'll get to those in a second.

### <code>escape</code> is Your Only Option:

To prevent these sorts of scripting attacks when using Backbone, you should be using the <code>escape</code> function. It essentially behaves just like the <code>get</code> function, but it will return an escaped version of the attribute.

If we were to update the malicious code example to look something like this:

```javascript
var model = new Backbone.Model({foo: "<script>alert('xss')</script>"});
$("h1").html(model.escape("foo"));
```

when it is run we would end up with an <code>h1</code> tag that had a value of <code>&amp;lt;script&amp;gt;alert(&amp;#x27;xss&amp;#x27;)&amp;lt;&amp;#x2F;script&amp;gt;</code>

Now, I'll be the first to admit that doesn't look very pretty, but at least the scripting attack has failed.

### When You Should Use <code>get</code>:

Earlier I mentioned there are two places where I could see using the <code>get</code> function.

Because the <code>escape</code> function is santizing the value of the attribute for you there is a slight performance overhead, therefore, if you are definitely not going to executing the value of that attribute, then using the <code>get</code> function is acceptable. For example if you were doing something like the following:

```javascript
var model = new Backbone.Model({foo: "Bar"});
if (model.get("foo") != null) {
  $("h1").html(model.escape("foo"));
}
```

Notice how there I used the <code>get</code> function to check whether the attribute's value was <code>null</code> and then I used the <code>escape</code> function to actually print out that value. That is a perfectly acceptable use of the <code>get</code> function. It also, happens to the exact reason for use case number two.

The second reason you would want to use the <code>get</code> function has already been highlighted in the previous code example. The <code>get</code> function returns the original attribute value, unaltered. The <code>escape</code> function, however, will always return a <code>string</code> value, even if the original value was <code>null</code>.

```javascript
var model = new Backbone.Model({});
console.log(model.get("foo")); // null
console.log(model.escape("foo")); // ""
```

See the difference there? I believe this to be a bug. I've submitted a [pull request](https://github.com/documentcloud/backbone/pull/1227) to fix this issue, so hopefully it'll be resolved shortly. Because of this if you are doing any sort of comparisons, boolean checks, etc... always do it with the <code>get</code> function. If you are executing the value, such as printing it to the screen, always use the <code>escape</code> function.

Your users will be happier, and you'll sleep better, if you always use the <code>escape</code> route!
