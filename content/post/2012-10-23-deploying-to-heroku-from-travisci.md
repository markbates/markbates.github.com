---
date: 2012-10-23T00:00:00Z
description: ""
tags:
- travis
- heroku
- deployment
- testing
title: Deploying to Heroku from TravisCI
url: /2012/10/23/deploying-to-heroku-from-travisci/
---



[Travis CI](http://www.travisci.org) and [Heroku](http://www.heroku.com) are two of my favorite tools. Recently I tried to figure out if there was an easy way to have Travis automatically deploy to Heroku once the tests have passed. Turns out it's incredibly easy!

All you need to do is add the following as your <code>after_script</code> in your <code>.travis.yml</code> file.

```yaml
after_script:
  # Install the Heroku gem (or the Heroku toolbelt)
  - gem install heroku
  # Add your Heroku git repo:
  - git remote add heroku git@heroku.com:YOUR_HEROKU_APP.git
  # Add your Heroku API key:
  - export HEROKU_API_KEY=YOUR_HEROKU_API_KEY_HERE
  # Turn off warnings about SSH keys:
  - echo "Host heroku.com" >> ~/.ssh/config
  - echo "   StrictHostKeyChecking no" >> ~/.ssh/config
  - echo "   CheckHostIP no" >> ~/.ssh/config
  - echo "   UserKnownHostsFile=/dev/null" >> ~/.ssh/config
  # Clear your current Heroku SSH keys:
  - heroku keys:clear
  # Add a new SSH key to Heroku
  - yes | heroku keys:add
  # Push to Heroku!
  - yes | git push heroku master
```

Replace with your own Heroku API key and your Heroku git endpoint and Bob's your uncle Travis will do the heavy lifting for you and deploy to Heroku for you if, and only if, your tests pass.

One quick final note, I would recommend creating a new Heroku account to use as a "deployer" account because you do have to include your API key in the <code>.travis.yml</code> file.

That's it! Enjoy your continuous integration and continuous deployment all mixed up.
