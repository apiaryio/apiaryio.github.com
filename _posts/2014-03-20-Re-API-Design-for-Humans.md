---
title: "Our Next Generation of API Documentation"
excerpt: "We reimagined the Apiary documentations. Learn more about what's new and what drove our design decisions."
layout: post
date: 2014-03-20 16:00:00 -0900
author: jan
published: YES
comments: true
---

## Re: API Design For Humans

I recently revisited a great [blog article](http://37signals.com/svn/posts/3018-api-design-for-humans) by Noah Lorang of Basecamp about importance of API design and documentation. Almost three years have passed since the article has been published. Today, I'm happy to present you with slightly prolonged reply from Apiary team. Our newest creation.

Web APIs flooded our world at faster pace than anyone could anticipate. In absence of good API tools, what's left is good old fashioned DIY. But I can hardly think of something as boring as reinventing the wheel for each and every API.

That day, Apiary was born.


## Observations

The lowest common denominator for all APIs is the documentation, that's where everything begins. Often it starts as a simple draft of what you're about to build, later evolving with your development to the interface others will use to implement your API. At this point, the documentation becomes the most exposed part of your work.

However a good documentation is **far beyond a simple HTML page** nowadays, and if you want to keep up with the best, you'll end up spending a considerable time on development.

What if everything can be done without building own interactive documentation, setup, hosting and maintenance? And written in something cleaner than HTML—[an enriched Markdown](http://apiblueprint.org)? Open-sourced and free? Something StackOverflow [has answers](http://stackoverflow.com/questions/tagged/apiblueprint) to? With [additional tools](http://apiblueprint.org/#tooling) built by growing community every day?

<style>

@media only screen and (min-width: 480px) {
  .centered {
    margin-left: -55px;
  }
}

@media screen and (max-width: 760px) {
  img {
    width: 100%;
    margin-left: 0px !important;
  }
}

</style>

<img src="https://apiary.a.ssl.fastly.net/assets/blog/images/new-documentation/spin.gif" class="centered" alt="Introducing Apiary Documentation">

## Perspectives

The API documentation is typically used in two different ways with almost opposite requirements.

First comes the discovery phase; finding out what an API can do, what the authors of an API gave you to play with. We call it a “human part” of an API. This evaluation should be easily done on the go—this is the reason why **we focused to deliver a delightful experience even on touch devices**.

<style>

.switcher {
  color: rgba(60, 65, 81, 0.5);
  text-align: center;
  margin-top: 0px;
  margin-bottom: 40px;
}

.switcher span {
  border-bottom: 2px solid rgba(60, 65, 81, 0.5);
  color: rgba(60, 65, 81, 1);
  margin-right: 6px;
  margin-left: 6px;
  cursor: pointer;
}

.switcher span:hover {
  border-bottom: 2px solid rgba(60, 65, 81, 0.8);
}

.switcher span.selected {
  border-bottom: none;
  color: rgba(60, 65, 81, 0.8);
  cursor: default;
}

#iPhoneAnimation,
#iPadAnimation {
  padding-bottom: 20px;
}

.hidden {
  display: none;
}

</style>

<p style="margin-bottom: 0px;">
  <img id="iPhoneAnimation" src="https://apiary.a.ssl.fastly.net/assets/blog/images/new-documentation/iphone.gif" class="centered" alt="Animated GIF with touch events demo—iPhone">
  <img id="iPadAnimation" src="https://apiary.a.ssl.fastly.net/assets/blog/images/new-documentation/ipad.gif" class="centered hidden" alt="Animated GIF with touch events demo—iPad">
</p>

<p class="switcher">
  <span class="selected" id="iPhoneSwitch">iPhone</span> • <span id="iPadSwitch">iPad</span>
</p>

<script>

var iPhoneAnimationElement = document.getElementById('iPhoneAnimation'),
    iPadAnimationElement = document.getElementById('iPadAnimation')
    iPhoneSwitchElement = document.getElementById('iPhoneSwitch')
    iPadSwitchElement = document.getElementById('iPadSwitch')

var hidePhone = function() {
  iPhoneSwitchElement.classList.remove('selected');
  iPhoneAnimationElement.classList.add('hidden');
};

var hidePad = function() {
  iPadSwitchElement.classList.remove('selected');
  iPadAnimationElement.classList.add('hidden');
};

var showPhone = function() {
  hidePad()
  iPhoneAnimationElement.classList.remove('hidden');
  iPhoneSwitchElement.classList.add('selected');
};

var showPad = function() {
  hidePhone()
  iPadAnimationElement.classList.remove('hidden');
  iPadSwitchElement.classList.add('selected');
};

iPhoneSwitchElement.addEventListener('click', showPhone, false);
iPadSwitchElement.addEventListener('click', showPad, false);

</script>

The second phase is coding. You've decided which action you want to hack and the “machine part” will show you a code sample in the language of your choice, expected results, detailed descriptions of parameters and even lets you make an API call with customized variables directly from within your browser.

<img src="https://apiary.a.ssl.fastly.net/assets/blog/images/new-documentation/console.gif" class="centered" alt="Animated GIF with usage of Machine Column">


## One Step Further

Your co-workers and users are constantly coming up with suggestions, questions or issues they encounter. That's why **we encourage you to put your API blueprint on GitHub and let Apiary do the 2-way sync**. The community can easily pick up, discuss issues, submit pull requests and just make your documentation better.

With only a few clicks, any consumer of your API gets debugging proxy base URL to point all calls at. The debugger tells them how their implementation differs from the documentation you wrote on HTTP level. Making it easy to spot all issues emerging in real world traffic.


## Our Work Is Never Over

What if documentation runs out of date? We're still working on seamless and unobtrusive way how the documentation can test itself and alert you when it goes out of sync during continuous integration process. But [first steps](http://blog.apiary.io/2013/10/17/How-to-test-api-with-api-blueprint-and-dredd/) has already been made with [Dredd](https://github.com/apiaryio/dredd). We're also working hard on better support in areas like authentication and body parameters. We're taking our time, but we want to get it right.

We've also started offering customized, branded API documentations, embedded into your website (for examples, see [Akamai](https://developer.akamai.com/api) or [GoodData](https://developer.gooddata.com/api)). We're still figuring out how to integrate this next-generation of our API documentation into these contexts, but it's coming later this year.


## Actions Speak Louder Than Words

Let me show you a couple of examples:

* [Apiary Default API](http://docs.defaultapi.apiary.io/)
* [Gist Fox API](http://docs.gistfoxapi.apiary.io/?3ColumnDocumentation=1)
* [Indonesian Elections 2014](http://docs.candidateapi.apiary.io/?3ColumnDocumentation=1)
* [Wink](http://docs.wink.apiary.io/?3ColumnDocumentation=1)
* [SendOutCards](http://docs.socapi.apiary.io/?3ColumnDocumentation=1)

## Getting Started

All editors & administrators of Apiary-powered APIs can [opt-in](https://apiary.a.ssl.fastly.net/assets/blog/images/new-documentation/switch.gif) *(Settings > Beta Area > New Documentation)* for the new documentation as of now.

Before general release, there are still a few things which need to be fixed and added *(like permalinks, polishing code samples, etc.)*, but it's only matter of weeks.

**Today we are taking the next step on our mission—to make web APIs easier to design, maintain, discover and pleasant to consume.** I'd love to invite you to take Apiary for a spin.

I'm looking forward to hear your comments.
