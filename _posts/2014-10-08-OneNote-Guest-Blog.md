---
title: Working with Apiary
author: nick
excerpt: "Our first guest blog from Nick Barnwell working at Microsoft OneNote team. Read about their experience with Apiary"
layout: post
date: 2014-10-09 08:50:00
published: yes
comments: true
featured: true
---

From its inception the [OneNote API][dondc] team has been committed to
delivering developers a modern, first-class developer experience. Ardent
admirers of [Stripe][stripe], [Twilio][twilio], and [Akamai's][akamai-apiary]
intuitive APIs and documentation, we were keen to provide a similar experience
when we launched our [completely redesigned developer portal][dondc].

![OneNote](/images/2014-10-08-OneNote-Guest-Blog/OneNote.png)

Thus, began our search for an API design and documentation solution that:

* Offered developers fantastic documentation and an interactive console
* Worked with tools we already know and use daily, like [pandoc][] and [git][]
* Was extensible, open, and standards-based, should we need to suggest
  enhancements or build out features specific to our requirements.

In the course of our investigation we tried just about every solution on the
market before coming across Apiary. The quality of the generated
documentation, the flexibility of the API Blueprint format, and the small touches
like the Traffic Inspector and GitHub syncing got us interested. The bevy of
[tools they offer to developers][apiary-gh] and their willingness to accept
[pull requests][apib-prs] sealed the deal.

With a decision made, adopting Apiary was a breeze. We were able to setup our
team on GitHub and use a standard code review process to audit changes and
ensure all of our reference materials were correct as we ported from our former
documentation host. Our new developer portal, which prominently features the new
reference documentation, launched on the 15th September and has been a huge
success with our customers, in no small part due to Apiary.

Long story short: we've since recommended Apiary to several other teams at
Microsoft and look forward to continuing our partnership as we strive to give
developers the thoughtfully designed APIs and documentation that they deserve.

[dondc]: https://dev.onenote.com/
[stripe]: http://stripe.com
[twilio]: http://twilio.com
[akamai-apiary]: https://developer.akamai.com
[apiary-gh]: https://github.com/apiaryio
[apib-prs]: https://github.com/apiaryio/api-blueprint/pulls?q=is%3Apr+is%3Aclosed
[pandoc]: http://johnmacfarlane.net/pandoc/
[git]: http://git-scm.com/
