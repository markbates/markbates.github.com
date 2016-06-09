---
date: 2010-09-30T00:00:00Z
meta:
  _edit_last: "1"
  _wp_old_slug: ""
  aktt_notify_twitter: "yes"
  aktt_tweeted: "1"
published: true
status: publish
tags:
- cover_me
- gem
- General
- rails
- rcov
- release
- Releases
- rspec
- ruby
- testing
- tests
- Updates
title: CoverMe – Code Coverage for Ruby 1.9 Reaches RC1
type: post
url: /2010/09/30/coverme-%e2%80%93-code-coverage-for-ruby-1-9-reaches-rc1/
---

In [August](http://www.metabates.com/2010/08/13/coverme-code-coverage-for-ruby-1-9/) I announced [CoverMe](http://github.com/markbates/cover_me) a code coverage tool for Ruby 1.9. Well, today I announce that it has hit it's first release candidate! I've very excited by the fact it's getting close to an 'official' release.

The response to CoverMe has been great and through feedback from the community I've made a lot of improvements and fixed a lot of issues.

While quite a few things have changed under the hood, not much has changed in how you use CoverMe.
<h2>Installation</h2>
The following are instructions for how you would configure CoverMe for a Rails 3 project, adjust to your local environment accordingly.

In  your Gemfile add the following:
<pre>gem 'cover_me', '&gt;= 1.0.0.rc1', :group =&gt; :test</pre>
Then run:
<pre>$ bundle install</pre>
After CoverMe is installed place the following line at the <strong>_VERY TOP_</strong> of your 'test_helper.rb' or 'spec_helper.rb' file (for Cucumber put it at the top of the 'env.rb' file):
<pre>require 'cover_me'</pre>
I can't emphasize enough how important it is that the require statement is at the <strong>_VERY_</strong> top of that file!

Finally (and optionally) run:
<pre>$ rails g cover_me:install</pre>
This will simply install a Rake task that will wrap both Test::Unit and RSpec tasks with CoverMe and will launch the results at the end of the test suites. I would recommend it. It's kinda the whole point. :)
<h2>That's it!</h2>
Enjoy the release candidate, and of course, please let me know if you find any issues with it. Issues can be reported on [here](http://github.com/markbates/cover_me/issues).
