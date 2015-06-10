---
title: Semantically Rich APIs
excerpt: Fostering Creativity with Semantically Rich APIs
layout: post
date: 2015-06-09 00:00:00 +0200
author: stephen
published: true
---

In our recent blog post, Kyle Fuller [wrote about](http://blog.apiary.io/2015/06/04/Hyperdrive/) the benefits of decoupling semantics from implementation details for building better API clients.

## The Difficulty with Common Approaches

Most modern approaches in designing and building APIs couple not only clients and servers to implementation details, but also couple thought, creativity, and shared understanding to that implementation. Coupling servers and clients is a problem that is easily seen, and in theory no one wants a coupled approach. Kyle wrote in his post:

> Imagine entering an API without knowing about any implementation details, but instead just understanding the semantics of the API. We can get the implementation details of the API at run-time to allow us to change them at any point.

In waiting until runtime to get these specific details, Hyperdrive allows for building clients that are highly evolvable and don't break when things are changed on the server.

Coupling on the other hand hinders this API evolvability—among other things—but it also hinders API design and creativity for designers and consumers. I think this is something we miss. We're all happy to have won the battle over technologies like SOAP and WSDL, but we fail to see our tools and methodologies are leading us right back to where we were.

## Chewing the CRUD

If you survey the modern API space, you'll see this coupled design pattern is the norm, albeit it's a limited one. The first design step in this pattern is usually to carefully craft a URL that conveys to the users the meaning of the content. The next step is to pick the HTTP method the users will use in interacting with that URL. Our thought, design, and creativity are all directly coupled with the HTTP implementation in this process, and pushes the question "What does my API do?" to later steps in the design process.

And what we haven't seen is this—we believe that thinking about URLs and HTTP methods *is* answering the question "What does my API do?" We define our resources, their CRUD actions, and place the burden on the user to glean the meaning and use of our API.

## What is Coupling?

Before continuing, it's important to define what I mean when I refer to the term "coupling." It is used in many contexts and many industries to refer to the concept of two things being united or joined together. When I use coupling in the context of API design, I am speaking of joining together design with the technology used to implement that design, and doing so in a way that makes the two hard to separate. 

Consider this example. Say I want to design an API for turning a light on and off. The first design thought may be, "If there is a light, and the light is turned on, I can turn the light off. If it's off, I should be able to turn it on." The simplicity is almost laughable because it gives no mention of how I implement the API. It is semantically rich in that it gives rich meaning to what my API will do.

Now consider the common design approach. We usually start with saying there is light and define the URLs used to access the light resource. All lights can be found at `/lights` and an individual light can be found using the URI template `/lights/{id}`. You can update the light using a `PUT` request . We usually then go to describing how you change the state of the light when using JSON.

Of course there are thoughts that follow each of these examples, but notice where they start, and notice which one offers the most freedom to explore, think, and do innovative things. Also notice which design is tied to its implementation, and which design provides a blank canvas for how it is carried out.

## A Better Way to Think About and Design APIs

The modern approach to design, though popular, is quite cumbersome and restrictive as shown. If you are of the non-technical type, it can also be a barrier to entry in the API design space. Forcing API designers to think primarily in URLs and HTTP methods should be a sign that something is amiss.

Instead of thinking about URLs and HTTP methods first, it is better to think about semantics apart from implementation. What are the actions that can be taken in your API? How will you name and describe these actions? Who are the users of the API and what will they want to do with your API? The goal is to move shared understanding away from the source code to API description documents, profiles, and media types. This is what allows for decoupling from implementation.

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
