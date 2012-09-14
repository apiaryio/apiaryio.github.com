---
title: Collaborating Through GitHub
excerpt: One of our most popular feature requests is **collaboration among multiple users**. Here's how you can use our GitHub integration to do that
layout: post
published: false
---

# Collaborating Through GitHub

One of our most popular [feature requests](https://apiary.uservoice.com/forums/120125-general/suggestions/3003895-share-one-api-among-several-users) is **collaboration among multiple users**. We hear you and we're working on it, but it will take time —we want to get the collaboration model right. However, that doesn't mean you can't start collaborating with your colleagues on your API design right away. We [launched our GitHub integration](http://blog.apiary.io/2012/05/21/to-our-wonderful-beta-testers/) a couple months back. Here's how to use it to your advantage!

1. Go to your [Settings page](https://apiary.io/settings) and connect Apiary to any of your GitHub repositories
2. You can use both public and private repositories, we recommend to use a public one (unless your documentation is hidden from the world):

     ![Github Repos Association](/images/2012-09-13-github-repos.png)

3. Once you connect your GitHub repo, we automatically synchronize your API Blueprint into GitHub.
4. You can now edit the blueprint on your local computer, push it into GitHub&mdash;and your documentation changes instantly. We receive webhooks from GitHub and scan for changes to the API Blueprint.
5. You can cooperatively edit with everybody, and let Git take care of the merging and versioning.
    
> **Note:** From now on, your repository is the source of authority—any changes you make directly in Apiary will be overwritten during your next push to GitHub

6. To simplify the edit-preview-commit-push cycle of the git workflow, we've created an [Apiary Ruby Gem](https://github.com/apiaryio/apiary-client) to help you preview the documentation before pushing to GitHub. Just run:

        sudo gem install apiaryio
        <...go to your blueprint directory...>
        apiary preview
        <...generates and previews your documentation...>
    
    You can also just run `--help` to get a list of all commands:
    
        $ apiary --help
        
        Usage: apiary command [options]
        Try 'apiary help' for more information.

        Currently available apiary commands are:

           preview                                     Show API documentation in default browser
           preview --browser [chrome|safari|firefox]   Show API documentation in specified browser
           preview --path [PATH]                       Specify path to blueprint file
           preview --api_host [HOST]                   Specify apiary host
           preview --server                            Start standalone web server on port 8080
           preview --server --port [PORT]              Start standalone web server on specified port

           help                                        Show help

           version                                     Show version
        

> We're also working on syntax highlighting for your editor&mdash;[let us know](mailto:support@apiary.io) which editor you're using!
