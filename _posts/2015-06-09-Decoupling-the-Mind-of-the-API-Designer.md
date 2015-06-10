---
title: Decoupling the Mind of the API Designer
excerpt: Fostering Creativity with Semantically Rich APIs
layout: post
date: 2015-06-10 00:00:00 +0200
author: stephen
published: true
---

I recently watched a presentation called [The Humane Representation of Thought](https://vimeo.com/115154289) by Brett Victor in which he starts out his talk with this quote from "Genius: The Life and Science of Richard Feynman."

> Feynman said to Dyson, and Dyson agreed, that Einstein's great work had sprung from physical intuition and that when Einstein stopped creating it was because "he stopped thinking in concrete physical images and became a manipulator of equations."

It was interesting that Einstein's tools for communicating the complexity of the universe were what began to hinder his creativity in exploring that complexity. His thought become intertwined with equations so much, it actually stifled his inspiration.

It struck me that we're doing the same things in the world of API design. We're of course happy to have won the battle over technologies like SOAP and WSDL, but we fail to see our tools and methodologies are leading us right back to where we were. We have coupled our thought and creativity to these tools and methodologies and have shackled our imagination to specs and protocols.

## Chewing the CRUD

If you survey the modern API space, you'll see this coupled design pattern is the norm. The first step in this pattern is usually to carefully craft a URL that conveys to the users the meaning of the content. The next step is to pick the HTTP method the users will use in interacting with that URL. Our thought, design, and creativity are all directly coupled with the HTTP implementation in this process, and it pushes the question "What does my API do?" to later design steps.

And what we haven't seen is this—we believe that thinking about URLs and HTTP methods *is* answering the question "What does my API do?" We define our resources, their CRUD actions, and place the burden on the user to glean the meaning and use of our API. Instead of giving users a universe to explore, we've giving them equations to manipulate.

## What is Coupling?

Before continuing, it's important to define what I mean when I refer to the term "coupling." It's used in many contexts and many industries to refer to the concept of two things being united or joined together. When I use coupling in the context of API design, I am speaking of joining together the design and the technology used to implement that design in such a way that it makes it difficult to separate the two.

Consider this example. Say I want to design an API for turning a light on and off. The first design thought may be, "If there is a light, and it's turned on, I can turn it off. If it's off, I should be able to turn it on." The simplicity is almost laughable because it gives no mention of how I will implement the API. It is semantically rich, in that it gives rich meaning to what the API will do.

Now consider the most common design approach of our day. We usually start with saying there is a light and then define the URLs used to access the light resource. All lights can be found at `/lights` and an individual light can be found using the URI template `/lights/{id}`. You can update the light using a `PUT` request and some JSON. We would then move to defining the structure of that JSON for our users to use.

Of course there are thoughts that follow each of these examples, but notice where they start, and notice which one offers the most freedom to explore, think, and do innovative things. Notice which design is tied to its implementation, and which design provides a blank canvas for how it is carried out. And most importantly, notice which one clearly communicates the purpose of the API.

## A Better Way to Think About and Design APIs

The modern, coupled approach to design, though popular, is quite cumbersome and restrictive as shown. If you are of the non-technical type, it can also be a barrier to entry in the API design space. Forcing API designers to think primarily in URLs and HTTP methods should be a sign that something is amiss.

Instead of thinking about URLs and HTTP methods first, we should think about semantics apart from implementation. What are the actions that will be taken in your API? How will you name and describe these actions? Who are the users of the API and why will they want to interact with your API? The goal is to move all of this shared understanding away from the source code into API description documents, profiles, and media types. This is what allow us to decouple from implementation.

To put this differently, we need to think less like machines and make machines think more like humans. We need approaches that allow us to think freely about a problem space and make the technology take the shape of thought, rather than making thought take the shape of technology.

## A Better Way to Consume APIs

A common reaction is that this too narrowly defines how an API may be used, and therefore confines the ways in which a user may interact with the application. The inverse of this is actually true—shared understanding frees the users of an API to be creative by providing better visibility into the design and purpose of the API.

In the presentation [REST, Hypermedia, and the Semantic Gap: Why "RMM Level-3 REST" is not enough](https://www.youtube.com/watch?v=UkAt9XSOfaE), Mike Admundsen describes the benefits of richly defined APIs with a quote from a [Donald Norman video on affordances](https://www.youtube.com/watch?v=NK1Zb_5VxuM).

> The value of a well designed object is when it has such a rich set of affordances, the people who use it can do things with it that the designer never imagined.

The idea is that by communicating the semantics of a more richly-defined system, you empower your users to be innovative and intrinsically provide better value to them. Inversely, the less you communicate about what users may do with your API, the less value you provide and the less innovative your users can be.

## Where to Now?

Thankfully, there is a lot of great work being done on this front. The Semantic Web is an ever-growing topic with technologies like [JSON-LD](http://json-ld.org/) and shared vocabularies like [Schema.org](http://schema.org/). Hypermedia APIs are receiving a lot of attention with lots of great media types along with profile formats like [ALPS](http://alps.io/) for communicating semantics apart from implementation. It's evident that people see the need to go beyond our modern approaches.

The most important thing in all of this is, we have to become aware of how our current situation is taking us backwards. We have to reform and always be reforming how we interact with technology. We have to rework processes that force us down rigid paths and be constantly thinking of better ways to foster creative design in the API space by decoupling thought from implementation.




