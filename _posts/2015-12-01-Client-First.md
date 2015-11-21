---
title: Client first
excerpt: Think about your clients -- both humans and machines -- before starting to design your constraints
layout: post
date: 2015-12-01 08:00:00 -0700
author: almad
published: true
comments: true
---

If there is a key in your payload but no client to use it, does it really exist?

Every architecture starts with constraints, and every constraint is introduced to achieve desirable results. In order to get your API goals right, you inevitably need to think about how your API is going to be consumed.

Writing things down into an API Description is a great start, but it's only the beginning. Without actually talking and prototyping with the other side, chances are that you are going to put emphasis on the needs of the server and ignore the needs of the client.

One of the big dangers involved is imagining API usage _for_ the clients. If you don't have actual constraints in API that force them to behave that way, your design will most probably stay in form of proposal.

Want client developers to handle failures gracefully? Return failure responses more often. Want them to treat your API as state machine and navigate through links? Obfuscate URLs and change them often. Confident in our API change coping strategy? Do (breaking) changes daily.

Engineering is a hard game of trade-offs; intents above may not be for you. But unless you actually fullfil your intents (maybe to their extreme), you can't rely on them.

All new approaches in APIs are chicken-and-egg problem where agreement must be reached, and I argue that clients are the more powerful force here.

Without clients sending `ETag` back, you don't have caching, you have larger headers. Without API clients actually following HAL links, you don't have hypermedia API, you have inflated payloads. Without terrific and safe execution environment, you don't have Code On Demand, you have injected garbage.

If you feel usage starts on server, start sending LISP to your web browsers today, and wait for them to catch up.
