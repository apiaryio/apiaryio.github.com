---
title: World’s First API Design Hackathon
excerpt: We were at the World's first API Design Hackathon.
layout: post
date: 2016-04-21 00:00:00 -0700
author: zdenek
published: true
---

On the 16th of April, Emmanuel, Jakub and Z from Apiary took part in the world’s first API Design Hackathon at GitHub HQ. The hackathon was organized by the San Francisco API Craft group and sponsored by Apiary, Mulesoft and GitHub.

It was a sunny Saturday in San Francisco when group of about 30 API Crafters met to take on improving the [GitHub Gist API](https://developer.github.com/v3/gists/). There were no other guidelines how to improve the design, be it adding a new feature, changing the existing behavior or architectural style.

We started at 10AM in the GitHub offices and after a quick breakfast, we split into 3 teams.

<img width="640" src="/images/2016-04-21-API-Design-Hackaton/breakfast.jpg" alt="breakfast" />

Each team used a different toolset and API description language: Apiary (API Blueprint & Swagger), Apigee (Swagger) and Mulesoft (RAML).

## The API Design Session

The teams spent the morning and part of afternoon tinkering with the API Design and the tools. What was the outcome of all the day-long discussions and coworking?

Here is the example how the Z’s team (Jesse, Gerald, Joshua, Craig and Kingsley) worked:

> [Z](https://twitter.com/zdne): "My team decided to use hypermedia architectural style, the [Siren hypermedia media type](https://github.com/kevinswiber/siren) and to add the feature of collaborators to the Gist API. We first went through the semantics of Gists and picked a portion of the existing API we wanted to redesign – namely gist, list of gists, user, list of users and the API root resource.

> We then drew a state machine diagram on a whiteboard and with the help of [Kevin Swiber](https://twitter.com/kevinswiber), author of Siren, described the API in API Blueprint.

> It was a great day for all of us to learn about API Design, Apiary and its tooling, and the Siren media type.”

<img width="640" src="/images/2016-04-21-API-Design-Hackaton/team.jpg" alt="team" />

At 3:30pm, the teams got together in the auditorium and presented their [findings](https://github.com/apicraftsf/hackathon2016).

> [Craig Oda](https://twitter.com/craigoda1): “This was so awesome! I hope you are extending API Blueprint right now to enable it to produce dynamic API state diagrams for collaborative brainstorm. As the name implies, "Blueprint," already has good branding to make it into a definition language and toolset to be used like a CAD blueprint that house architects create for construction people to use to build houses. Thanks for your help!”

## What is API Craft?

<img width="640" src="/images/2016-04-21-API-Design-Hackaton/emmanuel.jpg" alt="boss" />

> From [apicraft.org](http://www.apicraft.org): We are a collection of people from all over the world who care about the art of building, maintaining and consuming APIs.

> We got started in 2013, when a small group of API fanatics gathered for an Open Space conference in Detroit. Since then, local API Craft groups have sprouted up all over the world and we have come together as a global group every year to continue the conversation.

> If you care about the craft of building great APIs, we hope you will join the conversation in any way you can – local gatherings, our annual conference, or [online](https://groups.google.com/forum/#!forum/api-craft).

To get updates on upcoming events in San Francisco, please join the API Craft SF [meetup group](http://www.meetup.com/API-Craft-San-Francisco/).
