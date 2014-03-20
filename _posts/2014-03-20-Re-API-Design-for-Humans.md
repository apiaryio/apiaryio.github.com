---
title: "Launching New Documentation"
excerpt: "We redesigned the way how Apiary documentations are rendered. Learn more about what's new and about our design decision process."
layout: post
date: 2014-03-20 16:00:00 -0900
author: jan
published: NO
comments: true
---

## Re: API Design For Humans

I recently revisited a great [blog article](http://37signals.com/svn/posts/3018-api-design-for-humans) by Noah Lorang of Basecamp about importance of API design and documentation. Almost three years have passed since the article has been published. Today, I'm happy to present you with slightly prolonged reply from Apiary team. Our newest creation.

Web APIs flooded our world at faster pace than anyone could anticipate. In absence of tools and services we were left to good old fashioned DYI. We could hardly imagine anything as boring as doing something others have already done.

That day, Apiary was born.


## Observations

The lowest common denominator for all APIs is the documentation, that's where everything begins. Often it starts as a simple draft of what you're about to build, later evolving with your development to the interface others will use to implement your API. At this point, the documentation becomes the most exposed part of your work.

However a good documentation is far beyond a simple HTML page nowadays, and if you want to keep up with the best, you'll end up spending a considerable time on development.

What if everything can be done without building own interactive documentation, setup, hosting and maintenance? And written in something cleaner than HTML—[an enriched Markdown](http://apiblueprint.org)? Open-sourced and free? Something StackOverflow [has answers](http://stackoverflow.com/questions/tagged/apiblueprint) to? With [additional tools](http://apiblueprint.org/#tooling) built by growing community every day?

![Introducing Apiary Documentation](https://apiary.a.ssl.fastly.net/assets/blog/images/new-documentation/spin.gif)


## Perspectives

The API documentation is typically used in two different ways with almost opposite requirements.

First&mdash;a discovery phase; evaluating what API can do, what developers on the other side gave you to play with. We call it a “human part” of an API. This evaluation should be easily done on the go—this is the reason why we focused to deliver a delightful experience on touch devices. (See it also on [iPad](https://apiary.a.ssl.fastly.net/assets/blog/images/new-documentation/ipad.gif).)


![Animated GIF with touch events demo—iPhone](https://apiary.a.ssl.fastly.net/assets/blog/images/new-documentation/iphone.gif)

The second phase is the implementation, you decide which action you want to hack and the “machine part” will show you code sample in language of your choice, expected results, detailed descriptions of parameters and lets your call the resource with modified variables from within your browser.

![Animated GIF with usage of Machine Column](https://apiary.a.ssl.fastly.net/assets/blog/images/new-documentation/console.gif)


## One Step Further

Your co-workers and users are constantly coming up with suggestions, questions or issues they encounter. That's why we encourage you to put your API blueprint on GitHub and let Apiary do the 2-way sync. The community can easily pick up, discuss issues, submit pull requests and just make your documentation better.

With only a few clicks, any consumer of your API gets debugging proxy base URL to point all calls at. The debugger tells them how their implementation differs from the documentation you wrote on HTTP level. Making it easy to spot all issues emerging in real world traffic.


## Our Work Is Never Over

What if documentation runs out of date? We're still working on seamless and unobtrusive way how the documentation can test itself and alert you when it goes out of sync during continuous integration process. But [first steps](http://blog.apiary.io/2013/10/17/How-to-test-api-with-api-blueprint-and-dredd/) has already been made with [Dredd](https://github.com/apiaryio/dredd).

As the world of APIs evolves, your documentation and support tools from Apiary do as well. The next big thing for us is to cover authentication and body parameters. We promise to get it right. No more 18 oAuth specifications to read through.

Another big request we're getting is to be able to embed documentation to your website with your header and customised colours and typefaces. It's coming later this year.


## Action Speaks Better Than Words

Let me show you a couple of examples:

* [Apiary Default API](http://docs.defaultapi.apiary.io/)
* [Gist Fox API](http://docs.gistfoxapi.apiary.io/?3ColumnDocumentation=1)
* [Indinesian Elections 2014](http://docs.candidateapi.apiary.io/?3ColumnDocumentation=1)
* [NeuroScale](http://docs.neuroscale.apiary.io/?3ColumnDocumentation=1)
* [Wink](http://docs.wink.apiary.io/?3ColumnDocumentation=1)
* [SendOutCards](http://docs.socapi.apiary.io/?3ColumnDocumentation=1)

> All editors/administrators of all 60,000 APIs can [opt-in](https://apiary.a.ssl.fastly.net/assets/blog/images/new-documentation/switch.gif) (Settings > Beta Area > New Documentation) for the new documentation as of now.

Before general release, there are still a few things which need to be fixed and added (like permalinks, polishing code samples, etc.), but it's only matter of weeks.

Today we are taking the next step on our mission—to make web APIs easier to design, maintain, discover and pleasant to consume. I'd love to invite you to take Apiary for a spin and I'm looking forward to your feedback.

I'm looking forward to hear your comments.