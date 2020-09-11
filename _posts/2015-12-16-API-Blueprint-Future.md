---
title: This Is Going to Be Awesome
excerpt: On the future of API Blueprint
layout: post
date: 2015-12-17 01:00:00 +0100
author: zdenek
published: true
comments: true
---

What would API Blueprint be like if it started today? Different vocabulary, features or grammar concepts?

The truth is, in the past three years API Blueprint has been putting its flag in the sand. It was carving out its concepts and defining the emerging API design space.

From its beginnings, API Blueprint has stood out for its simplicity and collaborative nature. The aim has always been to create a simple, concise yet powerful language. We wanted to provide a medium for everybody to think about a design of an API.

I am still shocked how much these core values resonated with the community. To ask programmers to write in plain text instead of JSON or XML was the bet we took. And the bet wasn't only about writing in freeform text. We also asked to not generate the API description from code. Instead we suggested it is better to take the effort and scope out an API definition before coding.

After three years I can say our bet was well worth taking. API Blueprint is now growing faster than ever. It has way over 3,000 star gazers on [GitHub][1] and almost 200,000 blueprints in Apiary. It's now used everywhere from IoT devices to banks.

### The most important feature

So where is API Blueprint going next? Before looking into the future let's start with the present.

In 2015, we have spent most of the year building only one feature—the description of body parameters. This feature is also know as the [MSON syntax][2].

Only one feature? Why?

Because this feature brings the single most important concept in understanding an API. It introduces the description of the application data model domain and its semantics.

When encountering a new system, I first need to understand its semantics. What is the data in it, and what I can do with it? Only then I can start asking how to interact with the system. This may sound trivial, but it isn't. If my customers do not know what my API is offering, why should they bother using it?

I am already hinting here where the API Blueprint is heading.

At the pinnacle of every API design is the semantics of its application domain. Once I understand **what** an API has to offer I can proceed forward to **how** to make an use of it.

### Abstraction

While I am pondering about the **what** of an API, I don't want to worry about JSONs, URLs, protocols or other details. These decisions can wait after I define what the API is actually about.

Abstraction plays a key role in any good software design. It makes design of complex systems possible. It encapsulates behavior, decouples elements and enables modularity.

Let's look at the levels of abstraction when designing an API and its implementation.

![Abstraction][3]

With MSON, API Blueprint took a major step towards modeling application data.

But make no mistake—MSON isn't another syntax for JSON. MSON is agnostic to serialization media types. With MSON, I can describe the data and defer the decision whether they will be send as JSON, XML or [HAL][4] over the wire.

### Plans

Here are the upcoming steps for API Blueprint.

To finish the data description, both URI parameters and HTTP headers are going to use the MSON syntax. The same syntax of parameters, headers and attributes allows the reuse of data models. It will also enable more powerful tools thanks to the data connection. [[MSON Parameters and Headers][5]]

Next, API Blueprint resources will start affording other resource's actions. This interlinking of resources will help the design of hypermedia systems. [[Affording Actions][6]]

We will decouple the description of a resource and its action from the protocol layer. Separating the two will enable abstraction and open the support for other protocols. [[Abstract protocol layer][7]]

Finally, API Blueprint will be able to provide the modeling of application automaton. Hypermedia clients should not use any information about the implementation. Yet, having the automaton description will help the design and enable unparalleled tools. [[State machine description][8]]

### Values

To summarize, here are the values API Blueprint thrives for:

* Transparent &amp; open
* Simple
* Collaborative
* Encouraging abstraction
* Architectural style agnostic
* Protocol agnostic

It takes more than developing the core values to have a great language. We are going to continue work on improvements to the user experience. This includes better parsers warnings, [external assets][9] and [splitting a blueprint into many files][10].

### Transparent and Open

For the first time, we have prepared the public [API Blueprint roadmap][11]. The roadmap is capturing all the core values and usability features in one concise form. The items on the roadmap are in priority order.

We have also revised the API Blueprint GitHub issues and the systems of [labels][12]. Starting today you can, for the first time [track [13] the status of all these features.

While we have all these ideas about the API Blueprint future, it is now too big to be a one man—or company—show! The API Blueprint is open. Please [join us][15] and make the difference in the world of API design!

[1]: https://github.com/apiaryio/api-blueprint
[2]: https://github.com/apiaryio/mson
[3]: /images/2015-12-16-API-Blueprint-Future/abstraction.png
[4]: http://stateless.co/hal_specification.html
[5]: https://github.com/apiaryio/api-blueprint/issues/286
[6]: https://github.com/apiaryio/api-blueprint/issues/288
[7]: https://github.com/apiaryio/api-blueprint/issues/289
[8]: https://github.com/apiaryio/api-blueprint/issues/290
[9]: https://github.com/apiaryio/api-blueprint/issues/20
[10]: https://github.com/apiaryio/api-blueprint/issues/8
[11]: https://github.com/apiaryio/api-blueprint/wiki/Roadmap
[12]: https://github.com/apiaryio/api-blueprint/wiki/Labels
[13]: https://github.com/apiaryio/api-blueprint/wiki/Labels#3-status
[14]: https://apiblueprint-slack.herokuapp.com/
[15]: https://github.com/apiaryio/api-blueprint#contribute
