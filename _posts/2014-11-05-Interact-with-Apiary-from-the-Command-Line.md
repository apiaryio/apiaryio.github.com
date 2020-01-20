---
title: Interact with Apiary from the Command Line
excerpt: Use our CLI tool to preview, fetch, and publish your API Blueprints
layout: post
date: 2014-11-05 00:00:00 -0600
author: stephen
published: true
comments: true
---

We thought we'd put together a blog post to highlight another way for you to work with Apiary, and that is through using our [Apiary CLI tool](http://client.apiary.io/). Everyone has their own workflow, and sometimes that workflow involves their favorite editor and the command line. This Apiary CLI tool can allow you to stay in that workflow while interacting directly with Apiary through our [API](http://apiary.docs.apiary.io/).

## Previewing Locally

With the Apiary CLI tool, you can [preview](http://client.apiary.io/#preview) what your API Blueprint would look like on Apiary while working in your favorite editor.

~~~shell
apiary preview --server
~~~

By default, this is going to be looking in the current directory for an API Blueprint file named `apiary.apib`, which can be changed with the `--path` flag. Every refresh of the page will send your API Blueprint to Apiary to be rendered and sent back to you.

This is great for allowing Apiary to be part of your current workflow without requiring you to use our editor, and since you see exactly what we generate, you know your changes will be right when you publish them.

## Fetching from Apiary

To make this work even better with your workflow, you can also [fetch](http://client.apiary.io/#fetch) and [publish](http://client.apiary.io/#publish) your API Blueprints. If you have existing documentation at Apiary, you can easily grab that document for developing and previewing locally.

~~~shell
apiary fetch --api-name=API_NAME
~~~

This command grabs the published documentation and saves it as `apiary.apib`.

## Publishing to Apiary

Once you've made your changes and previewed how they look locally, you can publish those changes directly to Apiary with another simple command.

~~~shell
apiary publish --api-name=API_NAME
~~~

No need to copy and paste to Apiary–just publish your changes and keep working.

## Conclusion

The goal with this is to make your life easier by providing tools that can fit directly into your workflow. The Apiary CLI tool is [open source](https://github.com/apiaryio/apiary-client), and we are always interested in pull requests. Additionally, if you have any thoughts on ways to make this tool even better, please let us know!
