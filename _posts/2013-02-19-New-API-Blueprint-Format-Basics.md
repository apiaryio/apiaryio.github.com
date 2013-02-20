---
title: New API Blueprint Format Basics
excerpt: Discussing basic features of the New API Blueprint Format – Markdown, API endpoints, multiple requests and responses and commenting on parameters.
layout: post
date: 2014-02-20 09:00:00 +1000
author: zdenek
published: false
---

This is the second article in the series about upcoming API Blueprint format changes. As promised [before](http://blog.apiary.io/2013/01/27/New-API-Blueprint-Format/) I will continue introducing changes to the API Blueprint Format. Today we will discuss basics of the New API Blueprint Format upon which we will build later on.

## Markdown
New API Blueprints will be entirely written in [Markdown](http://daringfireball.net/projects/markdown/). In addition to Markdown advanced blueprints will rely on several [MultiMarkdown](http://fletcherpenney.net/multimarkdown/) features. However, for discussing basics, all that matters is that New API Blueprint is completely Markdown from line number one to the end.

A Markdown API Blueprint document follows given structure. At the very heart of this structure is an API endpoint. In fact, New API Blueprint document is essentially a collection of API endpoints. There are additional components such as the API Overview Section but we will now focus only on API endpoints for now.

## API Endpoint
An endpoint usually represents a resource on the server. It is represented by an URI relative to API root and one or more HTTP verbs (methods). 

In API Blueprint an API endpoint is defined as a Markdown header with optional HTTP method followed by an URI. After the header follows structured discussion of the endpoint. The endpoint discussion consists of sections of predefined meaning. These sections are delimited by a nested Markdown headers with reserved section names (e.g. `## Request`). Finally, the API endpoint is closed by Markdown's horizontal ruler.

API Endpoint structure:

![API Endpoint Structure](/images/2013-02-19-API-endpoint.png)

For example:

	# GET /message_of_the_day
	Retrieves message of the day.
	
	## Response 200 (application/json)
		{ "message" : "Hello World" }
		
	---
	
represents an endpoint _message_of_the_day_ which upon being requested with HTTP GET method returns status code of `200` with response header `Content-Type: application/json` and response body `{ "message" : "Hello World!" }`.

## Discussing parameters
One of much requested features of the New Format is the ability to discuss both URI and payload parameters. While you can always do this on your own using any Markdown-formatted text as endpoint discussion the New API Blueprint Format will introduce direct support for discussing parameters and body payload. 

Consider an endpoint that allows you to retrieve message of the day for any given date:

	# GET /message_of_the_day{/date}
	Retrieves message of the day. If no @date is specified a message for the current day is returned.

	## Parameters
	@date = "2013-02-17" (string) ... ISO 8601 date to retrieve message of the day for. 

	## Response 200 (application/json)
	@.message (string) ... Extraordinaire message of the day.
	
		{ "message" : "Hello World" }
		
	---
	
As you can see the `@` sign denotes URI parameter while `@.` stands for local scope parameters. Also in this example we have used MongoDB - style [dot notation](http://docs.mongodb.org/manual/core/document/#dot-notation) for reaching into a JSON object.

## Multiple requests and responses
Occasionally it may be a good design to have an endpoint that accepts multiple different requests. Far more common situation is that an endpoint will offer more than one response. New Format is built with that in mind. 

Consider an endpoint that allows you to create new message of the day either as a copy of a message from another day or as a completely new one:

	# PUT /message_of_the_day
	Creates message of the day for the current day either from **scratch** or as a **copy** of an existing message.
	
	## New MOTD Request (application/json)
		{ "message" : "Hello World" }
		
	## Duplicate MOTD Request (application/json)
		{ "date" : "2013-02-17" }
	
	## Response 201 (application/json)
		{ "status" : "created" }
		
	## Response 404 (application/json)
		{ "status" : "not found" }
		
	---
	
Note that "New MOTD" and "Duplicate MOTD" strings in request headers are just mere identifiers of the particular `Request` section. Also note we usually suggest to document only regular state responses and save error states for general API Overview discussion.

## Comments
The last feature of New API Blueprint Format I want to discuss today are the comments. Simply use HTML-style comments (`<!--` and `-->`) anywhere in your blueprint document to comment out a block of blueprint or make additional notes. We believe this will be very useful for both newcomers and experienced users.

## Additional example
If you would like to see a little bit more complex example that demonstrates additional basic features such as multiple HTTP methods on one endpoint or response headers you can find it on [GitHub](https://gist.github.com/zdne/4977305). You can preview it as a [rendered document](https://gist.github.com/zdne/4977305) (benefits of Markdown) or its [raw source](https://gist.github.com/zdne/4977305/raw/0001e513f2467b8d154eef270f4a76caa1e4ada3/BasicExample.md).

## Coming up next
In the next post I will be discussing intermediate features of New API Blueprint Format such as Blueprint Modules, References, User-specific tokens, Multimedia and Authentication.

Until then, I would love to hear from you. Please do not hesitate to share with us your thoughts and comments. You can contact me directly at [my email](z@apiary.io) or comment on [New API Blueprint Format](http://support.apiary.io/forums/120125-general/suggestions/2970802-new-api-blueprint-format).
