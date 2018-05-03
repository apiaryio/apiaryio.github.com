---
title: Announcing Apiary Constitutions
excerpt: Introducing a new tool for writing API Style Guides
layout: post
date: 2018-04-25 08:00:00 +0200
author: corvax
published: true
---
 
We’ve been a long time proponents of practices like [design-first](https://apiary.io/how-to-build-api) and contract-driven development. For a while, part of our Apiary Pro offerings are also [Style Guides](https://help.apiary.io/tools/style-guide/). It’s a way to programatically define and check your company API Style Guides. For most of the world, API Style Guides are these long, static PDFs written by architects, without any tools to apply them to the API design phase or check how well implemented they are.

[Apiary Style Guides](https://help.apiary.io/tools/style-guide/) are a tool for checking consistency of your API Designs. They are integrated into the [Apiary Editor](https://help.apiary.io/tools/apiary-editor/), but writing your own rules used to be a laborious task. We wanted to simplify the experience.

![Constitutions test runner](/images/2018-04-25-Constitutions/constitutions-test.png)

## Meet Constitutions
> [Apiary Constitutions](https://github.com/apiaryio/constitutions) is a tool for writing, testing and managing Style Guide rules. Rules are written in JavaScript and works for both API Blueprint and OpenAPI Specification definitions, thanks to our [API Elements](http://apielements.org/) tooling.

[![Apiary Constitutions repository](/images/2018-04-25-Constitutions/constitutions-repo.png)](https://github.com/apiaryio/constitutions)

It’s a repository prepared for the rules development. Comes with a default set of rules you have enabled when you start using Style Guide in Apiary. You can easily reuse them or make them your starting point for custom rules. Our goal was to supply you with a way to have a simple `build` and `test` commands.

### How does it work?
To stay true to the example driven development, Constitutions will require of you to supply **both passing and failing example documents** for your Style Guide rule. So you can see how a correct usage looks like. This also helps you test the rules as you develop them. These examples are then reused for generating a readme, which should serve as a readable API Style Guide reference.

We then use [Webpack](https://webpack.js.org) to build a single file with all your rules, which is then run through our rules engine. We recommend to fork the Constitutions repo if you wish to have your own API Style Guides in git.

![Apiary Style Guide](/images/2018-04-25-Constitutions/apiary-style-guide.png)

## Updates to the Apiary CLI
Constitutions will simplify writing the rules. To allow you better integration of these rules into your API Design flow, we also added the [`styleguide`](https://help.apiary.io/tools/apiary-cli/#using-apiary-style-guide) option to the [Apiary CLI](https://github.com/apiaryio/apiary-client). With it, you can fetch and test your Apiary Style Guides against a local document. 

Next we added `--push` option to the CLI, so you could build rules locally or in your CI and synchronise them with the rules you enabled in [Apiary Editor](https://help.apiary.io/tools/apiary-editor/).

We hope this will make live easier for both Style Guide creators and consumers! For any questions, let us know either on [support@apiary.io](mailto:support@apiary.io) or in [GitHub issues](https://github.com/apiaryio/constitutions/issues).
