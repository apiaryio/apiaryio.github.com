---
title: Get Inspired on GitHub
excerpt: Learn how to search for API design patterns on GitHub.
layout: post
date: 2016-01-13 00:00:00 +0100
author: zdenek
published: true
comments: true
---

Last June, API Blueprint became recognized as a language on GitHub.
This brought the syntax highlighting and repository statistics for API
Blueprint. More importantly, it has also enabled the search for API design
patterns.

Let’s take a quick look at how we can search and perhaps learn from the API
designs done by others.

# Search

To search for API Blueprint on GitHub simply go to,

[https://github.com/search](https://github.com/search)

<img width="640" src="/images/2016-01-13-Get-Inspired-on-GitHub/search.png" alt="search" />

Enter the `language:"API Blueprint"` as the query. Hitting the search will
list all of the GitHub repositories that contain at least one API Blueprint
(.apib) file.

<img width="640" src="/images/2016-01-13-Get-Inspired-on-GitHub/statistics.png" alt="statistics" />

Seeing every blueprint on GitHub could be fun, but what is more fun is to search
for a particular keyword in blueprints. Here are all the blueprints that
contain the infamous "Hello World":

<img width="640" src="/images/2016-01-13-Get-Inspired-on-GitHub/hello.png" alt="hello" />

Note: When you are searching for a query like `Hello World`, make sure to switch to
 the "Code" results in the left hand pane.

# Patterns

Ok, it is the time to look how others are solving some popular API design
patterns.

## Pagination

Is your resource a collection of elements or other resources, such as a search
 result? Maybe it is a good idea to split the response into pages.

Searching blueprints for the `page` word seems like to be a good start to see
how others dealt with this task.

[API pagination on GitHub](https://github.com/search?q=page+language%3A%22API+Blueprint%22&ref=searchresults&type=Code&utf8=%E2%9C%93):
`page language:"API Blueprint"`

## Authentication

Doing authentication properly is no easy task. Let’s see how `OAuth2` is used in
APIs:

[OAuth2 in APIs on GitHub](https://github.com/search?utf8=%E2%9C%93&q=oauth2+language%3A%22API+Blueprint%22&type=Code&ref=searchresults):
`oauth2 language:"API Blueprint"`

## Rate limiting

Need to throttle the number of requests clients do to your API? So do many
fellow developers:

[API rate limiting on GitHub](https://github.com/search?utf8=%E2%9C%93&q=rate+limit+language%3A%22API+Blueprint%22&type=Code&ref=searchresults):
`rate limit language:"API Blueprint"`

## Hypermedia

If you are building a true REST API or just curious what has been built so far,
you can search for blueprints using one of the many hypermedia types.
Fore example, `HAL+JSON`:

[HAL+JSON APIs on GitHub](https://github.com/search?utf8=%E2%9C%93&q=%22hal%2Bjson%22+language%3A%22API+Blueprint%22&type=Code&ref=searchresults):
`"hal+json" language:"API Blueprint"`

These were just a few examples of queries you use while looking for API design
patterns.

Let us know if you find (or create) something interesting.
Let’s learn from each other how to build better APIs for tomorrow!
