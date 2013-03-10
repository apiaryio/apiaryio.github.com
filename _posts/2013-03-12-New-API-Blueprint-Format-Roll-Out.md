---
title: Blueprint Format Roll Out
excerpt: New API Blueprint Format specification has been closed as we are getting ready for its roll out. 
layout: post
date: 2013-03-12 09:00:00 +1000
author: zdenek
published: NO
---

As you may know the [New API Blueprint Format](http://blog.apiary.io/2013/02/20/New-API-Blueprint-Format-Basics/) will be rolling out soon and today I would like to discuss how it will be done. 

## 1A Format Specification
First I would like to thank to our awesome users who did contribute to the New Format in reaction to my previous [post](http://blog.apiary.io/2013/02/20/New-API-Blueprint-Format-Basics/). In the process we have made quite few changes to the Format and you can find its [final specification](https://github.com/apiaryio/blueprint-parser/blob/zdne/format1A/doc/APIBlueprintSpecification.md) in our (open sourced) [parser repository](https://github.com/apiaryio/blueprint-parser/tree/zdne/format1A). The specification is also accompanied by few [examples](https://github.com/apiaryio/blueprint-parser/tree/zdne/format1A/examples) if you want to get a quick peek on how it will look like.

Note that this first version is only a mere milestone on the [Format evolution](http://blog.apiary.io/2013/01/27/New-API-Blueprint-Format/). However we still keep the main thing the main thing: The **API Blueprint must be the best way possible for both designing and documenting your API**.

## Roll Out: Gradual Opt-In
The rollout will be on opt-in basis. That is we won't "switch" everything to new format immediately. Instead the two (legacy and 1A) formats will live in parallel for some time. You will be able to opt-in for the New Format by specifying format version in your blueprint's [metadata](https://github.com/apiaryio/blueprint-parser/blob/zdne/format1A/doc/APIBlueprintSpecification.md#41-metadata-section-metadatasection).

Also there will be automatic lossless transition from the legacy format to the New Format possible. No need to rewrite anything by hand. 

With that being said if you are familiar with the current format or do not mind to quickly dive in it is perfectly fine to start with your API today without any fear that you will have to start over once the New Format arrives. 

As always I would love to hear from you. You can reach me on [my email](z@apiary.io) or comment on [New API Blueprint Format](http://support.apiary.io/forums/120125-general/suggestions/2970802-new-api-blueprint-format).



