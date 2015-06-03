---
title: It's offical! API Blueprint and GitHub
author: zdenek
excerpt: "API Blueprint recognized as a first-class citizen on GitHub"
layout: post
date: 2015-06-03 12:00:00
published: true
comments: true
---

Collaboration and continuous integration are the heart of every good API design. This is why we care about integration with CI services and GitHub. 

Today, I am proud to announce a major milestone for API Blueprint - it's now an official language on GitHub.

To see the true beauty of API Blueprint on GitHib, you'll need to add `.apib` as the extension to your blueprint file and push to GitHub. 

## First-class Citizen

The growth of API Blueprint over the last two years has been tremendous. Since its existence an incredible amount of API developers, consumers, architects and stake holders as adopted API Blueprint. Currently, there are a countless number of blueprints stored in GitHub. And now, you have the ability to search for them and view the beautiful syntax highlighting.

### Repository Statistics

The repository dashboard is one of the places where you're able to view the repository's language statistics for API Blueprint.

<img width="640" src="/images/2015-05-28-API-Blueprint-GitHub/statistics.png" alt="Repo statistics" />

### Language Search

On GitHub every public blueprint gets indexed and is searchable. Simply add `language:API Blueprint` to your search query:

<img width="640" src="/images/2015-05-28-API-Blueprint-GitHub/search.png" alt="Search" />

Note: Unfortunately, it appears that GitHub will only index recently updated blueprints and not automatically index blueprints created in the past.

### Syntax Highlighting

In addition to being searchable, any blueprint file with an `.apib` extension will be displayed with syntax highlighting.

<img width="640" src="/images/2015-05-28-API-Blueprint-GitHub/syntaxhighlighting.png" alt="Syntax highlighting" />

### GFM Fenced Code Blocks

Finally, you can use the `apib` language identifier in GitHub Flavored Markdown code blocks:

<img width="640" src="/images/2015-05-28-API-Blueprint-GitHub/codeblocks.png" alt="GFM" />

## Better API Design Through Collaboration

Now that API Blueprint is recognized by GitHub, this vastly improves the accessibility and readability of other public blueprints. Helping everybody to read, write, share and discuss API design.

Plus, what’s a better way to learn about API design than to read other blueprints?

Isolated API design is hard. So, get out there and start sharing and collaborating with one another to design APIs that last.
