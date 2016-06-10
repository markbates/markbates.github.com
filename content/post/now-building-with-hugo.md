+++
author = "Mark Bates"
date = "2016-06-09T16:20:56-04:00"
draft = false
tags = ["blog", "hugo", "go", "golang", "jekyll"]
title = "Now Building With Hugo"
type = "post"

+++

Recently a good friend of mine, [Steve Francia](https://twitter.com/spf13), released a new version of his static site generator, [Hugo](http://gohugo.io/meta/release-notes/). So I thought I would give it a spin to see if it's any better than my old platform, [Jekyll](/2012/04/04/now-blogging-with-jekyll/).

The big reason that I was interested in Hugo, wasn't just because I'm friends with Steve, but rather speed. Jekyll had always been easy to use, but it was pretty slow. Like really slow. I also had the occasional issue with it not properly building after I would save a file. It wasn't that Jekyll was bad, but there was definitely room for improvement.

I had tried previously to switch over to Hugo, but there wasn't a good way to import from Jekyll and I had a) no intentions of manually converting all my previous posts and b) losing all of that content and starting over again.

I spent some time with Steve a few weeks ago, and he told me that the latest version of Hugo had built-in support for importing Jekyll, and that I didn't have to rely on hacking third party scripts to get the job done.

After running the importer all of my posts were there, and they only needed a wee bit of tweaking to make them look good with Hugo. Then I was off trying to find a good theme for the site, preferably something similar to what I had. That was easy enough, a few tweaks to a "bootstrap" theme and I was set.

Overall I've been happy with Hugo, now that I have it set up. I just hit save and Hugo rebuilt my entire site in `234ms`. That's pretty darn fast! Especially compared with the speeds I was getting with Jekyll. Oh, and did I mention that it also reloaded the site in my browser for me so I can see it getting updated everytime I hit save? Yeah, pretty nice.

For now, I'm sold on Hugo. Does that mean I will blog more? Who knows? I do know that it certainly couldn't hurt. :)
