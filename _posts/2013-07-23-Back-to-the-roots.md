---
title: Back to the roots. Meet HTTP.
excerpt: When was the last time you actually saw HTTP?
layout: post
date: 2013-07-23 09:00:00 +1000
author: netmilk
published: YES
---

There are a lot of people talking about HTTP. Really. [For a long time.][http1] [Academics][w3c], [visionaries][roy], [hipsters][steve]. Everybody and everything is talking HTTP. Twitter, Facebook, Web applications in general, browsers, APIs, mobile devices. Even your [house][house], [lamp][hue] and even a [car][tesla] can speak HTTP. It has been said that it is so simple it can be used in even the most [simple computer processors][arduinohttp]. [Everyone is talking about it.][apiconfs] But oh my, where is it? Can I touch it? When was the last time you actually saw it? It's so abstract! It's hidden on the lowest level. It's incredible how hard it is to get a raw, naked [HTTP messages][message]. So where is HTTP and what does it actually look like?

There are ways to find it. You can see what is happening in your [browser][chromehowto] or [in your backend server][railshowto]. But this is not the raw, un-pre-processed ASCII representation of a [HTTP message][message] you are looking for. If you are not [a networking expert][wireshark] or [a hundred year old professor of computer science][tcpflow] you're lost.

What now? What is the most common and simplest HTTP client? It's [`curl`][curl], of course. But cURL `--verbose` output does not contain [HTTP Request][request] [message body][messagebody]:


	$ curl -s -v -d "foo=bar" http://curltraceparser.apiary.io/shopping-cart
	> POST /shopping-cart HTTP/1.1
	> User-Agent: curl/7.24.0 (x86_64-apple-darwin12.0) libcurl/7.24.0 OpenSSL/0.9.8x zlib/1.2.5
	> Host: curltraceparser.apiary.io
	> Accept: */*
	> Content-Length: 7
	> Content-Type: application/x-www-form-urlencoded
	>
	* upload completely sent off: 7 out of 7 bytes
	< HTTP/1.1 201 Created
	...

## The solution
Did you know that [cURL][curl] can save whole raw HTTP communication to a trace file? Unfortunately the trace file format is not really human friendly.

That why we have created and open-sourced our simple [parser for `curl --trace` option][parser]. So from now on, anytime you want to see a raw and pristine HTTP message, this is the simplest way to do it:


	$ npm install -g curl-trace-praser
	$ curl --trace - -s -d "foo=bar" http://curltraceparser.apiary.io/shopping-cart | curl-trace-parser
	> POST /shopping-cart HTTP/1.1
	> ser-Agent: curl/7.24.0 (x86_64-apple-darwin12.0) libcurl/7.24.0 OpenSSL/0.9.8x zlib/1.2.5
	> Host: curltraceparser.apiary.io
	> Accept: */*
	> Content-Length: 7
	> Content-Type: application/x-www-form-urlencoded
	>
	> foo=bar
	>

	< HTTP/1.1 201 Created
	< Content-Type: application/json
	< Date: Mon, 22 Jul 2013 13:24:33 GMT
	< X-Apiary-Ratelimit-Limit: 120
	< X-Apiary-Ratelimit-Remaining: 118
	< Content-Length: 50
	< Connection: keep-alive
	<
	< { "status": "created", "url": "/shopping-cart/2" }

There it is! Let's introduce ourselves. **This is the HTTP message**.

[http1]: https://www.w3.org/Protocols/HTTP/1.0/spec.html
[w3c]: https://www.w3.org/Protocols/
[roy]: http://roy.gbiv.com/
[steve]: http://www.steveklabnik.com/
[tesla]: https://timdorr.docs.apiary.io/
[house]: http://www.belkin.com/us/wemo
[wireshark]: http://www.wireshark.org/
[tcpflow]: http://www.circlemud.org/jelson/software/tcpflow/
[chromehowto]: http://stackoverflow.com/questions/4423061/view-http-headers-in-google-chrome
[railshowto]: http://stackoverflow.com/questions/11267540/how-to-log-specific-request-details-to-rails-server-logs
[message]: https://www.w3.org/Protocols/rfc2616/rfc2616-sec4.html
[apiconfs]: http://web.archive.org/web/20131006112904/http://api500.com/post/52003926392/the-next-conferences-on-apis-to-attend-in-2013
[curl]: http://curl.haxx.se/docs/manpage.html
[parser]: https://github.com/apiaryio/curl-trace-parser
[arduinohttp]: http://arduino.cc/en/Tutorial/WebServer
[messagebody]: https://www.w3.org/Protocols/rfc2616/rfc2616-sec4.html#sec4.3
[request]: https://www.w3.org/Protocols/rfc2616/rfc2616-sec5.html
