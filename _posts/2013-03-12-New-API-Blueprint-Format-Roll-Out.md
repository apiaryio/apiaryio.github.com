---
title: Blueprint Format Roll Out
excerpt: New API Blueprint Format specification has been closed as we are getting ready for its roll out.
layout: post
date: 2013-03-29 09:00:00 +1000
author: zdenek
published: YES
---

As you may know the [New API Blueprint Format](https://blog.apiary.io/New-API-Blueprint-Format-Basics/) will be rolling out soon and today I would like to discuss how it will be done.

Before we get started please note the New Format is not live as of the date of writing this post. I will make an official announcement here on Apiary blog and inside Apiary application once the Format goes live.

## 1A Format Specification
First I would like to thank our awesome users who contributed to the New Format in reaction to my previous [post](https://blog.apiary.io/New-API-Blueprint-Format-Basics/).

In the process we have made quite a few changes to the Format. For example, to improve both readability and the process of writing we have decided to leave the "header marks (#) forest" in favor of utilizing "much cleaner" Markdown lists, like so:

```apib
# GET /message_of_the_day
Retrieves message of the day.

+ Response 200 (application/json)

        { "message" : "Hello World" }
```

You can find the New Format's [specification](https://github.com/apiaryio/api-blueprint/blob/master/API%20Blueprint%20Specification.md) its [repository](https://github.com/apiaryio/api-blueprint). The specification is completely open-sourced and it is also accompanied by a [tutorial](https://help.apiary.io/api_101/api_blueprint_tutorial/) and examples.

Note that this first version is only a mere milestone on the [Format evolution](https://blog.apiary.io/2013/01/27/New-API-Blueprint-Format/). However we still keep the main thing the main thing: The **API Blueprint must be the best way possible to both design and document your API**.

## Roll Out: Gradual Opt-In
The rollout will be on an opt-in basis - that is, we won't "switch" everything to new format immediately. Instead the two (legacy and 1A) formats will live in parallel for some time. You will be able to opt-in for the New Format by specifying format version in your blueprint's metadata.

Also the transition from the legacy to the New Format will be automatic and lossless. No need to rewrite anything by hand.

With that said, if you are familiar with the current format or don't want to dive in right away, it is perfectly fine to start working on your API today without any fear that you will have to re-do it all once the New Format arrives.

As always I would love to hear from you. You can reach me on [my email](mailto:z@apiary.io).


