---
title: Bam! This is Gavel.
excerpt: We are introducing our brand new HTTP validation package.
layout: post
date: 2013-07-25 09:00:00 +1000
author: netmilk
published: YES
---

I'm very proud to introduce Gavel—our first contribution to the Testing Culture we are so passionate about. We have isolated HTTP validation behavior from our interactive console, created platform independent specification and are shipping it as implementation in Node.JS

> **gavel** /ˈgævəl/ *noun*
> **1** A small mallet used by a presiding officer or an auctioneer to signal for attention or order or to mark the conclusion of a transaction.
> **2** A maul used by masons in fitting stones.

The complexity of [HTTP and its specification is incredible][http], but there are lots of pragmatic conventions in the real world. Gavel is our attempt to invite you to the open discussion about conventions in the real world of HTTP and ship it as Node.JS library to have a toy to play with right now.

HTTP is platform and language independent by nature. So is Gavel. All of Gavel's documentation is written in [Cucumber][], ready to be implemented in variety of languages supported by Cucumber or its derivates. Documentation is  hosted on [Relish][], an awesome, documentation-oriented platform for managing Cucumber features. We love it because it enables the same iterative design process as Apiary and our [API Blueprint][].

![Gavel logo](https://raw.github.com/apiaryio/gavel/master/img/gavel.png)

## Using Gavel

Gavel comes with CLI interface so the first version is very minimalistic:

    $ npm install -g gavel curl-trace-parser
	$ curl --trace - http://httpbin.org/ip | curl-trace-parser  > expected
	$ curl --trace - http://httpbin.org/ip | curl-trace-parser  > real
	$ cat real | gavel expected
	$ echo $?
	0

Let's see what happens if CORS headers are missing in the response

	$ cat real | grep -v 'Access-Control-Allow-Origin' > real_without_cors
	$ cat real_without_cors | gavel expected
	$ echo $?
	1 

If you are a Node.js ninja, you can enjoy using the [Gavel JS API][gavel.js]

Gavel's first version is very thin. It comes only with a boolean interface which decides if a pair of HTTP Requests or Responses are valid against themselves or are not. We'd like to make this a starting point of a discussion about headers validation and output format for validation errors. Feel free to submit an [GitHub issue][] and tell us what you want. We'll be even more excited if you contribute. 

## Resources

- [Gavel Node.JS library][gavel.js]
- [Gavel specification and documentation][gavelrelish]
- [Gavel specification GitHub repo][Gavel]



[Gavel]: https://github.com/apiaryio/gavel
[gavel.js]: https://github.com/apiaryio/gavel.js
[gavelrelish]: https://www.relishapp.com/apiary/gavel/docs
[http]: https://www.w3.org/Protocols/rfc2616/rfc2616.html
[Cucumber]: http://cukes.info/
[Relish]: https://www.relishapp.com/
[API Blueprint]: https://apiblueprint.org
[Github Issue]: https://github.com/apiaryio/gavel/issues
[jsapi]: https://www.relishapp.com/apiary/gavel/v/1-0/docs/node-js
