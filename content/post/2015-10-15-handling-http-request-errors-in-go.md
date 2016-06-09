---
date: 2015-10-15T00:00:00Z
chapter: "false"
description: ""
tags:
- go
- golang
- http
- errors
title: Handling HTTP Request Errors in GO
url: /2015/10/15/handling-http-request-errors-in-go/
---


I'd like to take a quick moment and discuss handling HTTP request errors in Go. I often see people write code that they believe to be handling errors when making HTTP requests, but they're not actually handling any errors the application you're making requests to might be returning.

Let's take the following piece of code:

```go
package main

import (
  "fmt"
  "log"
  "net/http"
)

func main() {
  http.HandleFunc("/boom", func(res http.ResponseWriter, req *http.Request) {
    res.WriteHeader(500)
    res.Write([]byte("Boom!"))
  })
  go http.ListenAndServe(":9000", nil)

  res, err := http.Get("http://127.0.0.1:9000/boom")
  if err != nil {
    log.Fatal(err)
  }
  fmt.Printf("res.StatusCode: %d\n", res.StatusCode)
}
```

Admittedly this is a pretty simple piece of code, not much happening. We are starting up a server, then we make a request to that server. This is all well and good, until we get to the following piece of code:

```go
if err != nil {
  log.Fatal(err)
}
fmt.Printf("res.StatusCode: %d\n", res.StatusCode)
```

That second of code is doing the "error" checking of the request. If we run this code we'll see the following output:

```go
res.StatusCode: 500
```

Wait, if our response status code was 500, which is an error code, why didn't our error handling work? The application should have logged the error and quit. The reason for this can be found in the Go documentation.

> An error is returned if there were too many redirects or if there was an HTTP protocol error. __A non-2xx response doesn't cause an error.__

I added the emphasis on that last sentence myself, because it highlights why our error checking code didn't work. The `http` package does not return an error if the status is a non-2xx code. We have to check for that manually ourselves.

Let's rework the error handling portion of our example, this time let's check the status and handle a non-200 response:

```go
res, err := http.Get("http://127.0.0.1:9000/boom")
if err != nil {
  log.Fatal(err)
}
fmt.Printf("res.StatusCode: %d\n", res.StatusCode)
if res.StatusCode != 200 {
  b, _ := ioutil.ReadAll(res.Body)
  log.Fatal(string(b))
}
```

Now if we were to run this code you can see we now see the error printed out the screen and the application quits as we expect it to. We are now handling the responses from the application properly.

Beware of this trap when you're making HTTP requests in your Go apps. I see this mistake made __all the time__. It's an easy mistake to make. But now you you know, and knowing, as they say, is half the battle!

### One Final Note

Despite using it in my example, there are very few times when you should actually use `ioutil.ReadAll`. It is highly inefficient and reads everything into memory. I only used it here because it simplified my code example and I knew what it would be reading. Please seriously think twice about using `ioutil.ReadAll`. (There [Bill Kennedy](https://twitter.com/goinggodotnet), happy?)
