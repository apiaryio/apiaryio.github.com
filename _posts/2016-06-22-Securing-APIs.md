---
title: Securing APIs
excerpt: It’s a Big, Scary World out There.
layout: post
date: 2016-06-23 00:00:00 +0200
author: corvax
published: true
---

In the past few years, we’ve seen stories breaking around people hacking Internet of Things (IoT) devices such as [cars](http://www.wired.com/2015/07/hackers-remotely-kill-jeep-highway/), [guns](http://www.wired.com/2015/07/hackers-can-disable-sniper-rifleor-change-target/) or a [Barbie doll](http://www.pcworld.com/article/3012220/security/internet-connected-hello-barbie-doll-can-be-hacked.html). We’ve seen vulnerable protocols and implementations happening again and again coming even from big vendors where we’d expect a higher level of security assessment. It was a whole spectrum of small and big attacks. Not always as sophisticated as they _should_ be. Quite often exploiting weak API security. APIs without TLS. APIs using a single token for all devices. Weak default credentials and many more pitfalls. We were laughing at an idea of installing a firewall to our fridge. Is current API security that weak or that hard?

Good news is that we _almost_ figured out securing server communication with the browser. TLS is becoming a standard even for small or personal projects. We have new security policies and APIs in all major browsers. We can enforce and control security features with just adding HTTP headers to server responses. And many more small and large improvements. These altogether add some serious security to the web. Can we say the same about API landscape? Above examples shows that we can't.

One thing is for sure: it’s **really hard** to fully understand implications of choosing one protocol or scheme over another. Although core ideas and principles are usually well documented, frameworks and libraries rarely help with this task. A look at a [security site](http://security.stackexchange.com) can demonstrate how hard it is to understand these concepts. For instance, what’s the top answer on Google for a cURL certificate mismatch? Few lines of code to disable this security check.

History and experience show us that crypto and security can be described as _exciting_ by only a fraction of people, and if it isn’t interesting and/or easy, people won’t care about it. We can keep inventing more intricate schemas and [security protocols](https://en.wikipedia.org/wiki/Double_ratchet) and yes, we’ll always need them. Yet, we won’t make crypto _inviting_ for everybody. Sadly, it just isn’t meant to be.

We can improve developer experience of using security features in their stacks. We can do a great amount of work on explaining shortcomings of disabling such features to a developer trying to turn them off. We can develop libraries that will **require** only the highest security standards.

> - uses `--insecure` flag
> - I'm sorry, Dave, I'm afraid I can't do that.

It takes educated and dedicated people with enough time and resources to do security _well enough_. The rest will ignore warnings and prompts that your tool produces if it slows them down or annoys them. Security and crypto always need to be on the move. The problem is that it’s not going to get easier, and it’s not aiming to get easier. With IoT in the mix of the API landscape, it's only more inviting for attackers to try to break your API security. You must make sure you are doing security well.

One possibility I can imagine is: outsourcing to somebody who is good at crypto. Security of my API will be just another feature of my provider. If this allows people dedicated to security to do their jobs and allows me as an API developer and consumer to be able to trust any API I'm interacting with, then it's a win-win. But it shouldn't be something I pay for extra. It must be a default option. Security must be part of this contract and API contract in general.

I wish for a future where I can look at any API and check if their implementation of SAML, OAuth, Hawk or anything else is secure. This calls to embedding your API security schema right into your API description as a first class citizen. Then designing your API around these security concepts comes just as natural.

*This article has been originally published at [Securing APIs: A Look Ahead](http://www.heavybit.com/library/blog/securing-apis-a-look-ahead/).*
