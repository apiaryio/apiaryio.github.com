---
title: Utilising API Blueprint in API Clients
excerpt: Imagine an API client that can use the already-defined information from an API Blueprint to build a request
layout: post
date: 2015-02-17 16:00:00 +0000
author: kyle
published: true
comments: true
---

I’m excited to release a new way to interface to API Blueprints. A client-side framework in Swift that allows you to introspect and perform actions at run-time.

Imagine an API client that can use the already-defined information from an API Blueprint to build a request rather than hardcoding that information. This allows you to start building smarter clients which can evolve at run-time based on the blueprint.

The SDK is created using a framework we’ve built which implements the [Representor Pattern](https://github.com/the-hypermedia-project/charter#representor-pattern), a canonical representation of hypermedia messages across multiple media types and languages. One of the key constraints to Representational State Transfer (REST) is Hypermedia as the Engine of Application State (HATEOAS). This constraint requires the message from the server to contain information about how to transition to other states along with links to other resources, specifically through hypermedia.

The Representor is an interface providing this functionality along with the ability to deserialise Hypermedia formats such as [HAL](http://stateless.co/hal_specification.html) and [Siren](https://github.com/kevinswiber/siren). The Representer interface contains a couple of properties, one of them is it’s transitions to other states, along with how the current resource links to other resources.

Since an API Blueprint is a document which specifies transitions (actions) in your API, we’ve built on-top of the Representor interface. We’ve created a [Swift implementation](https://github.com/the-hypermedia-project/representor-swift) of the Representor which has the ability to deserialise an API Blueprint into a collection of transitions.

This allows us to decouple an API client from the server-side implementation. We no longer have to know about the URIs to each resource and the HTTP methods in our code. We can negotiate these at run-time and follow links from an API Blueprint.

## Example

Let’s walk though how to load an API Blueprint and perform transitions in Swift. First of all, we’re going to load our blueprint file that’s embedded in our application. You’re not limited to embedding it in your application. You could even retrieve it dynamically at run-time.

```swift
let blueprint = Blueprint(named: "blueprint.json", bundle: nil)
```

Once you’ve loaded your blueprint, you can retrieve the different resource actions as [transitions](https://github.com/the-hypermedia-project/charter/blob/master/reference/hypermedia-elements.md#transitions).

This example is going to make use of one of our example blueprints, “Polls API”. I’ve pulled out an excerpt of the example blueprint and it looks something like the following. Take a look at the [full version](https://pollsapi.docs.apiary.io/) ([source](https://github.com/apiaryio/api-blueprint/blob/be00b000e47561419f654374dd975a02083354e8/examples/Polls%20API.md)).

```apib
# Polls
Polls is a simple web service that allows consumers to view polls and vote in them.

## Group Question
Resource related to questions in the API.

## Question [/questions/{question_id}]
+ Parameters
    + question_id (number) ... ID of the Question in form of an integer

### View a question detail [GET]

## Choice [/questions/{question_id}/choices/{choice_id}]

+ Parameters
    + question_id (number) ... ID of the Question in form of an integer
    + choice_id (number) ... ID of the Choice in form of an integer

### Vote [PUT]

This action allows you to vote on a question's choice.

## Questions collection [/questions{?page}]
+ Parameters
    + page (optional, number) ... The page of questions to return

### List all questions [GET]
### Create a new question [POST]
```

We can pull out any of the actions from our blueprint by the resource and action name in Swift:

```swift
if let transition = blueprint?.transition("Choice", action: "Vote") {
  // Perform, or introspect your transition.
} else {
  // Gracefully handle the absence of the transition.
}
```

This transition allows us to introspect values at run-time, retrieving protocol information such as the HTTP method and URI along with all the URI parameters.

```swift
println(transition.uri)
println(transition.method)

for (name, parameter) in transition.parameters {
  println(name)
  println("\(parameter.value) \(parameter.defaultValue)")
}
```

We can use the elegant Swift HTTP networking library [Alamofire](https://github.com/Alamofire/Alamofire) along with some convenience methods we’ve built to perform HTTP requests from our transition directly.

```swift
let baseURL = NSURL(string: "http://polls.apiblueprint.org/")
let poll = [
  "title": "What's your favourite programming language?"
]

request(baseURL, transition, attributes:poll).responseJSON { (_, _, JSON, _) in
  println(JSON)
}
```

For the other action, to vote on a question by it's ID. We have a URI parameter
`id` and `choice_id`. We can substitute this into the URI and make the request like so:

```swift
let params = [
  "id": 1,
  "choice_id": 2,
]

request(baseURL, transition, parameters:params).responseJSON { (_, _, JSON, _) in
  println(JSON)
}
```

This will result in performing a PUT request to `/questions/1/choices/2`.

If you’re interested in giving this a go, check out our [installation guide](https://github.com/the-hypermedia-project/representor-swift/wiki/API-Blueprint) on using API Blueprint in Swift.

Of course, we’ve integrated this into our existing code examples. So right from Apiary you can see how it looks to perform a transition in Swift.

<img src="/images/2015-02-17-Utilising-API-Blueprint-in-API-Clients/code-example.png" width="665" height="364" alt="API Blueprint Representor Code Examples" />

We would love to hear your thoughts in the comments section below.
