---
title: New API Blueprint tutorial
excerpt: Learning API Blueprint has never been easier.
layout: post 
date: 2015-03-03 16:00:00 +0000
author: zdenek 
published: true
comments: true
---

Superb and concise documentation is one of our priorities at Apiary. But frankly, we weren't doing the most stellar job when it came to documenting our very own product and the plethora of awesome tools we are working on. 

This is changing right now. Allow me to introduce you to our brand new and much simplified API Blueprint tutorial. 

We have completely redesigned the tutorial from the ground. Stripped it from all clutter. Saving advanced topics for the later.  The new tutorial no longer expects any knowledge of Markdown. You can get started with API Blueprint in less than thousands words counting blueprint snippets and footnotes! 

**Learning API Blueprint has never been easier** – check our new tutorial by yourself at <http://apiary.io/blueprint>.

And speaking of words – they say "A picture is worth a thousand words". We think the same. This is why there is much more behind our tutorial than a simple prose with code samples. The tutorial is accompanied by two API Blueprint examples, its backend implementation tested in a continuous integration and finally, it is fully integrated within Apiary tools. 

## Same problem, two solutions
 Our new tutorial walks you though the basics of API Blueprint along with how you can build your very first blueprint. It uses an example of a polls service, which allows consumers to view polls and vote in them.
 
 The tutorial is using a simplified Polls API version – without hypermedia controls and some advanced API Blueprint features.
 
 The full version of this simplified Polls API can be found at <http://docs.pollsapi.apiary.io> or in the API Blueprint GitHub [repository](https://github.com/apiaryio/api-blueprint/blob/master/examples/Polls%20API.md).
 
As we believe following REST constraints may bring competitive advantage in fields where API provider does not control clients we have also prepared a truly REST – hypermedia – version of the Polls API. 

You can find the Hypermedia Polls API at <http://docs.pollshypermedia.apiary.io/> or in the API Blueprint GitHub [repository](https://github.com/apiaryio/api-blueprint/blob/master/examples/Polls%20Hypermedia%20API.md)

This API offers both HAL and Siren hypermedia types through content-negotiation. If you are interested in details about hypermedia API design – please let us know on Twitter or in the discussion under this article – we will be happy to discuss it in-depth.

## Backend implementation
There is an [example implementation](http://github.com/apiaryio/polls-api) of the Polls API so you can perform requests to a real API.

```bash
$ curl https://polls.apiblueprint.org/questions/1
```
```json
{
    "question": "Favourite programming language?",
    "published_at": "2014-11-11T08:40:51.620Z",
    "url": "/questions/2",
    "choices": [
        {
            "choice": "Swift",
            "url": "/questions/1/choices/1",
            "votes": 0
        }, {
            "choice": "Python",
            "url": "/questions/1/choices/2",
            "votes": 0
        }
    ]
}
```

We've deployed an instance of this API and it's accessible for anyone to experiment with: `https://polls.apiblueprint.org/`. However you can also deploy your own instance of the Polls API to Heroku with a single click:

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/apiaryio/polls-api)

## CI tests
At Apiary we care about the whole API lifecycle. This is why we have created [Dredd](https://blog.apiary.io/2013/10/10/No-more-outdated-API-documentation) – a testing tool for your blueprints and APIs. 

The Polls API implementation is tested in a continuous integration exactly as described in the [How To Test REST API with API Blueprint and Dredd](http://blog.apiary.io/2013/10/17/How-to-test-api-with-api-blueprint-and-dredd/) article. 

And yes, the badge bellow is live – just click on it to find out.

[![Circle CI](https://circleci.com/gh/apiaryio/polls-api.svg?style=svg)](https://circleci.com/gh/apiaryio/polls-api)

## Apiary integration
Last but not least we have changed the default blueprint used when you create a new API in Apiary to the simple version of Polls API. 

For the first time in Apiary history and thanks to the Polls API implementation you can experiment with Apiary inspector (a.k.a. call debugger) features right with the default API. When you set documentation examples or console to "debugging proxy" or "production" the calls you make are hitting the implementation endpoint instead of the Apiary mock server. 

The actual implementation of your API is set by the `HOST: http://polls.apiblueprint.org/` line on the top of tour blueprint.

<img width="599" src="/images/2015-03-03-apiary-integration.png" alt="Apiary Integration" />

##  To think you have to write
As Leslie Lamport [said](http://channel9.msdn.com/Events/Build/2014/3-642):
 
> Thinking means writing, to think you have to write

We are striving to create the best tools to help everyone thinking about their APIs. But these tools are nothing without the concise documentation.  The new API Blueprint tutorial and its settings are just the start. 

Let us know how are we doing. 

