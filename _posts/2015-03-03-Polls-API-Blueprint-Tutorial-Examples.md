---
title: New API Blueprint Tutorial and Examples
excerpt: We've introduced a brand new API Blueprint tutorial along with some new examples.
layout: post
date: 2015-03-03 16:00:00 +0000
author: kyle
published: true
comments: true
---

We've introduced a new [API Blueprint tutorial](http://apiary.io/blueprint) along with some brand new [API Blueprint examples](http://docs.pollsapi.apiary.io/). Our new tutorial walks you though the basics of API Blueprint along with how you can build your very first blueprint. It uses an example of a polls service, which allows consumers to view polls and vote in them.

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

We've deployed an instance of this API and it's accessible for anyone to experiment with: `https://polls.apiblueprint.org/`.

You can also deploy your own instance of the Polls API to Heroku with a single click:

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/apiaryio/polls-api)

The Polls API is also a [hypermedia](TODO) API supporting the [HAL](http://stateless.co/hal_specification.html) and [Siren](https://github.com/kevinswiber/siren) hypermedia content-types based on [content negotiation](https://github.com/apiaryio/api-blueprint/blob/master/examples/6.%20Requests.md). This is demonstrated in an advanced version of the Polls API [example blueprint](http://docs.pollshypermedia.apiary.io/).

---

### HAL

When requesting HAL, you will get a HAL response back from the API allowing you to follow hyperlinks between the resources.

```
$ curl -H 'Accept: application/hal+json' https://polls.apiblueprint.org/
```
```json
{
    "_links": {
        "self": {"href":"/"},
        "questions": {"href": "/questions"}
    }
}
```

### Siren

Siren takes this one step further and will also include how you can transition from one state to another. The response will contain the available actions such as `create`, `delete` or `vote` along with instructions on how to perform these actions.

```
$ curl -H 'Accept: application/vnd.siren+json' https://polls.apiblueprint.org/
```
```json
{
    "links": [
        {"href": "/questions", "rel": ["questions"]},
        {"href": "/", "rel": ["self"]}
    ]
}
```

