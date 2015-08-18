---
title: Integrating API Design with Continuous Integration
author: davita
excerpt: "Apiary now the only API design platform with tools for every stage of the API lifecycle"
layout: post
date: 2015-08-18 06:00:00
published: yes
comments: true
---

Everyone knows manual testing is a huge drag and incredibly time consuming. This is why test automation has been become such the norm. At Apiary, we’ve have made it our duty to streamline such exhausting tasks, especially when it comes to designing and developing APIs. Sure, we made it easy for you to quickly design, prototype and document your APIs, but we were missing one pretty important piece to completing our platform of tools for the API design lifecycle — the ability to test API specification and documentation against its backend implementation. So, well over a year ago, one of our brave engineers set out on an adventurous task to solve this problem by inventing [Dredd](https://github.com/apiaryio/dredd), an open source HTTP API testing framework.

<img width="640" src="/images/2015-08-18-Test-Tab-Now-Available-in-Apiary/screenshot1.png" alt="Apiary Testing Tab" />

## Local Test Driven Development

Our open source project [Dredd](https://github.com/apiaryio/dredd) has been such a huge hit within our community that we decided to take it one step further with Continuous integration and integrate the two into our API development platform. Giving developers the ability to use the all their favorite API tools they love within one application. With our new testing service, we didn't just make it simple to test local development against backend implementation, but we also made it dead simple to read and understand test history and reports by including recent test history, test data from continuous integration and basic Git revision and build information for each test.

## No More Outdated API Documentation

You're probably wondering what this means for your API documentation. Well, any local changes will be tested against the current implementation to ensure that your specification and documentation are always in sync. With APIs being such a dominating factor to the success of any software these days, we decided to eliminate one more vulnerability when iterating on code changes to avoid rolling out a bad API. Our buddy Dredd always has your back, and so do we.

## Closing the Loop on the API Lifecycle

As the API economy continues to flourish, we'll continue to innovate ways to master the development workflow. Integrating our favorite Judge into our platform is just the start. As our community continues to grow and provide product feedback, we'll continue to listen and create the tools needed to succeed. By integrating API Design with Continuous Integration we’ve successfully glued together API specification, documentation and implementation keeping the value of your design decisions eternal. “Any questions?”

