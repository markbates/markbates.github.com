---
date: 2009-04-05T00:00:00Z
meta:
  _edit_last: "1"
published: true
status: publish
tags:
- distribunaut
- distributed objects
- drb
- General
- mack
- mack-distributed
- Releases
- rinda
title: Distribunaut
type: post
url: /2009/04/05/distribunaut/
---

Hey there everyone, it certainly has been awhile, a month by my count. I have been diligently working on a book for Addison-Wesley called, "Distributed Programming with Ruby", so having the time to blog went from a luxury to almost non-existent. But here's another little post to keep your RSS feeds happy. 

I've started working on porting the mack-distributed package to the non-Mack world. This new project, and I use the term new loosely for the time being, is tentatively called Distribunaut. The project on GitHub can be found here: [http://github.com/markbates/distribunaut/tree/master](http://github.com/markbates/distribunaut/tree/master). It's pretty rough right now. I've ported over the distributed objects section of mack-distributed, but not the views and routes.

You can install the gem like such:

<code>$ gem sources -a http://gems.github.com
$ sudo gem install markbates-distribunaut</code>

To use Distribunaut we first need to start a Rinda::RingServer. Distribunaut comes with a binary to help make this easier:

<code>$ distribunaut_ring_server start</code>

Once we've done that we can create an object we would like to share:

<script src="http://gist.github.com/90620.js"></script>

When we run that we can access it like such:

<script src="http://gist.github.com/90621.js"></script>

That would result in the following being printed out by our 'client' code:

<script src="http://gist.github.com/90622.js"></script>

On our 'server' side we would see something like this:

<script src="http://gist.github.com/90623.js"></script>

This is, clearly, a very simple example, but it shows you how easy it is to use Distribunaut. We haven't done any real configuration, and things just magically work!

Over the next couple of months I'll be extending and rebuilding this library to make it even more powerful and easy to use. I'm going to add fault tolerance, selection algorithms, and whole lot more. The API you see in these examples will most likely remain unchanged, but I'm planning on pretty big under the cover changes.There will be a very in-depth look into all of this in the book, obviously. (Shameless plug, I know.)

If anybody out there wants to contribute to this project, I'd love the help. Any sort of feedback is welcome. 
