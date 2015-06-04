---
title: Hyperdrive
excerpt: A generic API Blueprint client in Swift
layout: post
date: 2015-06-04 17:00:00 +0100
author: kyle
published: true
comments: true
---

It's extremely common to build API clients which are tightly coupled to
implementation detail. If you look at most API clients you will
often find hard-coded details about how an API works such as the HTTP
methods to use, URIs and information about content types. We design our
clients and APIs around out-of-band specifications which overly couple
our clients to our server.

## Why is this a problem?

This type of client design is rarely seen as a problem, it usually isn't
a problem immediately and only becomes a problem when you want to
change how the API works. Since clients are normally tightly coupled
to implementation details of an API. This often means you have to be
extremely careful when it comes to changing your API. You will often decide
against making certain changes because it will often break a client and
you'd rather stick to how it works. This problem is easily avoided if we
don't duplicate how our implementation works many times in each client.

We often design our APIs by exposing implementation details, for example
we use IDs in our URIs and expect our clients to know how to construct
these URIs by knowing about our internal database ID.

## API Evolvability

You can't have evolvability if clients have their controls hard-coded into
their design at deployment. Controls have to be learned on the fly to
allow both the server and the client change independently over time.

Imagine entering an API without knowing about any implementation details,
but instead just understanding the semantics of the API. We can get the
implementation details of the API at run-time to allow us to change them at
any point. Giving us the ability to control features of the API
without breaking our clients.

This means you don't have to redeploy your client to make changes to
the implementation, and you don't have to leave your existing users in
a broken state with a dated version of your application.

## Hyperdrive

We can enter an API that offers these controls at run-time.

```swift
hyperdrive.enter("https://polls.apiblueprint.org/") { result in

}
```

The above API supports specific content-types which offer run-time information
about how the API works. For APIs that don't support this, we can instead
enter the API from our API description hosted on Apiary:

```swift
HyperBlueprint.enter(apiary: "pollsapp") { result in

}
```

We asyncronously get back a result, which can either be a representation
of an API resource or an error. In the case that the operation succeeded,
it exposes the transitions that we can perform to transition to another
state in our API.

At this given time, we are exposed a single transition. A transition with
the relation `questions`. Our client understands the semantic meaning
behind `questions`, it has an expectation that the `questions` transition
will provide us with a collection of questions. We can go ahead and
perform this transition:

```swift
if let questions = representor.transitions["questions"] {
  hyperdrive.request(questions) { result in

  }
}
```

The API may no longer offer us the transition to questions, we shouldn't
expect a transitions to always be available. We should handle when the
transition is missing, and perhaps display an error in our client or remove
functionality from our user interface.

The questions resource may offer us more transitions and other related
resources. Our client understands the semantic meaning behind transitions
with the relation `create` and `delete`. It expects a `create` transition
allows us to create a new resource in the API, and the `delete` transition
to delete content from our API.

We can introspect the questions resource to see if it offers us any of
these transitions.

```swift
if let create = representor.transitions["create"] {
  // We've been offered the transition to create a new question
} else {
  // Either the API no longer supports creation or our user
  // doesn't have this feature.
}
```

Using introspection we can determine ahead of time if our API allows us
to create new questions and we can add or remove this from our user interface.

In this case, the API offered us a transition to create. The create
transition also includes any attributes we may send to perform
the create transition. Let's introspect these and take a look:

```swift
println(create.attributes)
=> ["question", "choices"]
```

We've discovered that the API offers us two attributes we may send. We
can use these attributes to create our user interface, if an attribute was
removed from the API we can remove it from our interface without having to
change any lines of code, and without having to redeploy our application.

These attributes can also contain validation information, so we can perform
client-side validation in our interface.

```swift
create.validate(attributes: [
  "question": "Favourite programming language?",
  "choices": [
    "Swift",
    "Python",
    "Ruby",
  ]
])
```

This allows us to change validation rules at run-time, perhaps we want
to introduce a 150 character limit on our question. We don't need to
redeploy our client to know about these changes.

Once we're ready to perform this transition, we can go ahead and perform
it without knowing any implementation details such as the HTTP method, URI
or even the content type we should use.

```swift
hyperdrive.request(create, attributes: [
  "question": "Favourite programming language?",
  "choices": [
    "Swift",
    "Python",
    "Ruby",
  ]
])
```

This transition again asyncronously offers us a representation of the new
resource if the operation succeeded. This new resource shows us how we
can transition from their onwards. Our new transition allows us to delete
the newly create question:

```swift
println(representor.transitions)
=> ["delete"]
```

The transition also offers us the attributes such as the question:

```swift
println(representor.attributes["question"])
=> "Favourite programming language?"
```

We've also been exposed a collection of embedded resource representations,
our question is made up of three choices and we have three independant
embedded resources representations. Which have attributes and transitions
of their own. Let's take a look:

```swift
if let choices = representor.representors["choices"] {
  for choice in choices {
    println(choice.attributes)
    println(choice.transitions)
  }
}
```

Each embedded choice representation may offers us a transition to go
and vote on that choice:

```swift
if let vote = choice.transitions["vote"] {
  hyperdrive.request(vote)
}
```

---

Hyperdrive is our new generic Hypermedia API Client in Swift. It's
open-source and available today on [GitHub](https://github.com/the-hypermedia-project/Hyperdrive).

![](/images/Hyperdrive.png)

In comparison to traditional API clients, we can avoid duplicating logic
from our API and embrace change by using Hyperdrive. We no longer have to
redeploy our API clients to make small changes to the servers implementation.

