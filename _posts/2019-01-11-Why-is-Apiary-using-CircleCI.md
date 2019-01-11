---
title: Why is Apiary using CircleCI?
excerpt: We start using CircleCI in 2012. This is our experience with them in last 7 years.
layout: post
date: 2019-01-31 00:00:00 +0100
author: abtris
published: true
---

Apiary using multiple Continuous Integration Engines (CIE). For example our testing tool [Dredd](https://dredd.org/en/latest/) using [TravisCI](https://travis-ci.org/) for support multiple version Node.JS and [AppVeyor](https://www.appveyor.com/) for support Windows.
We are using for few projects [Wercker](https://www.oracle.com/corporate/acquisitions/wercker/) that support our Oracle Managed Kubernetes for running our workload.


Our stack is based on Node.JS but we are using many others languages as CPP, Python, Ruby and Go. We are using Git as source control management.  Team is about 25 engineers across 100 projects. In my post I will focus on biggest project in Apiary that is big monolith app in Node.JS with external services using FaaS (AWS Lambda).

We started in 2012 using [CircleCI](https://circleci.com/). In 2015 we start using parallelism for tests. Initially with 2 nodes and now we are using 8 containers. In 2016 we move our testing on Docker for better isolation. In 2017 with start using [CircleCI 2.0](https://circleci.com/blog/say-hello-to-circleci-2-0/) (docker native).

![](/images/2019-01-11-Why-is-Apiary-using-CircleCI/apiary_timeline_small.jpg)


## What do you need from your CIE?

My point of view to CIE is always about these main points:

1. Fast
2. Reliable
3. Scalable
4. Maintenance costs


## 1. Fast

First, are you thinking about your builds? Try answer to a few my questions in your head.

- Do you know your time to deploy?
- Do you know how much time is spent in queue?
- What is the maximum acceptable time for your build (5, 15, 30 min, 4h)?
- Do you monitor those times or just guessing?

In 2016 we had problems with speed of our test suite. As you can see on graph our test suite in that time start 28 min in May and end 50 min in Nov. This caused multiple problems and mood in team wasn't so good. People start ignoring flaky tests and just making retries. Time to deploy was horrible and we can't deploy as fast we can.

![](/images/2019-01-11-Why-is-Apiary-using-CircleCI/buildtimes.png)

We create engineering project that solve this problem. We start with these main points:

- Awareness
- Groups
- Parallelism

How we can easy get better results. We add more money and using more parallelism into tests in that time we go from 4 containers to 8 containers and start using 33 containers in CircleCI. We create own tool [Testmon](#Monitoring - Testmon) that can trigger Nightly build and collect metrics from builds, create reports that we are using in office to better visibility of problems. All metrics are pushed into our monitoring and we alerting on possible problems using PagerDuty and creating incidents for solving problems.

On graph you can see how split tests into groups. For longest tests and not often changed parts we moved into nightly. And master test suite we split into 8 containers. For autobalancing we using Testmon that calculate every day test suite configuration using [LPT algorithm](https://en.wikipedia.org/wiki/Multiprocessor_scheduling#Algorithms).

![](/images/2019-01-11-Why-is-Apiary-using-CircleCI/timing_small.png)

CircleCI have own metrics called Insights. You can see that isn't helpful for making decisions. You can see times for last 3 months but you can't introspective and you can't easy modify for your use case.

![](/images/2019-01-11-Why-is-Apiary-using-CircleCI/circleci-insights_small.jpg)

That why we are using Testmon for collection these metrics:

- `ci.<APP_NAME>.overall_time` - Duration of whole CI run since submission
- `ci.<APP_NAME>.build_time` - Duration of job run
- `ci.<APP_NAME>.queue_time` - How long this job was queued before run
- `ci.<APP_NAME>.cumulative_time` - Sum of all containers `build_time`
- `ci.<APP_NAME>.cumulative_test_time` - Sum of all test running times
- `ci.<APP_NAME>.build_time.containerX` - `build_time` on container X
- `ci.<APP_NAME>.test_time.containerX` - test running times on container X
- `<APP_NAME>.eslint_errors`

and tags:

- success
- failed
- canceled
- timedout
- infrastructure_fail
- retry
- master

All times are in seconds unless stated otherwise.

We get data from out tests created by [test reporter](https://github.com/michaelleeallen/mocha-junit-reporter) in [junit](https://junit.org/) format.

Testmon using junit data with metrics to create dashboards as on next screenshot:

![](/images/2019-01-11-Why-is-Apiary-using-CircleCI/long-running-dashboard_small.jpg)

and generate full report too:

![](/images/2019-01-11-Why-is-Apiary-using-CircleCI/long-running-full-report-05-2018_small.jpg)


## 2. Reliable

As I was mention in previous section. In 2016 we had problem with time how long we running tests. Test suite had problem with reliability too. We had many flaky tests. We lived with flaky tests and that had horrible impact to team. Team developed notification fatigue to flaky tests. People instead focus on fixing problem just make retries.

To solve reliability problem we use similar approach as for long tests:

- Detect flaky tests (2 builds with 1 git hash)
- Awareness (dashboards, metrics)
- Process
- Consistency

We created report for flaky tests. That will help with awareness of problem but main thing is change process how behave with problem.

![](/images/2019-01-11-Why-is-Apiary-using-CircleCI/flaky-full-report_small.jpg)

We change process with how manage tests. First, we work with responsibility. Every test and helper needs to be clearly assigned to some team so in case of issues the team can be reached. Second, we adjust how maintenance. There's a team responsible for every test, so flaky and long running tests can and should be a part of the sprint work.


From our experience is very big difference between build time and cumulative time. As you can see on screenshot:

![](/images/2019-01-11-Why-is-Apiary-using-CircleCI/datadog-ci-cumulative-time-1y_small.jpg)

I think that is caused by shared hardware used in CircleCI. We working with Wercker where we can use our [Oracle Container Native Services](https://cloud.oracle.com/en_US/containers).

## 3. Scalable

Are you thinking about your scalability? Try answer to a few my questions in your head.

- How long are people waiting for CI results?
- Can you run your tests in parallel?
- Can you add 10 developers into team and time to deploy will stay the same?
- How much does your build infrastructure cost?
- Do you have budget for build/test infrastructure?

We always looking at problem from perspective add more people into team and impact to their work. You can see from screenshot that time that you waiting in queue is minimal and only in some part of year we have longer time.

![](/images/2019-01-11-Why-is-Apiary-using-CircleCI/datadog-ci-queue-time-trend-1y_small.jpg)

We focus be able deliver fast and safe as possible. You can see on screenshots that last year we have good trend and average time going down or is stable.

![](/images/2019-01-11-Why-is-Apiary-using-CircleCI/datadog-ci-build-time-master-1y_small.jpg)



![](/images/2019-01-11-Why-is-Apiary-using-CircleCI/datadog-ci-container-time-trend-1y_small.jpg)



## 4. Maintenance costs

Fourth important thing is costs. I'm looking on operations costs. I don't calculate costs for tests maintenance. This costs are included in development itself.

Your costs are different by type of your CIE:

- SaaS (Circle, flat fee: $50 per container, dedicated support)
- OnPremise (Jenkins master + workers)
- Hybrid (Wercker, use managed K8S cluster for workers)
- Combinations (JenkinsX, Gitlab, ...)

On SaaS solution is nice that you have flat price and this solution is very good for startups. If you get free credit on cloud provider you can spare money using hybrid solution that you can combine credits for running instances.

## Summary

I think every team have different approach to CIE problems and we are lucky that you have many tools that you can choose. For OSS is always favorite of ours TravisCI. I like that we can support Windows users using AppVeyor that was big problem in years before this CIE for OSS projects.

We was very satisfied using CircleCI and if we migrate to another solution for be on some page with others team we get this approach and try monitoring everything important for us. Always is important getting data and don't hesitate add CIE metrics to your production monitoring. If something doesn't work on your CIE that can incident as in production.
