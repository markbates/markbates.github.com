---
date: 2012-04-05T00:00:00Z
description: ""
tags:
- ruby
- api
- backbone
- rails
title: How To Write An API Without Even Trying
url: /2012/04/05/how-to-write-an-api-without-even-trying/
---



Recently I fell upon a way of working that I think is just fantastic. So far I have no complaints about it, and neither do my clients.

### How I used to work

In the past I would write my Rails applications just like everyone else did. I had all my business logic in my models and my controllers were very lightweight. Just enough to have the data I need to render the page.

My views on the other hand were big. They contained all of the view logic. There were loops to print things to the screen, helpers to make things easier to do in the view layer, forms, etc...

Somewhere near the end of the project my client would inevitably tell me they want me to build an API for them. Of course, this usually happens with only minutes left on the clock. So quickly, and hastily, I throw together a quick API for them. Sure I test the API with my test suite, but the API has never really been "tested", in a real world sense.

This writing an API in a vacuum seems to be quite a common practice. Everyone knows they need an API, but people don't put much thought into it because they're too busy trying to crank out their great idea as fast as possible. This leads to less than stellar APIs, which can both hurt the business and make it difficult when the time comes to do things like build clients for mobile devices and desktops.

So how can we solve this problem without putting too much extra strain on us poor developers? The answer is incredibly simple, eat your own dog food.

### Eating the Dog Food (and loving it!)

I, like a lot of my colleagues, have been turning to JavaScript frameworks, such as Backbone.js, to help create a richer, and more responsive, front-end user experience for the applications we write. A lot of what makes these types of frameworks so responsive is that they can make remote AJAX calls to your server to fetch, update, or destroy objects.

Since I'm doing all of my front-end work using Backbone, my Rails view layer has become almost not existent. I use views simply to launch my Backbone application. A typical view my look something like this:

```html
<!-- index.html.erb -->
<div id='products'></div>
<script>
$(function() {
  new MyApp.Views.ProductApp();
})
</script>
```

All my views are responsible for now is launching the Backbone application to serve up the appropriate views and handle all of the user interaction. My controllers are also now even smaller. They are essentially just there to serve up that basic template page.

So what does all of this have to do with writing an API without trying?

Well, the Backbone application needs to communicate back to the server if the user wants to update, create, or destroy a resource, so why not simply write a very nice API to do that? You were going to spend all this time writing controllers and view logic anyway, why not move those controllers to the API and that view logic to Backbone.

The win is outstanding! Because you've written a full client, your actual application, for your API you know that your API is more than capable of letting others do the same. Your API works, it's battle tested, it's proven, and it exists! The best part is it didn't take you any longer to write it either.

This pays off down the line in spades. For example, I've just finished up a project for a client and I took this exact approach. The client then asked me if I could write them a mobile application. I said sure, I created a new PhoneGap application and within a few minutes I copied in the Backbone models from my webapp I had written and was well on the way to writing a second full client for the API, and I didn't even break a sweat.
