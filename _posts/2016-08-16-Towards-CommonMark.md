---
title: Towards CommonMark
excerpt: CommonMark is gaining traction as a standard, well-defined way to render Markdown. Apiary will join the flock. 
layout: post
date: 2016-08-16 08:00:00 -0700
author: lukas
published: true
comments: true
---

When we started Apiary five years ago, [Sundown](https://github.com/vmg/sundown) was the standard way to render Markdown. As it was used on *the* websites visited by developers, it was what people expected when writing it.

The world changed since then. Sundown was deprecated in the expectation of The New Version, and [Hoedown](https://github.com/hoedown/hoedown) fork took life of its own. Our own processing diverged: we have decoupled Markdown rendering (using [robotskirt](https://github.com/benmills/robotskirt)) from [parsing syntax of an API Blueprint itself](https://github.com/apiaryio/markdown-parser) (which is using [our forked Sundown version](https://github.com/apiaryio/sundown)). The Markdown world stated to be fragmented.

This changed two years ago [with the introduction](https://blog.codinghorror.com/standard-markdown-is-now-common-markdown/) of [CommonMark](http://commonmark.org/). We are pleased to see increasing traction and we'd love to join the club.

However, as the host of more than a quarter million API Documentation Projects, we cannot take this change lightly. While CommonMark is largely compatible with Sundown, there are subtle details that can produce different outputs that can confuse our users.

Fortunately we've been able to identify all documentations which are affected by the change. Unless you've received an email from us, there are no transition steps necessary for you. If your documentation is affected, you will receive an email from us detailing easy tools we've built to help you upgrade your Markdown.

While changes like this are never easy, we believe you and your API consumers will benefit from CommonMark. 
