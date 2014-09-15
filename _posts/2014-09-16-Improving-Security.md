---
title: "Improving Security of Mock and Proxy Servers and Deprecating Old Subdomains"
excerpt: "Apiary has delivered important new features to increase the security of recorded traffic from Mock and Proxy Servers. We’re deprecating the unsafe Public Traffic option and making some backward-breaking changes, while leaving your API documentation more accessible than ever."
layout: post
date: 2014-09-16 02:00:00 +0200
author: lukas
published: YES
comments: true
---

Apiary’s **Mock and Proxy Servers**, in connection with **Traffic Inspector**, are valuable tools in identifying problems with API usage. Up until now, to offer those as part of your API documentation, you had two options -- ask your users to create an Apiary account or switch off the **Private Traffic** setting, where no authentication was required for the mock and proxy server URL space.

## Ease of Use vs Security

This was a trade-off: an API would gain greater discoverability, but the details of debugged API calls were left publicly available. If a user’s production token was accidentally used in testing the API, production data could potentially be exposed to anyone viewing the Traffic Inspector.

## Changes to Improve Security

Earlier this year, we made Private Traffic on by default. However, room was left for human error if a user switched off Private Traffic by accident or without fully understanding it's working and the ramifications of doing so.

We find risk to production API tokens **unacceptable**. As a result, we have worked hard to rectify this behavior and last week finally removed the need for an Apiary account in order to use Private Traffic. Any Apiary mock/proxy user—**logged in or anonymous**—gets assigned a unique, personal URL when they visit our documentation for the first time.

With such a feature in place, we are now **deprecating the "Public Traffic" option** completely to remove this potential security risk. You are now encouraged to switch to "Private Traffic" immediately in your API settings. Otherwise, we are going to migrate all accounts permanently to "Private Traffic" starting October 1st.

## Important URL changes

As part of generating unique URLs for each documentation viewer, we’ve had to redesign the related URL space for these. Your documentation users have been receiving the new-style URLs for a while now. However, if your application is relying on/proxying through the **&lt;apiname&gt;.apiary.io** address space, you need to update it now (or preferably remove the dependency altogether) to use our new address space at apiary-mock.com and apiary-proxy.com.

Starting October 1st, the **&lt;apiname&gt;.apiary.io** URL space will be returning a 301 MOVED PERMANENTLY HTTP response.


If you have any questions, you are -- as always -- welcome to ask them at support@apiary.io.
