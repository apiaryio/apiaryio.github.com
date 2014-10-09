---
title: Crafting MSON
author: zdenek
excerpt: "Feelings in software engineering – The journey of data structures description"
layout: post
date: 2014-10-10 08:50:00
published: no
comments: true
---


# Crafting MSON
I am running late. I have promised to deliver the plain text syntax for describing arbitrary data structures by this September. I didn't

Why? 

## Estimates
Being a software developer for almost two decades you will quickly learn giving estimates is hard. Even with that knowledge you still do not overestimate enough. You could. You should. But you won't. The tarmac is smooth, the road is flat. All set and ready to execute. 

You don't see what is behind the next turn, heck you don't even see the turn, even your hard-earned memories whisper "Don't be this optimistic Z!". I am an optimist. Time estimates shouldn't be.

## Design and functionality
Simple things are complex to create. To pursue simplicity is to lumber in the mud rather than to run gracefully.

The best part? When you think you are out of it you get knocked onto your knees but yet another unforeseen complication. A violation of your imperfect design. A misconception. A questionable functionality. A need for not-yet introduced syntax construct.

Address the issue. Update the syntax. Check everything you have done so far still fits, feels and functions right. 

Rinse and repeat.

## Imperfection
The evil is in the detail. Time estimates based on the time time it took to do the broad strokes are wrong. 90% of time is spent in the details. But it is the details where where to compromise is to loose the consistence.

Consistence, clarity and most importantly, the story that drives you is what distinguish the iPhone from an Android phone. Rapha from Assos. Redbull from Monster. BMW from Ford.

I demand the consistence across all of the components of the system. I ask for the attention to details – no rough edges, no exceptions to the design rules to accommodate a niche use case. I want all of the pieces to have a clear meaning, clear purpose and to clearly communicate what they afford.

Make no mistake. To achieve perfection is to get to the essence of what you do, to the gist of your story. But still, imperfection can be tolerated. The lack of vision cannot.

## The Story 
Why you do what you do? What is the meaning? Why should I care? I don't.

However, chances are we share the road together. Your problem is my problem. Where you go is where I need to get. We share the journey. Albeit maybe just a segment of it.

It is when we roam the roads less travelled when we are becoming explorers. Adventures. But what if the goal is not the adventure itself? What if I just need to get to the destination without all the tedious path finding that slows me down? Can we work together? Tell me what you have learned. Show me the ways. Help me set the new limits. To push the boundaries. Explore the new horizons. 

Now you have my attention, my friend.

## Feelings
When you are designing a new system it is important to know when to stop. Focus on the problem you are solving. On the story. Your story. No offsprings and parallels. You have a story to tell. Say it right.

But do not stop too early! Sometimes its tempting to just leave it "as is". Deliver. Ship it. Move fast and break things. But your story shouldn’t be told like that if you mean it to last.

Quite an opposite pitfall is trying to say too much. Remove all the clutter that does not contribute or support your story. Does it has to capture all the world's complexity? No. Does it have to be concise and consistent? Absolutely yes.

The beauty of a good design is that you can tell once you have it. Suddenly all of the pieces start to fit in the place. No matter from what side you tackle it. It just feels right. 

Feelings. In software engineering. Absurd? 

No. 

## MSON
I do need to describe data, give them a (semantic) meaning and explain what you might (or might not) get. 

I am a human too. Being a software engineer for so many years I have seen lots and lots of schemas, tables and arbitrary documents trying to capture what the data means. 

Schemas are powerful, but if you have ever tried to write one you probably felt it is more pain that it needs to be. And not just for writing. Reading a schema is no fun either. Frankly, there are people who can't read schema but still might care about your data.

Have you ever seen a document on GitHub trying to describe a JSON blob? There is so many of them. And every single one with has its own formatting and rules its author had to come up with. Now, there is nothing wrong with the diversity but what if we can unite these plain text, human readable documents? What if we can  not only make them human readable but also a machine readable, so a program can verify whether an actual data matches what is written in this document? 

Let’s not stop dreaming! What if you can get various format serializations (representations) from such a document? 

Describe your data once.

    # Contact
    - name: John Appleseed
    - email: john@apple.com (required)

This is MSON – the plain text syntax for describing arbitrary data structures.

## Status
As I have mentioned in the beginning, I am running late with the delivery. 

The initial proposal was released as back as April 2014. At the first glance the format has changed very little since that. Actually, the example above is identical to what it would be back in April. So where did those five months go?

Details. Details for some, but to me those months were spent on consistency between all the constructs, clarity of the language and most importantly, simplicity.

Exhausted but happy, I can proudly present you mature (but still young) syntax for describing data structures in plain text – [MSON][]. 

After five months of refining and polishing every detail we have got into the point where I can say we have THE right syntax. Powerful yet elegant and unobtrusive to capture most of the data structure-design needs. DRY enough to help you condensate your ideas in a really contained space should you need to. Flexible and verbose enough to allow you put it as much details, drawings or tables as you want. Compact, consistent and tidy. All this in a human readable form machines can understand too.

At the moment MSON does not include all the powerful features JSON Schema has. This wasn't in our story (at least for now). Still, the way MSON is designed it can be easily extended on-demand later.

You can start already using the [MSON syntax][] today for describing your data in plain text. But there is so much more to come. 

## Future Steps
We are currently working on the MSON parser that will allow other programs to manipulate MSON documents through the [MSON AST][] (which is, no surprise, described in MSON).

One of such programs, currently also being developed, is a "representation producer" – a tool that will take MSON and will create a serialization of it in requested media type. Another example is the upcoming integration with [API Blueprint][] to facilitate the [description] of HTTP message-bodies and API resources in general.

If we share at least a part the journey together, please, give MSON a try next time you will be designing a data structure and let me know – [z@apiary.io](mailto:z@apiary.io).

Thank you!

[MSON]: http://github.com/apiaryio/mson
[MSON syntax]: https://github.com/apiaryio/mson/blob/master/MSON%20Specification.md
[MSON AST]: https://github.com/apiaryio/mson-ast
[API Blueprint]: http://apiblueprint.org
[description]: https://github.com/apiaryio/api-blueprint/issues/25
