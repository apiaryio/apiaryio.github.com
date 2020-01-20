---
title: New API Blueprint Tutorial
excerpt: Learning API Blueprint has never been easier.
layout: post
date: 2015-04-01 16:00:00 +0000
author: zdenek
published: true
comments: true
---

Everything at Apiary starts with API Blueprint and API Blueprint starts with its tutorial. Providing superb and concise documentation is our priority and API Blueprint should be a direct representation of these goals. But frankly, the previous tutorial was far too long, unnecessarily complex, and lacked blueprint examples, real code, and the overall vision of Apiary. This pained us so much, that we decided to create a new API Blueprint tutorial.

As a result, we decided to completely rewrite the tutorial so that any user, despite his or her experience, could easily use and understand API Blueprint without any prior knowledge of Markdown. You can get started with API Blueprint in less than thousands words, counting blueprint snippets and footnotes!

**Learning API Blueprint has never been easier** – check our new tutorial at <http://apiary.io/blueprint>.

They say _"A picture is worth a thousand words"_. We think the same. This is why there is much more behind our tutorial than a simple prose with code examples. The tutorial is accompanied by two API Blueprint examples, its backend implementation tested in a continuous integration and finally, it is fully integrated within the Apiary application.

## Same problem, two solutions
 Our new tutorial walks you though the basics of API Blueprint along with how you can build your very first blueprint. It uses an example of a polls service, which allows consumers to view polls and vote in them.

### HTTP API
 The tutorial is using a _simplified_ Polls API version – without hypermedia controls and advanced API Blueprint features.

 The full version of this **simplified Polls API** can be found at <https://pollsapi.docs.apiary.io> or in the API Blueprint GitHub [repository](https://github.com/apiaryio/api-blueprint/blob/master/examples/Polls%20API.md).

### REST API
As we believe following REST constraints may bring competitive advantage in fields where API provider does not control clients we have also prepared a truly REST – _hypermedia_ – version of the Polls API.

You can find the **hypermedia Polls API** at <https://pollshypermedia.docs.apiary.io/> or in the API Blueprint GitHub [repository](https://github.com/apiaryio/api-blueprint/blob/master/examples/Polls%20Hypermedia%20API.md)

This API offers both HAL and Siren media types through content-negotiation. If you are interested in hypermedia API design – please let us know on Twitter  [@apiaryio](https://twitter.com/apiaryio) or in the discussion under this article – we will be happy to talk about it in-depth.

## Backend Implementation
The Polls API comes with an [example implementation](http://github.com/apiaryio/polls-api) so you can use it as a real API:

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

We've deployed an instance of this API and it's accessible for anyone to experiment with: `https://polls.apiblueprint.org/`. You can also deploy your own instance of the Polls API to Heroku with a single click:

<a href="https://heroku.com/deploy?template=https://github.com/apiaryio/polls-api"><img src="/images/2015-03-03-Polls-API-Blueprint-Tutorial-Examples/deploy-to-heroku.png" alt="Deploy to Heroku" /></a>

## Tested
At Apiary we care about the whole **API lifecycle**. This is why we have created a testing tool for your blueprints and APIs – [Dredd](https://blog.apiary.io/2013/10/10/No-more-outdated-API-documentation).

The Polls API implementation demonstrates the use of Dredd and as such it's tested in a continuous integration as described in the [How To Test REST API with API Blueprint and Dredd](http://blog.apiary.io/2013/10/17/How-to-test-api-with-api-blueprint-and-dredd/) article.

<a href="https://circleci.com/gh/apiaryio/polls-api"><img src="/images/2015-03-03-Polls-API-Blueprint-Tutorial-Examples/polls-api.svg" alt="Circle CI" /></a>

## Apiary Integration
Last but not least, we've changed the _default blueprint_ used when you create a new API in Apiary to the simple version of Polls API.

For the first time in Apiary history and thanks to the Polls API implementation you can experiment with Apiary inspector (call debugger) features right with the default API. When you set the documentation console to _"debugging proxy"_ or _"production"_ the calls you make are hitting the implementation endpoint instead of the Apiary mock server.

<img width="599" src="/images/2015-03-03-apiary-integration.png" alt="Apiary Integration" />

Note: The actual implementation of your API is set by the `HOST: http://polls.apiblueprint.org/` line on the top of your blueprint.

## API Design and Lifecycle
We are striving to help developers design beautiful APIs while managing its lifecycle.

The new API Blueprint tutorial and its settings are representations of just that. From learning API Blueprint, choosing the right API design and prototyping to documenting, implementing, testing and using an API.

Hope you enjoy the new tutorial and please let us know if you have any feedback or questions. We're always more than happy to help!
