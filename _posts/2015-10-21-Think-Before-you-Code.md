---
title: Think Before you Code
excerpt: Quick look at the core principles of a good API design.
layout: post
date: 2015-10-21 00:00:00 +0200
author: zdenek
published: true
comments: true
---

The way I see it you have two options when developing a new API. You can either start coding right away or  you can sit down, relax, and start thinking.

While it is true that writing is thinking, thinking by coding isn’t exactly known for bringing solutions that scale and are manageable. Coding surely helps to think about the problem but it limits you by the constraints of the chosen language or framework.

What is essential when thinking about an API is to be declarative. You want to describe the data in your API and what you can do with the data, not how you can achieve that. And when I say data in your API I mean the data in your application domain. Not their persistent store representations.

It is certainly possible to think about your API declaratively while taking the thinking-by-coding approach. But you are most likely to slip into imperative underground only to find yourself swamped by URLs, HTTP nuances and other technical details. Contrary, the think-before-code approach helps you to carve out your API facade with your mind focused and free of the – at this point unimportant – how it works. Not only this will help you to come with an easier to comprehend design but – since you are not into implementation details you are essentially walking in the API client shoes.

This is very important because your API clients shouldn’t know anything about your API implementation internals. If they do, they are likely to hardcode API implementation logic on the client side which leads to tight coupling. Once a client implementing part of your API server logic is deployed, changing your API implementation breaks clients. Tight coupling isn’t a problem in closed environments where you have the control over clients. It is also not a problem for fire-and-forget disposable APIs.

However if your API is going to be deployed in an environment where you do not have control over clients you may want to not only consider thinking about your API upfront but also using an API architectural style that enables your API to evolve and scale (let me know if you want to read more on architectural styles).

Very often I am a witness to painful discussions on how to evolve API with tightly-coupled clients. Most often the solution is seen as some sort of “versioning”. But the outcome is always increasing the technical debt on both server and client side and putting the re-deploy burden on clients. These problems could be prevented by thinking before coding, selecting (and adhering to!) an appropriate API architectural style.

Regardless of the architectural style you decide to employ, the best API designs tends to be those that are understood by everybody involved in the API lifecycle.

So think about your API, describe it formally and discuss it before you start coding.
