---
date: 2012-02-22T00:00:00Z
meta:
  _edit_last: "1"
  aktt_notify_twitter: "yes"
  aktt_tweeted: "1"
published: true
status: publish
tags:
- api
- General
- json
- rails
- ruby
- Tutorials
- will_paginate
title: Adding Pagination to an API
type: post
url: /2012/02/22/adding-pagination-to-an-api/
---

<img alt="" src="http://www.robertsabuda.com/store/images/sharks_shark.jpg" title="popup book" style="float: left; padding-right: 10px" width="250" />

_Before I start this article, let me apologize for the lack of writing over the last six months. My only excuse is that I've been working on a new book and that is where all my writing energy has gone. So with apologies out of the way, let's talk pagination._

Dealing with pagination in any application is never easy. There are a lot of great libraries out there that help you better handle this awkward, but unavoidable part of application programming. Things get even more complicated when you are trying to define an API.

APIs are fickle beasts. They have to be both clean and functional. Two things that are often at odds with one another. No sooner does clean and functional have a go at each than when trying to add pagination to an API. Pagination requires all sorts of meta-data; how many total results there are, how pages there are, etc...

There are two approaches to handling pagination in your API, let's look at those two approaches in this article.

The first approach is the easiest one to code, but I find it to be the most intrusive and less clean approach. A typical response would look something like this:

<script src="https://gist.github.com/1889261.js"> </script>

Here the API returns the pagination meta-data right inside of the JSON response. The advantage here is that everything is very visible to the end developer. They can easily see the details of the pagination, as well as the <code>widgets</code> element which contains the array of data the end user was most likely looking for when they requested the API.

The downside of this approach is that the pagination meta-data is right there in the body of the response. The client trying to use the API has to dig into the response to extract the data it was originally looking for, potentially ignoring the pagination meta-data, if it doesn't need it.

The other way to send the pagination meta-data along with our response is in the headers of the response. This is my preferred way of handling this situation.

Let's look at how we can do this in a Rails application using WillPaginate. Of course if you're not using WillPaginate you can easily substitute your pagination library of choice.

I start by creating a class method in <code>ApplicationController</code> that will create an <code>after_filter</code> that will set the pagination meta-data in the response headers:

<script src="https://gist.github.com/1889206.js"> </script>

Then in the controller we want to add pagination headers we can call it like such:

<script src="https://gist.github.com/1889221.js"> </script>

Now when someone calls the <code>index</code> action on the <code>API::V1::WidgetsController</code> it will respond with JSON that looks like this:

<script src="https://gist.github.com/1889259.js"> </script>

And with response headers that look like this:

<script src="https://gist.github.com/1889226.js"> </script>

Now the client can easily gain access to the array of widgets they originally wanted, and should they need the pagination meta-data the client can just easily pull that information right out of the headers.

The API is once again nice and clean and yet it can now easily be paginated.
