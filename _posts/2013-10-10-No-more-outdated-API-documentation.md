---
title: No more outdated API documentation!
excerpt: "Write blueprints and let Dredd do his job"
layout: post
date: 2013-10-10 21:00:00 +0100
author: netmilk
published: YES
---

Your API is only as good as its documentation. API Documentation is a must for any public API and a need for you private APIs. To have always valid documentation is a holy grail for any API owner. That is why I'm very excited to announce the release of the **[Dredd][] command-line test runner for [API Blueprint][]**.

![Dredd](http://blog.apiary.io/images/Dredd.png?1)

## Write blueprints!

OK, we want the always up-to-date documentation. What would be the first thought? Why not generate an API documentation from the code? **Naughty, naughty! Bad idea!**

Write a blueprint! When you generate docs from the code you are creating ad-hoc rules inferred from code, without actually getting any valuable feedback. Don't be arrogant when you can be generous.

API Blueprint is a contract with the consumers of your API. You can publicize or even open-source your API Blueprint and boldly invite anybody to the design process of your API. That backend guy, your frontend coder, mobile developers and your customers in the first place. They don't need and often don't want to know what's under the hood. API Blueprint is a language agnostic, human readable format to discuss things about web APIs.

You don't need to know anything about programming to contribute to the discussion. Don't hesitate to invite even your UI designer to the table. He or she will surely feel comfortable at the table, and believe me, you will definitely get some spot-on comments. Simply because this approach is natural in the non-development environments.

Writing API Blueprint is like making wireframes. Wireframes are often called mocks, aren't they? Don't be surprised, [Apiary][] will generate a working mock server from your API blueprint. It means **you can start hacking against your future API** immediately.

Can you imagine this open discussion with your `/app/controllers` folder on the table?!? Do you feel how open the philosophy of API Blueprint and Apiary is? The iterative collaboration around API Blueprint ensures the best possible feedback and API design. It lets you create beautiful APIs which are truly consumable and competitive.

## Let Dredd test your documentation

I have promised always up-to-date API documentation. You might think that to not generate documentation from the code and thus decoupling the API documentation from the implementation is unnecessary overhead. But it is not. Here comes [Dredd][].

Dredd is a command-line test runner for testing of your backend API application on the HTTP layer. **Dredd enables documentation-driven development and test-driven development of your APIs.**

    $ npm install -g dredd
    $ dredd ./apiary.apib http://localhost:3000
    Machines > Machines collection > Create a Machine > :
      POST /machines "{\n  \"type\": \"b...
      PASS
    $ echo $?
    0


Testing API Blueprint amplifies the contract benefits. When you negotiate a change in the contract tests will fail until your implementation is in accordance with the documentation. Similarly, should you rename a key in an HTTP response JSON you have to discuss it with the contract to make the tests pass.

Next: [Howto test REST API with API Blueprint and Dredd][howto] 

[howto]: http://blog.apiary.io/2013/10/17/How-to-test-api-with-api-blueprint-and-dredd/
[Apiary]: http://apiary.io
[Readme]: https://github.com/apiaryio/dredd-example/blob/master/README.md
[code]: https://github.com/apiaryio/dredd-example/blob/master/app.coffee
[blueprint]: https://gist.github.com/netmilk/6885268
[documentation]: http://docs.dreddexample.apiary.io/
[mock]: http://docs.dreddexample.apiary.io/traffic
[dredd-example]: git@github.com:apiaryio/dredd-example.git
[Express.js]: http://expressjs.com/
[issues]: https://github.com/apiaryio/dredd-example/issues
[support]: mailto:support@apiary.io
[Dredd]: https://github.com/apiaryio/dredd
[API Blueprint]: https://apiblueprint.org/
[Travis-CI]: https://travis-ci.org/
[Codeship]: https://www.codeship.com/
[Teamcity]: http://www.jetbrains.com/teamcity/
[Circle-CI]: https://circleci.com/
[Jenkins]: http://jenkins-ci.org/
[Hudson]: http://hudson-ci.org/
[Atlassian Bamboo]: https://www.atlassian.com/software/bamboo
[Semaphore]: https://semaphoreapp.com/
[Node.js]: http://nodejs.org/
[NPM]: https://npmjs.org/
[NVM]: https://github.com/creationix/nvm
