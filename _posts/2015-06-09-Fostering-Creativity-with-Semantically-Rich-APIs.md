---
title: Semantically Rich APIs
excerpt: Fostering Creativity with Semantically Rich APIs
layout: post
date: 2015-06-09 00:00:00 +0200
author: stephen
published: true
---

In a recent post on our blog, Kyle Fuller [wrote about](http://blog.apiary.io/2015/06/04/Hyperdrive/) the benefits of decoupling semantics from implementation for building better API clients. This post aims to explore how this decoupled approach also benefits the API design process, specifically around freeing the produces and consumers to be more creative with semantically rich APIs.

## The Difficulty with Common Approaches

Many modern approaches in designing and building APIs couple not only clients and servers to implementation details, but we also couple thought, creativity, and shared understanding to that implementation. Coupling servers and clients is a problem that is easily seen, and in theory no one wants a coupled approach. Kyle Fuller wrote in his post:

> Imagine entering an API without knowing about any implementation details, but instead just understanding the semantics of the API. We can get the implementation details of the API at run-time to allow us to change them at any point.

In waiting until runtime to get these implementation details, Hyperdrive allows for building clients that are highly evolvable and don't break when things are changed on the server.

Coupling hinders API evolvability—among other things—but it also hinders API design and creativity for designers and consumers. It is a subtle impedance we overlook because of the distance we've made it in HTTP APIs and because the spectrum of frameworks, libraries, and tools promote this coupled thinking.

## Chewing the CRUD

A survey across the modern API space will reveal a coupled pattern for design that is the norm, albeit a limited one. The first design step in this pattern is usually to carefully craft a URL that can convey to the user the meaning of the content. The next step is to pick the HTTP method the users will use in interacting with that URL. The thought, design, and creativity is coupled to the HTTP implementation in this process, and pushes the question "What does my API do?" to subsequent steps in the design process.

This approach maps directly into the concept of CRUD, which is frequently used to describe this kind of interface design. The term CRUD is from the area of database and encompasses the actions you take on persistent data. It stands for "Create, retrieve, update, and delete," which are common operations associated with interacting with persisted data. In the API world, these general semantics are matched up with HTTP methods, such as POST/PUT, GET, PUT/PATCH, and DELETE respectively. Using CRUD with HTTP APIs, a user performs these actions on a resource's URL.

The problem with this is your API will do more than store and give access to data, and communicating what your API does along with providing data is a high-value concept in design and consumption. Using only what CRUD provides leave the users of an API to figure out what can be done with the API through understanding these concepts around URLs and HTTP methods.

For example, the aspects of CRUD alone do not convey how a client may change the state of a resource, how one resource is related to another, or what actions can be taken that don't fit into these four principles. We should free ourselves to think of semantics beyond these, not just for the sake of the API consumers, but for the sake of the design process of our API.

## A Better Way to Think About and Design APIs

This aforementioned approach to design, though popular, is quite cumbersome and restrictive. If you are of the non-technical type, it can also be a barrier to enter the API design space. Forcing API designers to think primarily in URLs and HTTP methods should be a sign that something is amiss.

Instead of thinking about URLs and HTTP methods first, it is better to think about semantics apart from implementation. What will users do with your API? The goal should be to move as much shared understanding as possible away from the server and client source code to API description documents, profiles, and media types that may be used at build time and runtime.

To put this differently, we need to think less like machines and make machines think more like humans. We need approaches that allow us to think freely about a problem space and make the technology take the shape of thought, rather than making thought take the shape of technology.

There is a current trend to advance this initiative through the Semantic Web and also through Hypermedia APIs. Technologies around the Semantic Web include linked data formats like [JSON-LD](http://json-ld.org/) and shared vocabularies like [Schema.org](http://schema.org/). Tools in the Hypermedia API realm includes formats like [ALPS](http://alps.io/) for communicating semantics apart from implementation details and a growing number of hypermedia media types. We are just on the cusp on what could be accomplished in this area.

## A Better Way to Consume APIs

A common reaction is that this too narrowly defines how an API may be used, and therefore confines the ways in which a user may interact with the application. The inverse of this is actually true—shared understanding frees the users of an API to be creative by providing better visibility into the design and purpose of the API.

In the presentation [REST, Hypermedia, and the Semantic Gap: Why "RMM Level-3 REST" is not enough](https://www.youtube.com/watch?v=UkAt9XSOfaE), Mike Admundsen describes the benefits of richly defined APIs with a quote from a [Donald Norman video on affordances](https://www.youtube.com/watch?v=NK1Zb_5VxuM).

> The value of a well designed object is when it has such a rich set of affordances, that the people who use it can do things with it that the designer never imagined.

The idea is that by communicating the semantics of a more richly-defined system, you empower your users to be innovative and intrinsically provide value to them. Inversely, the less you communicate about what users may do with your API, the less value you provide and the less innovative your users can be.

## Example: Thinking Through a Simple Design

It may be beneficial to look at an example of thinking this way. We'll use API Blueprint for designing a simple API for a todo list service. API Blueprint allows for writing simple documents that can be converted into machine readable formats. Additionally, API Blueprint can be written iteratively as we'll see.

Below is the first step in designing this API, with a a few assumptions on what that API should do. It's a Todo List

```markdown
FORMAT: 1A

# Todo List API
A Todo List application for keeping track of todo tasks.

## Todo
A Todo is a task that can be completed, marked incomplete again, or marked as hidden

### Create
### Retrieve
### Update
### Delete
### Mark Complete
### Mark Incomplete
### Hide Completed
```

> **Note**: I've left out a lot of things that could be written here for the sake of brevity. CRUD semantics have also been included to show they are not inherently bad to use, but do not dictate how they must be used.

In this example I have defined what the Todo List application will do without including any implementation details. I've given no thought to URLs or HTTP methods, and am free to explore how those would be implemented.

Below is a small step further in adding some implementation details about the Todo List application. You are not required to add these details at this point in the process, and you may also include a lot more information than provided here.

```markdown
FORMAT: 1A

# Todo List API
A Todo List application for keeping track of todo tasks.

## Todo [/todos/{id}]
A Todo is a task that can be completed, marked incomplete again, or marked as hidden

### Create [POST /todos]
+ Response 200

### Retrieve [GET]
+ Response 200

### Update [PUT]
+ Response 200

### Delete [DELETE]
+ Response 200

### Mark Complete [POST /todos/{id}/mark_complete]
+ Response 200

### Mark Incomplete [POST /todos/{id}/mark_incomplete]
+ Response 200

### Hide Completed [POST /todos/{id}/hide_completed]
+ Response 200
```

## Conclusion

We hope to continue to explore these concepts and principles and will be doing so in the world of Hypermedia APIs next. Tools like Hyperdrive show the flexibility afforded to us when we seek to decouple clients and services, and these benefits flow throughout the entirety of an API project.
