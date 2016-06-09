---
date: 2014-10-15T00:00:00Z
description: ""
tags:
- golang
- go
- goth
title: 'Goth: Multi Provider Authentication for Go'
url: /2014/10/15/goth-multi-provider-authentication-for-go/
---


## In The Beginning...

In Ruby there is a great gem called, [OmniAuth](https://github.com/intridea/omniauth). When I write Ruby applications, this is one of the first gems I install. I use it almost exclusively for all of my authentication needs for my Ruby applications. It very easily allows for authentication through third party services, such as Twitter, Facebook, etc... and it does this in a very nice, clean, and uniformed interface. It doesn't try to be all things to all people. It doesn't let you make regular like posting a message to Facebook, or getting a list of tweets from Twitter. Instead it simply handles authentication, and that's it.

Recently I started working on both an app for myself, and an app for a client of mine, both of these applications required logging in through Twitter and/or Facebook. Naturally I started looking at existing Go packages that would provide me this functionality and, hopefully, do it in an idiomatic, simple, and expandable way. Unfortunately, I couldn't find that package, and trust me I looked. Hard.

The only package to come anywhere close to my dreams was [gomniauth](https://github.com/stretchr/gomniauth). Gomniauth, at first glanced, appeared to pay homage to OmniAuth. I was excited. This was just what I was looking, at least that is, until I discovered that it didn't support Twitter. No worries, I thought, I'll fork it, add Twitter support and everyone will be happy.

Unfortunately adding Twitter support to gomniauth was not as easy as it would seem. This is as much the fault of Twitter as it is the gomniauth package maintainers. Twitter's auth support is ancient. It supports OAuth 1.1, and not the more modern OAuth2. Gomniauth, however, is pretty much hard coded to only support OAuth2.

What's a person to do? I really needed Twitter support, as well as the ability to add other non-OAuth2 authentication methods. I also didn't feel like writing a new package, I'm not a fan of "not invented here", but looking at what it would take to refactor gomniauth, not to mention break every application that uses it, I wasn't really left with a choice.

## And There's Goth...

And that was how [Goth](https://github.com/markbates/goth) was born. Goth, and it's sub-package, Gothic, aim to be the OmniAuth of the Go world. Truly simple, clean, and easy multi-provider authentication. The first two providers implemented are Twitter and Facebook, proving that it can indeed handle both OAuth and OAuth2 providers.

Goth asks providers to implement a couple of simple [interfaces](http://godoc.org/github.com/markbates/goth) and that's it. By implementing the [Provider](http://godoc.org/github.com/markbates/goth#Provider) and [Session](http://godoc.org/github.com/markbates/goth#Session) interfaces a new provider can easily be plugged in.

I'm hoping that the community helps out and builds implementations for their favorite authentication providers.

## Example

```go

func main() {
  goth.UseProviders(
    twitter.New(os.Getenv("TWITTER_KEY"), os.Getenv("TWITTER_SECRET"), "http://localhost:3000/auth/twitter/callback"),
    facebook.New(os.Getenv("FACEBOOK_KEY"), os.Getenv("FACEBOOK_SECRET"), "http://localhost:3000/auth/facebook/callback"),
  )

  p := pat.New()
  p.Get("/auth/{provider}/callback", func(res http.ResponseWriter, req *http.Request) {
    user, err := gothic.CompleteUserAuth(res, req)
    if err != nil {
      fmt.Fprintln(res, err)
      return
    }
    t, _ := template.New("foo").Parse(userTemplate)
    t.Execute(res, user)
  })
}
```

```go
package main

import (
  "fmt"
  "html/template"
  "net/http"
  "os"

  "github.com/gorilla/pat"
  "github.com/markbates/goth"
  "github.com/markbates/goth/gothic"
  "github.com/markbates/goth/providers/facebook"
  "github.com/markbates/goth/providers/twitter"
)

func main() {
  goth.UseProviders(
    twitter.New(os.Getenv("TWITTER_KEY"), os.Getenv("TWITTER_SECRET"), "http://localhost:3000/auth/twitter/callback"),
    facebook.New(os.Getenv("FACEBOOK_KEY"), os.Getenv("FACEBOOK_SECRET"), "http://localhost:3000/auth/facebook/callback"),
  )

  p := pat.New()
  p.Get("/auth/{provider}/callback", func(res http.ResponseWriter, req *http.Request) {
    user, err := gothic.CompleteUserAuth(res, req)
    if err != nil {
      fmt.Fprintln(res, err)
      return
    }
    t, _ := template.New("foo").Parse(userTemplate)
    t.Execute(res, user)
  })

  p.Get("/auth/{provider}", gothic.BeginAuthHandler)
  p.Get("/", func(res http.ResponseWriter, req *http.Request) {
    t, _ := template.New("foo").Parse(indexTemplate)
    t.Execute(res, nil)
  })
  http.ListenAndServe(":3000", p)
}

var indexTemplate = `
<p><a href="/auth/twitter">Log in with Twitter</a></p>
<p><a href="/auth/facebook">Log in with Facebook</a></p>
`

var userTemplate = `
<p>Name: {{.Name}}</p>
<p>Email: {{.Email}}</p>
<p>NickName: {{.NickName}}</p>
<p>Location: {{.Location}}</p>
<p>AvatarURL: {{.AvatarURL}} <img src="{{.AvatarURL}}"></p>
<p>Description: {{.Description}}</p>
<p>UserID: {{.UserID}}</p>
<p>AccessToken: {{.AccessToken}}</p>
`
```

## Links

* [Goth](https://github.com/markbates/goth)
* [Godoc](http://godoc.org/github.com/markbates/goth)

