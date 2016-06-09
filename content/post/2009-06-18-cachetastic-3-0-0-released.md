---
date: 2009-06-18T00:00:00Z
meta:
  _edit_last: "1"
  aktt_notify_twitter: "yes"
  aktt_tweeted: "1"
published: true
status: publish
tags:
- active record
- cachetastic
- configatron
- General
- memcache
- News
- rails
- release
- Releases
title: Cachetastic 3.0.0 Released
type: post
url: /2009/06/18/cachetastic-3-0-0-released/
---

After more than two years powering production level applications I found that Cachetastic was starting to get a bit long in the tooth. I felt that there was a lot I could to make Cachetastic an even better library than it already was. I thought that I had added a bunch of cruft to the framework that people were just not using and maintaining it all seemed like a bit of a pointless chore.

So what was I unhappy about?
<h3>Configuration:</h3>
I was pretty unhappy with the way configuration was being done. I liked using Configatron to power the configuration, but I didn't like the way I implemented the way I was using Configatron. For example, to set up one of the default settings, like the expiry time, you would configure it like such:
<pre>configatron.cachetastic_default_options.expiry_time = 30.minutes</pre>
Now you would configure that same option like this:
<pre>configatron.cachetastic.defaults.expiry_time = 30.minutes</pre>
That's a little savings, but it really hits when you want to configure a particular cache. Let's say we a cache called My::Super::AwesomeCache, to configure it in past versions of Cachetastic we would do this:
<pre>configatron.my_super_awesome_cache_options.expiry_time = 15.minutes</pre>
Now in Cachetastic 3.0.0 we configure like this:
<pre>configatron.cachetastic.my.super.awesome_cache.expire_time = 15.minutes.</pre>
As you can see all configuration now happens under the cachetastic namespace in Configatron. Then it's a matter of using a Configatron namespace for each of your modules. I find it a lot easier to manage.

Another change in configuration is that in previous versions if you wanted to override one default configuration value for a particular cache,  you had to override them all. Now, you can just override the one value  you want, and the rest will be nicely inherited from the defaults.
<h3>Speed</h3>
Cachetastic has always been a very fast library, but I knew that more could be squeezed from that stone. With Cachetastic 3.0.0 you now get a hefty 25% improvement in the Memcached adapter and a whopping 99% in the LocalMemory adapter! Those are pretty awesome numbers. These numbers were easy to achieve when I stepped back and examined what it was I really wanted to do, and picked the most straightforward path to that goal.
<h3>Bloat</h3>
After more than two years Cachetastic was starting to suffer from a severe case of bloat. For example, I've never used the DRb adapter, have you? So why is it there? The same goes for the HtmlFile adapter. I wrote that because at my last job the operations team weren't savvy  enough to be able to get Apache to talk to Memcached, so they wanted to serve HTML files, hence the rather awful adapter. Both of those adapters are now history.

There also used to be support for Rails Session Caching. Considering that most people are now using the Cookie store for sessions, there really is no need for this cache. It could also be argued that it should not have been bundled with Cachetastic at all. I would agree with those arguments. Cachetastic is, and should always be, a standalone caching framework, that can be plugged into Rails or any plain old Ruby project that needs caching support.

Also purged is automatic support for mixing in the Cachetastic::Cacheable module into ActiveRecord. If you want this functionality, it is very easy to include in your application. I don't want to force it on anyone, so that is gone now.

Finally there are a handful of smaller features that I'm sure no one will miss that I've yanked out in the name of performance, reliability, and ease of maintenance.
<h3>Nice and Clean</h3>
When I realized what I really wanted, and what I didn't want, it became clear that what was needed was a fresh code base. With that said, I hit delete (well, not really) and started over again. The code is now smooth, so much easier to read, and fast. In previous versions even my eyes went a bit crossed when I tried to figure out exactly what was going on. There where quite a few levels of indirection, and things just weren't place where they probably should've been. That has all been fixed.

With a nice, clean code base comes a brand new set of tests. The tests are now extremely comprehensive, and while 2.x was very well tested, I know that 3.0.0, is tested to the hilt.

Because 3.0.0 is a brand new code base, I should probably stress the fact that is <strong>NOT</strong> backward compatible. So please be advised.
<h3>Installation:</h3>
<pre>$ sudo gem install cachetastic</pre>
<h3>Conclusion</h3>
I really hope everyone likes this brand new version of Cachetastic. I'm very happy with it, and I think if you give it a chance, you will be too.

If you'd like to have a peek at the RDoc, it can be found at:
[http://cachetastic-api.mackframework.com/](http://cachetastic-api.mackframework.com/)
