---
title: "Shellshock Bash Security"
excerpt: "Securing customer data at Apiary"
layout: post
date: 2014-10-07 13:50:00
author: neha
published: yes
comments: true
---

The recent announcement of the Shellshock bug [CVE-2014-6271][], followed by [CVE-2014-7169][] had raised concerns about security of customer data.

At Apiary, we are pleased to announce that we do not have any GNU Bash-run service. We have also checked all our service providers who have anything to do with customer data and have confirmed that neither of them run any service by GNU Bash. Therefore, we are sure that there is no security flaw to be exploited in our system.

Apart from that, we have also updated all local `/bin/bash` binaries found on our systems and checked with our service providers that they did the same.

Security is important to us and we have taken all necessary steps to make sure there are no flaws.

You can [Read more][] about this bug.

[CVE-2014-6271]: https://bugzilla.redhat.com/show_bug.cgi?id=1141597
[CVE-2014-7169]: https://securityblog.redhat.com/2014/09/24/bash-specially-crafted-environment-variables-code-injection-attack/
[Read more]: https://www.troyhunt.com/2014/09/everything-you-need-to-know-about.html
