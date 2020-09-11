---
title: "API Design: Mind Maps & Surfing"
excerpt: "How to design and build API using mind maps, API Blueprint and Apiary."
layout: post
date: 2014-03-06 10:00:00 +0100
author: zdenek
published: YES
comments: true
---

![API mind map](/images/2014-03-06-Surfing-API/api-mindmap.png)

When I saw the above API mind map in the excellent article [**Quickly Prototype APIs with Apiary**][sendgrind-article] by [Elmer Thomas][] of [SendGrid][] I have jumped up.

It never occurred to me before. This is a web structure! This is how Internet works! You go to the root of a site and let the links drive you to whatever the site has to offer. **Surfing the web they say**.

Could this be done with an API? Is it possible explore and consume API resources by something as simple and natural as browsing?

In this article I will demonstrate how to turn a mind map into an API that can be browsed by its clients. To achieve this I will be using API Blueprint and Apiary. The server will be written in Ruby as well as the client surfing the API.

## Building the API with Apiary
Following Elmer's footsteps I will first describe (a portion of) the GTD Todo API in [API Blueprint]. Doing so will instantly rewards me with the *interactive documentation*, *mock server*, *call inspector* and most importantly with the *tests for a continuous integration*.

## Mind mapping the API
Mind mapping as the way of thinking about our API is a great idea. Let's zoom in on the folders portion of GTD Todo API and (mind) map it for the purpose of this article. Note I have put a little bit more emphasis on the distinction between resources attributes (starting with `@`) and links:

![Folders mind map](/images/2014-03-06-Surfing-API/folders-mindmap.png)

## Writing the API blueprint
Having an idea what the API should look like I can start writing its API blueprint in Apiary.

One last thing that I need to figure out before writing the blueprint is what media type to use for representing our resources including the links. There is [plenty][media-types] to choose from. I will go with [HAL][] for the purpose of this article due to its low footprint and lots of great tools supporting it.

The basics of writing a blueprint were already covered in the [*Quickly Prototype APIs with Apiary*][sendgrind-article] article so I won't repeat it here. You can also use the [API Blueprint tutorial][] to quickly dive into the API Blueprint format. In case of questions check the API Blueprint at [Stack Overflow][] or ask directly the Apiary support.

Here is the completed blueprint and the documentation rendered from it:

+ [**GTD Todo API Blueprint**][todoapi-blueprint]
+ [**GTD Todo API Documentation**][todoapi-documentation]

With the API blueprint in place we can **immediately start working** on the client **AND** the server since Apiary provides us with the *mock server implementation* that can be used to build the clients without writing a single line of a server code.

## Writing the server
As I was implementing the server I was constantly testing it against the blueprint using the [Dredd][] API Blueprint testing tool. A *description-driven development* if you will.

It is a good habit to have the API blueprint living in the repository next to the server implementation. This way it is tested in a continuous integration (e.g. [Travis CI][]) every time a change is pushed to the upstream:

+ [**GTD Todo API repository**](https://github.com/zdne/todoapi)
+ [**GTD Todo API in Travis CI**](https://travis-ci.org/zdne/todoapi)

The example server is written in Ruby using [Sinatra][] and [Roar][] to better demonstrate another good paradigm: *Abstraction of a resource from its representation(s)*:

Let's look at the `Folder` resource - a data model as used in backend, perhaps coming from a database:

```ruby
class Folder
  attr_accessor :id
  attr_accessor :name
  attr_accessor :description
  attr_accessor :parent
  attr_accessor :meta
end
```

In REST we do not send the resources around as they are. Instead we interact with their *representations*. With [Roar][] I can easily create a resource representation using the appropriate representer, specifying what attributes to represent:

```ruby
module FolderJSONRepresentation
  include Roar::Representer::JSON

  property :id
  property :name
  property :description
  property :parent
  property :meta
end
```

and then apply the representer on a resource:

```ruby
folder = Folder.new
folder.extend(FolderJSONRepresentation)
folder.to_json  # returning JSON representation of Folder
```

Similarly I can define and use the HAL or any other (e.g. XML) representation for the `Folder` resource. Following this pattern we can keep the backend data models free of any representation clutter and also radically simplify the API content negotiation.

Here is the complete implementation:

+ [**GTD Todo API server**](https://github.com/zdne/todoapi/blob/master/app.rb)
+ [**GTD Todo API resources & representations**](https://github.com/zdne/todoapi/blob/master/domain_model.rb)

## Writing the client
Time to go surfing.

Having my cake and eat it I will demonstrate using the API on this (slightly contrived) example: Iterate every folder in the API and print all of its attributes.

How hard can this be using Ruby and [HyperResource](https://github.com/gamache/hyperresource)?

```ruby
api = HyperResource.new(root: 'http://mock-gtdtodoapi.apiary.io')
api.folders.get.each do |f|

  folder = Folder.new
  folder.extend(FolderHALRepresentation)
  folder.from_hash(f.get.body)

  puts "==> folder (#{f.id}):"
  puts "  name: #{folder.name}"
  puts "  description: #{folder.description}"
  puts "  parent: #{folder.parent}"
  puts "  meta: #{folder.meta}\n\n"
end
```

What happens here?

First I navigate to the root of GTD Todo API. In this case using the Apiary mock server:

```ruby
api = HyperResource.new(root: 'http://mock-gtdtodoapi.apiary.io')
```

Then I follow the `folders` link retrieving the `folders` resource HAL representation and iterate every embedded `folder` in it:

```ruby
api.folders.get.each do |f|
```

Finally I will create an empty instance of the `Folder` resource (sharing the same data model with the server). Extend it with HAL Roar representer and fetch in the folder body following the `self` link of the embedded item:

```ruby
folder = Folder.new
folder.extend(FolderHALRepresentation)
folder.from_hash(f.get.body)
```

Voilà, here is one of the folders ready to print out!

The complete client implementation (not much more to see there):

+ [**GTD Todo API client**](https://github.com/zdne/todoapi-client-ruby)

## Further Reading
To learn more about the principles of API architecture similar to the architecture of web I would suggest to start with [this summary][hypermedia-api] by Steve Klabnik.

Good read is also the [Is your API more RESTful than a static HTML site?][restful-site] post by Stephen Mizell.

## Acknowledgment
The original GTD Todo API mind map and the GTD Todo API idea is courtesy of [Elmer Thomas][] and it was used with his approval. Thank you Elmer!

[sendgrind-article]: http://sendgrid.com/blog/quickly-prototype-apis-apiary/
[Elmer Thomas]: https://twitter.com/thinkingserious
[SendGrid]: http://sendgrid.com
[affordances]: http://en.wikipedia.org/wiki/Affordance
[REST]: http://smizell.com/weblog/2013/restful-static-site
[API Blueprint]: https://apiblueprint.org
[media-types]: https://www.oreilly.com/content/how-a-restful-api-represents-resources/#:~:text=Common%20Media%20Types%20for%20RESTful%20APIs
[HAL]: http://stateless.co/hal_specification.html
[API Blueprint tutorial]: http://apiary.io/blueprint
[Stack Overflow]: http://stackoverflow.com/questions/tagged/apiblueprint
[todoapi-documentation]: http://docs.gtdtodoapi.apiary.io
[todoapi-blueprint]: https://github.com/zdne/todoapi/blob/master/apiary.apib
[Sinatra]: http://www.sinatrarb.com
[Roar]: https://github.com/apotonick/roar
[Dredd]: https://github.com/apiaryio/dredd
[Travis CI]: https://travis-ci.org
[hypermedia-api]: https://coderwall.com/p/xvzu-g
[restful-site]: http://smizell.com/weblog/2013/restful-static-site
