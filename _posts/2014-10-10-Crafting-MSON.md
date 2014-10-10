---
title: Crafting MSON
author: zdenek
excerpt: "The journey of data structure design-needs"
layout: post
date: 2014-10-10 08:50:00
published: yes
comments: true
---

# Crafting MSON
I do need to describe data, give them a (semantic) meaning and explain what you might (or might not) get. 

Being a software engineer for so many years I have seen lots and lots of schemas, tables and arbitrary documents trying to capture what the data means. 

Schemas are powerful, but if you have ever tried to write one you probably felt it is more pain than it needs to be. And not just for writing. Reading a schema is no fun either. Frankly, there are people who can't read schema but still might care about your data.

Have you ever seen a document on GitHub trying to describe a JSON blob? There are so many of them. And every single one with has its own formatting and rules its author had to come up with. Now, there is nothing wrong with the diversity, but what if we can unite these as (or in) plain text, human readable documents? What if we can  not only make them human readable but also a machine readable, so a program can verify whether an actual data matches what is written in this document? 

Let’s not stop dreaming! What if you can get various format serializations (representations) from such a document? 

Describe your data once.

    # Contact
    - name: John Appleseed
    - email: john@apple.com (required)

This is MSON – the plain text syntax for describing arbitrary data structures.

## Status
I am running late with the delivery. 

The initial proposal was released back in April 2014. At first glance, the format has changed very little since that. Actually, the example above is identical to what it would be back in April. So where did those five months go?

Details. Details for some, but to me those months were spent on consistency between all the constructs, clarity of the language and most importantly, simplicity.

Exhausted but happy, I can proudly present you **mature (but still young) syntax** for describing data structures in plain text – [MSON][]. 

After five months of refining and polishing every detail, we have arrived at the point where I can say we have THE right syntax. Powerful, yet elegant, and unobtrusive, to capture most data structure design-needs. DRY enough to help you condense your ideas in a really contained space should you need to. Flexible and verbose enough to allow you put it as much details, drawings or tables as you want. Compact, consistent and tidy. All this in a human readable form machines can understand too.

At the moment MSON does not include all the powerful features JSON Schema has. This wasn't in our story (at least for now). Still, the way MSON is designed, it can be easily extended on-demand later.

You can **start using the [MSON syntax][] today** for describing your data in plain text. But there is so much more to come. 

## Future Steps
We are currently working on the MSON parser that will allow other applications to manipulate MSON documents through the [MSON AST][] (which is, no surprise, described in MSON).

On such application, currently being developed, is a "representation producer" – a tool that will take MSON and will create a serialization of it in requested media type. Another example is the upcoming integration with [API Blueprint][] to facilitate the [description] of HTTP message-bodies and API resources in general.

If we share at least a part of the journey together, please, give MSON a try next time you will be designing a data structure and let me know. I would love to hear your thoughts. 

Thank you!

[MSON]: http://github.com/apiaryio/mson
[MSON syntax]: https://github.com/apiaryio/mson/blob/master/MSON%20Specification.md
[MSON AST]: https://github.com/apiaryio/mson-ast
[API Blueprint]: http://apiblueprint.org
[description]: https://github.com/apiaryio/api-blueprint/issues/25
