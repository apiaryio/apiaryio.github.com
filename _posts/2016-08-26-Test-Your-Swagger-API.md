---
title: Test Your Swagger API
excerpt: Introducing support for Swagger in Dredd and more.
layout: post
date: 2016-08-26 00:00:00 +0100
author: honza
published: true
comments: true
---

At Apiary we're proponents of design-first approach when it comes to building APIs. However, it's hard to do design-first and have your "single source of truth" in the API description document, if you can't easily test your API implementation against it.

<img width="640" src="/images/2016-08-26-Test-Your-Swagger-API/dredd-swagger.png" alt="dredd-swagger" />

## Support for Swagger in Dredd

It's a [long time][original-dredd-article] since we announced [Dredd][dredd], an Open Source framework for testing HTTP-based APIs. Over the years it grown into a fully-featured, mature, and very popular tool. Until now it supported only [API Blueprint][api-blueprint], but we want to empower everybody to test their API, regardless of the chosen description format.

Good news everyone! With [1.1.0][] release, all Dredd's features are now available also for users of the [Swagger][swagger] API description format. Since version [1.5.0][] the Swagger support is considered production-ready. Here we would like to thank to all the adventurous minds who helped us to improve the initial implementation. Only thanks to you we could remove the "experimental" label so soon!

Please follow the [Quickstart][quickstart] tutorial to see how easy is to employ Dredd in your API's life cycle. Also, there's an [example application][dredd-example] you can use as a starting point.

## Write Dredd Hooks in Your Favorite Language

Expressive power of API description formats has its limits and testing can easily get rather complex when it meets real-world situations. One of the coolest features of Dredd is its extensivity by so-called [hooks][]. Hooks are pieces of arbitrary code you can get executed before or after every test case.

Originally Dredd was able to execute only hooks written in JavaScript, but in recent months it got first-class support for many other languages, namely [Perl][], [PHP][], [Python][], [Ruby][], and [Go][]. Since there's a [tutorial][hooks-new-language] on how to implement new hook handler, every now and then contributors come with support for their favorite language.

Here we would like to thank especially to [Dom Del Nano][ddelnano], who did tremendous job with his PHP hooks and with Go support.

## There's More!

Dredd's changelog is getting significantly longer every week now, so even if you already use the framework, there's a big chance there's something new you have yet to discover. Check out Dredd's updated [documentation][dredd], try out its [convenient integration with Apiary][apiary-reporter] or scan through growing [collection of how-to guides][how-to-guides].

Finally, I can't even express here how awesome it is to work on a project like Dredd and to see how helpful it is to people. Thank you all for using Dredd, reporting back issues and contributing code or ideas. By new [contributing guidelines][contributing-guidelines] I would like to make clear that everyone is very welcome to join us in the effort to make Dredd better!


[dredd]: http://dredd.readthedocs.io/
[original-dredd-article]: https://blog.apiary.io/2013/10/10/No-more-outdated-API-documentation
[api-blueprint]: http://apiblueprint.org/
[swagger]: http://swagger.io/
[apiary-reporter]: http://dredd.readthedocs.io/en/latest/how-to-guides/#using-apiary-reporter-and-apiary-tests
[quickstart]: http://dredd.readthedocs.io/en/latest/quickstart/
[hooks-new-language]: http://dredd.readthedocs.io/en/latest/hooks-new-language/
[ddelnano]: https://github.com/ddelnano/
[hooks]: http://dredd.readthedocs.io/en/latest/hooks/
[dredd-example]: https://github.com/apiaryio/dredd-example/
[how-to-guides]: http://dredd.readthedocs.io/en/latest/how-to-guides/
[contributing-guidelines]: https://github.com/apiaryio/dredd/blob/master/CONTRIBUTING.md

[Perl]: http://dredd.readthedocs.io/en/latest/hooks-perl/
[PHP]: http://dredd.readthedocs.io/en/latest/hooks-php/
[Python]: http://dredd.readthedocs.io/en/latest/hooks-python/
[Ruby]: http://dredd.readthedocs.io/en/latest/hooks-ruby/
[Go]: http://dredd.readthedocs.io/en/latest/hooks-go/

[1.1.0]: https://github.com/apiaryio/dredd/releases/tag/v1.1.0
[1.5.0]: https://github.com/apiaryio/dredd/releases/tag/v1.5.0
