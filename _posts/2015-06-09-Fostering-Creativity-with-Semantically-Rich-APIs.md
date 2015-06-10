---
title: Semantically Rich APIs
excerpt: Fostering Creativity with Semantically Rich APIs
layout: post
date: 2015-06-09 00:00:00 +0200
author: stephen
published: true
---

In our recent blog post, Kyle Fuller [wrote about](http://blog.apiary.io/2015/06/04/Hyperdrive/) the benefits of decoupling semantics from implementation details for building better API clients. I'd like to explore how this decoupled approach also benefits the API design process—it's quite nice to decouple your mind from implementation details as well.

## The Difficulty with Common Approaches

Many modern approaches in designing and building APIs couple not only clients and servers to implementation details, but also couple thought, creativity, and shared understanding to that implementation. Coupling servers and clients is a problem that is easily seen, and in theory no one wants a coupled approach. Kyle Fuller wrote in his post:

> Imagine entering an API without knowing about any implementation details, but instead just understanding the semantics of the API. We can get the implementation details of the API at run-time to allow us to change them at any point.

In waiting until runtime to get these specific details, Hyperdrive allows for building clients that are highly evolvable and don't break when things are changed on the server.

Coupling on the other hand hinders this API evolvability—among other things—but it also hinders API design and creativity for designers and consumers. I think this is something we miss. We're all happy to have won the battle over technologies like SOAP and WSDL, but we fail to see our tools and methodologies are leading us right back to where we were.

## Chewing the CRUD

If you survey the modern API space, you'll see this coupled design pattern is the norm, albeit it's a limited one. The first design step in this pattern is usually to carefully craft a URL that conveys to the users the meaning of the content. The next step is to pick the HTTP method the users will use in interacting with that URL. The thought, design, and creativity is directly coupled with the HTTP implementation in this process, and pushes the question "What does my API do?" to later steps in the design process.

This approach maps directly into the concept of CRUD, which is frequently used to describe this kind of interface design. The term CRUD is from the area of database and encompasses the actions you take on persistent data. It stands for "Create, Read, Update, and Delete," which are common operations associated with interacting with persisted data. In the API world, these general semantics are matched up with HTTP methods, such as POST/PUT, GET, PUT/PATCH, and DELETE respectively. Using CRUD with HTTP APIs, a user performs these actions on a resource's URL.

The problem is, your API will do more than store and give access to data, and communicating what your API does along with providing data is a high-value concept in design and consumption. In using CRUD alone, the burden is placed on the users to figure it out on their own. They have to dig through different URLs and HTTP methods and piece them together to get the full picture your API is trying to paint.

For example, CRUD alone doesn't convey how a client might change the state of a resource, how one resource is related to another, or what other actions might be taken that don't fit nicely into the CRUD acronym. We should free ourselves to think of semantics beyond these, not just for the sake of the API consumers, but for the sake of the design process of our API.

## A Better Way to Think About and Design APIs

This aforementioned approach to design, though popular, is quite cumbersome and restrictive. If you are of the non-technical type, it can also be a barrier to entry in the API design space. Forcing API designers to think primarily in URLs and HTTP methods should be a sign that something is amiss.

Instead of thinking about URLs and HTTP methods first, it is better to think about semantics apart from implementation. What are the actions that can be taken in your API? How will you name and describe resources, attributes, links, and forms in your API? Who are the users of the API and what will they want to do with your API? The goal is to move shared understanding away from the source code to API description documents, profiles, and media types. This is what allows for decoupling from implementation.

To put this differently, we need to think less like machines and make machines think more like humans. We need approaches that allow us to think freely about a problem space and make the technology take the shape of thought, rather than making thought take the shape of technology.

There is a current trend to advance this initiative through the Semantic Web and also through Hypermedia APIs. Technologies around the Semantic Web include linked data formats like [JSON-LD](http://json-ld.org/) and shared vocabularies like [Schema.org](http://schema.org/). Tools in the Hypermedia API realm includes formats like [ALPS](http://alps.io/) for communicating semantics apart from implementation details and a growing number of hypermedia media types. 

## A Better Way to Consume APIs

A common reaction is that this too narrowly defines how an API may be used, and therefore confines the ways in which a user may interact with the application. The inverse of this is actually true—shared understanding frees the users of an API to be creative by providing better visibility into the design and purpose of the API.

In the presentation [REST, Hypermedia, and the Semantic Gap: Why "RMM Level-3 REST" is not enough](https://www.youtube.com/watch?v=UkAt9XSOfaE), Mike Admundsen describes the benefits of richly defined APIs with a quote from a [Donald Norman video on affordances](https://www.youtube.com/watch?v=NK1Zb_5VxuM).

> The value of a well designed object is when it has such a rich set of affordances, that the people who use it can do things with it that the designer never imagined.

The idea is that by communicating the semantics of a more richly-defined system, you empower your users to be innovative and intrinsically provide better value to them. Inversely, the less you communicate about what users may do with your API, the less value you provide and the less innovative your users can be.

## Example: Thinking Through a Simple Design

It may be beneficial to look at an example of thinking this way. We'll use API Blueprint to quickly design and describe todo list API. The benefits here are that I get to use API Blueprint to write in human-readable text yet convert to a machine readable format, so I am not tied to implementation. Additionally, we can write our document iteratively by waiting to add implementation details until later.

Below is the first step to designing our todo list API, with a a few assumptions on what that API should do.

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

In this example I have defined what the todo list API will do without including any implementation details. I've given no thought to URLs or HTTP methods, and I'm free to explore the details later.

Below is a small step further in adding some implementation details about our API. There is a lot more we could add, but we are sticking with the minimum at this point.

```markdown
FORMAT: 1A

# Todo List API
A Todo List API for keeping track of todo tasks.

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
