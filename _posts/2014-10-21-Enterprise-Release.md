---
title: Make it so - Apiary enters the Enterprise
author: andrew
excerpt: "Apiary is excited to annouce it's enterprise offerings today"
layout: post
date: 2014-10-21 08:50:00
published: yes
comments: true
featured: true
---

It has been an exciting summer at Apiary. I joined at the beginning in June to lead Apiary’s enterprise project. Today, we announce the product, which is the result of a lot of discussion with customers, and a lot of hard work by our product development team. 
**Apiary for Enterprise**

Apiary has grown tremendously over the last three years. Tens of thousands of developers have created over 100,000 APIs on the Apiary design platform. At the same time, larger companies have started realizing the benefits of a well-defined API design lifecycle. API Blueprint forms the basis of a great, collaborative API design experience. Yet, Apiary’s larger customers were looking for benefits beyond the team collaboration tools we offer. 

## API Style Guide

Again and again, we heard the same story from developers working on larger API projects. The story involves what some call an **“API style guide”**, but it goes by many names. Some projects refer to it as “contract authoring guidelines”. No matter what the name, it reflects a need to ensure consistency in the APIs being developed by multiple teams.

The key driver for these efforts, we have found, is a company-wide “platform strategy”. Many organizations have more than one API, and in many cases they are trying to unify and expose all of the APIs they own. Often, this reflects a key strategy designed to evolve the business to support emerging opportunities in mobile, IoT, and so on.

Throughout the API lifecycle, there are a million decisions that need to be made, some minor some significant. Some of the big ones:

* What media types will we support and to what extent should we use hypermedia? 
* What authentication and authorization schemes should we use?
* Which methods should be private, and which public?
* How do we do error handling?

Then there are the seemingly insignificant decisions:

* Should we support just POST and PUT or also support PATCH?
* Should we use camel case?
* Should a DELETE return a response payload or not?
* What HTTP status codes should be supported for each method?
* What time format should we use?

If you are an API architect or an API product manager, you may have spent a significant amount of time developing an API style guide. Or, more likely, you’ve been thinking about creating one. 

The style guide encodes all of the best practices, random coin tosses, and also resolves theological debates about contentious topics like REST and hypermedia. However, the style guide is only as good as your ability to socialize it. Manual reviews of API designs might help to some extent. But as APIs are implemented, deployed, and versioned, how can you be sure whether interfaces that form the contract between your organization and the developer have not changed?

Once organizations finally settle on a set of guidelines, there’s a new challenge: how to ensure that APIs adhere to the guidelines, without imposing an undue burden on developers? The design guide needs to work from the bottom up, or else it risks being resisted, or worse, ignored. Constantly consulting a document just adds another level of ‘bureaucracy’, slowing down the deployment of APIs.  

## API Design Assertion Language

To address this need, Apiary is introducing a programmable layer on top of API Blueprint. This layer can be be used to codify the basic design rules that are established in an organization’s API style guide.

![enterprise plan](/images/2014-10-21-Enterprise-Release.png)

With [this release][post], Apiary introduces a simple way to express design decisions in the form of an **API design assertion language**, a simple JavaScript-based language that can be used to evaluate API designs against a style guide. The great thing is that it evaluates APIs as they are being created in the Apiary’s API Blueprint editor.

In keeping with the Apiary’s developer-friendly ethos, we have kept [Apiary for Enterprise][] lightweight, elegant, and usable. Our goal is to make all developers lives easier, whether they are implementing or consuming APIs. By providing real-time feedback on API designs, we hope to ensure that developers spend less time refactoring inconsistent APIs, and more time building new ones. We also hope that developers who consume APIs will have an easier time as APIs become more predictable and consistent. 

To know more about this plan and its features, you can contact me or support@apiary.io


[Apiary for Enterprise]: http://enterprise.apiary.io
