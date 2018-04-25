---
title: Evolving Embed
excerpt: What's new with our Embed feature
layout: post
date: 2018-02-12 08:00:00 +0200
author: char0n
published: true
comments: true
---

During the last couple months, we invested considerable amount of resources to fix most of the pending 
bugs on Apiary Embed feature. We've also introduced a couple of new features like **multiple Embeds support**,
**event hooks** and ability to **programmatically destroy Embeds**.

## What is Embed ?

Embed is a simple JavaScript that you place in an ordinary HTML page. It shows your API Project
hosted on [apiary.io](https://apiary.io/) in an *IFrame* and allows you to customize it with your brand colors.
You can then host this HTML page on your own domain. The end result looks like you are hosting 
your own API Documentation. If you edit your API Project on [Apiary](https://apiary.io), the regenerated
documentation is instantly displayed on your own domain.

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="https://api.apiary.io/seeds/embed.js"></script>
    <script>
      const embed = new Apiary.Embed({
        subdomain: 'your-api-project-subdomain',
        element: '.container',
        preferences: {
          permalinks: true,
        },
      });
    </script>
  </head>
  <body>
    <div class="container" style="width:100%; height: 900px"></div>
  </body>
</html>
```

For more information about Embed, please visit the [Embed reference documentation](https://help.apiary.io/tools/embed/).

## Bug fixes

Our bug fixes are mainly concentrated around [permalinks](https://help.apiary.io/tools/embed/#allow-permalinks-into-the-embed)
and [theming](https://help.apiary.io/tools/embed/#theming). We went through majority of the 
[elements we support](https://help.apiary.io/tools/embed/#elements), tested them and fixed the non working ones.


## New Features


### Multiple Embed support

Previous versions of Embed did not support placing more that one Embed in a HTML page.
You can now pace multiple Embed elements in a single HTML page.

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="https://api.apiary.io/seeds/embed.js"></script>
    <script>
      const embed1 = new Apiary.Embed({
        subdomain: 'your-api-project-subdomain',
        element: '.container1',
        preferences: {
          permalinks: false,
        },
      });

     const embed2 = new Apiary.Embed({
        subdomain: 'your-api-project-subdomain2',
        element: '.container2',
        preferences: {
          permalinks: false,
        },
      });
    </script>
  </head>
  <body>
    <div class="container1" style="width:100%; height: 900px"></div>
    <div class="container2" style="width:100%; height: 900px"></div>
  </body>
</html>
``` 

### Event Hooks

Embed instances provide event hooks. It is now possible for example to implement a loading indicator that will
show a spinning wheel while the documentation is loading.


```js
const embed = new Apiary.Embed({
    subdomain: 'pollsapi',
    element: '#embedHere'
});

embed.onLoaded(function (iframeElement, event) {
 // manage your loading indicator here
});
embed.onReady(function (iframeElement, event) {
  // manage your loading indicator here
});
```


Event hooks can also be un-subscribed. Every subscription returns a function. 
When subscribing to an event, a function is returned which can be used to unsubscribe the registered hook handler. By calling the returned function, the event is unsubscribed immediately.

```js
const embed = new Apiary.Embed({
  subdomain: 'pollsapi',
  element: '#embedHere',
});

const unsubscribe1 = embed.onReady(function (iframeElement, event) {
  // manage your loading indicator here
});
const unsubscribe2 = embed.onReady(function (iframeElement, event) {
  // manage your loading indicator here
});
  
// un-subscribes subscription(1)
// subscription(2) is still active
unsubscribe1();
```

For more information about event hooks please refer to our [event hook documentation](https://help.apiary.io/tools/embed/#event-hooks). 


### Destroying embeds
 
Embed instances can be destroyed. Destroying restores the `element` to the state before Embed was initialized.

```html
<div id="embedHere"></div>

<script>
  const embed = new Apiary.Embed({
    subdomain: 'pollsapi',
    element: '#embedHere'
  }); 
  
  // destroy the embed some time later
  embed.destroy();
</script>
```


