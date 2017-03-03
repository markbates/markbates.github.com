+++
date = "2017-03-03T09:25:02-05:00"
title = "You're Benchmarking the Wrong Thing"
keywords = ["go", "golang"]
tags = ["go", "golang"]
topics = ["go"]
author = "Mark Bates"
type = "post"

+++

# You're Benchmarking the Wrong Thing

The Go community loves benchmarks. It is obsessed with them. If you look at the bottom of most README's for Go projects you will find a section labeled "Benchmarks". Everyone wants to prove how much faster their package, library, framework, etc... is from everyone elses. When looking at these benchmarks, the most important one is always missing, but we'll get to that in a minute.

First, a quick aside to say that I believe certain benchmarks are important. For example, if I'm trying to improve a section of code have isolated benchmarks for that section of code is important so I know if I've made any improvements, or if I have regressed. These types of benchmarks are incredibly important. These are not the benchmarks I'm talking about in this post. This post is all about those comparison benchmarks against other projects that project maintainers are obsessed with.

Go is an incredibly fast language, let's be honest, we already know that. For 98% of the projects out there Go is "fast enough" as is, yet, project maintainers feel a deeply embedded need to tweak every last bit of performance out of their code, but they're doing it at a cost, that most of them aren't aware of. That cost is the "missing" benchmark I spoke of earlier.

Recently I was having a conversation with a friend of mine. He was lamenting the fact that his Go package wasn't seeing the uptick in usage he thought it would. He couldn't understand why. He kept repeating that his was the "fastest" one out there. "Just look at the benchmarks", he said. He was right, his is the fastest package in that category out there, but you know what, after reviewing the package it became very clear to me what the problem was. I knew why his project wasn't "selling". It was unusable. He sacrificed usuability for benchmarks. There, my friends, is the problem. That is the missing benchmark, usability.

An unusable project, no matter how fast it is, is, well, unusable. When writing code, you should always, always, always, optimize for usuability, clarity, and maintainability above all else. Those objectives are often at odds with satisfying the benchmark gods. When I design a package, library, tool, framework, etc... I start with psuedo-code. I want to understand how it will be used. If my psuedo-code is too complex I delete it and try a different approach. I keep going until I find a pattern and design that is pleasant to use, and offers the features I need from the package, then I start coding.

I know I don't write the fastest code out there. I'm fine with that. I accept that. Don't get me wrong, I don't want to write slow code, no one does. Using those isolated benchmarks I can target segments of my code that are slow and improve them, but I do that __after__ I have good solid public API that people will want to use.

The next time you sit down and start to write a new project, first consider the end user and what is important to them. Is speed the most important thing? Perhaps, if you're writing something like a database. Or, is usuability the most important thing? If you're unsure, err on the side of usuability. If no one is using your project, what is the point of it being the fastest out there? If it's usuable, then people will use it, and then, you know what? Those same people will start contributing to it to make it better _and_ faster!
