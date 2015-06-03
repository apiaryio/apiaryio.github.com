---
title: API Blueprint on GitHub
author: zdenek
excerpt: "API Blueprint language as a first-class citizen on GitHub"
layout: post
date: 2015-06-03 09:10:00
published: true
comments: true
---

Collaboration and continuous integration are the heart of every good API design. This is why we care about integration with CI services and GitHub. I am happy to announce the major milestone for API Blueprint.

API Blueprint is now recognized as a language on GitHub!

All you need to do is to append the `.apib` extension to your blueprint file and push it to GitHub.

## First-class citizen

The growth of API Blueprint over the two years of its existence was tremendous. Adapted by an incredible amount of API developers, consumers, architects and stake holders alike. Today, there are countless number of  blueprints is stored in GitHub. And now, you can search for and see them syntax highlighted!

### Repository statistics

The first place where you can see API Blueprint language is the repository dashboard. API Blueprint now figures in the repository's language statistics:

<img width="640" src="/images/2015-05-28-API-Blueprint-GitHub/statistics.png" alt="Repo statistics" />

### Language search

On GitHub every public blueprint gets indexed. This enables a search for indexed blueprints. Just add `language:API Blueprint` to your search query:

<img width="640" src="/images/2015-05-28-API-Blueprint-GitHub/search.png" alt="Search" />

Note: GitHub seems to index only new pushes. Only recently updated blueprints get indexed. Unfortunately GitHub does not back fill indexes for blueprints created in the past.

### Syntax highlighting

Blueprints with `.apib` extension are now syntax highlighted on GitHub too:

<img width="640" src="/images/2015-05-28-API-Blueprint-GitHub/syntaxhighlighting.png" alt="Syntax highlighting" />


### GFM Fenced Code Blocks

Finally, you can use the `apib` language identifier in GitHub Flavored Markdown code blocks:

<img width="640" src="/images/2015-05-28-API-Blueprint-GitHub/codeblocks.png" alt="GFM" />

## Better API Design through Collaboration

API Blueprint recognized by GitHub improves readability and accessibility of  API designs. Helping everybody to read, write, share and discuss API blueprints.

And what is a better way to learn about API design but reading other blueprints?

Let me know how this works for you!
