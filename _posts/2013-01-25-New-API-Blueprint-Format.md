---
title: Evolving the API Blueprint Format
excerpt: As we are growing so are our users needs. To reflect this, address arising needs as well as simplifying the process of designing your API we are improving Apiary.io API Blueprint Format.
layout: post
date: 2013-01-28 09:00:00 +1000
author: zdenek
---

Apiary.io is growing and so are our users' needs. We want to fuel the endless possibilities of where your API can go. We want to give you the best tools to design and maintain any REST-based API without boundaries or limits. Yet we must also guide newcomers who are just tapping the API World.

We are constantly improving our API Blueprint Format and I would like to share with you our thoughts on how it will evolve in the weeks to come.

## It is Markdown
We have decided to fully embrace Markdown for documenting your API. With the New API Blueprint Format your API documentation will be completely in pure Markdown excluding few extra [MultiMarkdown](https://fletcherpenney.net/multimarkdown/) features.

After all we are writing API documentation, not programming a backend in _yet another domain specific language_.

Markdown is supported by virtually every language or IDE in existence. There will be no need for additional syntax-highlighting plug-in to your favorite text editor. Also rendering will suddenly be ubiquitous from your Markdown aware text editor to [GitHub GFM](http://github.github.com/github-flavored-markdown/) repositories.

## Easier onboarding
With the New API Blueprint Format getting on board will be even easier. All in proper structural order, Markdown header specifying your endpoint followed by its discussion.

## HUGE deal for big APIs
No more bloated API blueprints with lots repetition packed into one document. We will keep things DRY and introduce (more) modularity. Here is what is new in API Blueprint Format to deal with large, complex APIs:

* Data Dictionaries
* Cross-References
* Dedicated Modules for Testing, Authentication, Tutorials and Storyboards.
* Arbitrary User Modules (units)
* Inheritance

## Attributes
New format will introduce support for discussing attributes including its type, default value and requirements.

## Hypermedia is good
While I understand and have nothing but utmost respect for "pragmatic REST" I want to encourage considering RESTful approach from the early beginnings. If Apiary would give you the right seamless tool to make real RESTful API with little extra effort would you opt to do so?

## To the future and beyond
We will also deliver (or improve existing) support for **multimedia**, **multiple** **request** and **response** with improved schema support. This should be followed later by support for **authentication** an **pagination**.

As you can see there are big changes ahead. We will make sure to make things smooth for you and all our existing users.

In the next weeks I will be posting more details about the upcoming format changes including examples. In the mean time, if you're excited what will the new format bring or just curious about the direction API Blueprint is heading, please head over to [New API Blueprint Format](http://support.apiary.io/forums/120125-general/suggestions/2970802-new-api-blueprint-format). There you can vote for the new format and add your comments and wishes. Additionally you can contact me directly at [z@apiary.io](mailto:z@apiary.io). I would love to hear from you.
