---
title: Creating reusable features in React + Redux
excerpt: How to create standard and reusable features in React + Redux
layout: post
date: 2018-02-12 08:00:00 +0200
author: char0n
published: true
comments: true
---

I’ve started writing applications in React and Redux more than two years ago. Since then it has changed the way I think.
It introduced me to the concepts of Functional and Reactive programming 
and showed me how easy and maintainable the development of a large scale Single Page Applications can be.
The nightmare of state management became a delightful experience and after I started handling my side effects
with [redux-observable](https://redux-observable.js.org/) it has really become something special.

Today I’d like to talk about how to create features in React+Redux application in standard
and prescribed way. What do I mean by standard and prescribed ? Applying the same patters/rules
over and over so that every part of the codebase looks the same regardless whether
it was written by *Developer1* or *Developer2*.

For the purpose of this article, I’ve implemented all the patterns that we will be talking about in this [repository](https://github.com/char0n/react-reusable-features). 
Feel free to clone it and then run it using **npm run start**. I will start by explaining how I approach 
implementing **standard react features**. Later we’ll cover creating reusable feature instances which 
can be mounted with different state at different locations. I call these features **reusable features**.

## Standard features

You can imagine a standard feature as a directory that lives in your codebase. 
I will demonstrate what a standard feature is in an example Todo List. 
The standard feature directory has a prescribed structure that usually looks like this:

```
src/
 todo-feature/
   components/ 
     TodoList.js     
     TodoListItem.js
   containers/
     TodoList.js  
     TodoListItem.js
   action.js
   reducers.js
   selectors.js
   utils.js
   middleware.js
```   

#### components/

The directory where your components live.

#### containers/

The directory where your containers live. If you don’t know what is the difference between the components 
and containers you should read [this article](https://medium.com/@dan_abramov/smart-and-dumb-components-7ca2f9a7c7d0)
from Dan Abramov why this separation exists and why it is necessary.

#### actions.js

The file where your [action types](https://redux.js.org/docs/basics/Actions.html#actions) and
[action creators](https://redux.js.org/docs/basics/Actions.html#action-creators) are defined.


#### reducers.js

The file where your [reducers](https://redux.js.org/docs/basics/Reducers.html) are defined. 
This is also a place where you compose the reducers of your possible sub-features using [combineReducers](https://redux.js.org/docs/api/combineReducers.html).


#### selectors.js

The file where you define your selectors. Selectors are pure functions that compose and know how
to retrieve data from your state. If you’re not familiar with the concept, I highly recommend looking 
at the [reselect](https://github.com/reactjs/reselect) library. I strongly recommend dividing the selectors into two categories. 
*Input selectors* that only retrieve data from the state and *combined selectors* that can combine
multiple input-selectors and add some business logic or do some transformations.


#### utils.js

Everything related to your feature that doesn’t belong anywhere else. Usually it contains support utilities and helpers.

#### middleware.js

This is where our feature handles its side effects, such as catching some Redux actions and dispatching new ones,
synchronize the API calls, etc...

You can check the [reference repository](https://github.com/char0n/react-reusable-features/tree/master/src/app/standard-feature) to see how this looks in a real project. 
What the standard feature directory contains will depend on your use case.
There are situations that you may need reducers but don’t need actions and so on.
Regardless, the full representation of the standard feature should look like the one described below this paragraph. 
If the number of components in the standard feature becomes too big, you should break the feature into separate sub-features. 
These sub-features should adhere to the same rules as its parent feature.


```
src/
 todo-feature/
   components/ 
     TodoList.js
   containers/
     TodoList.js
   todo-item/
     components/
       TodoListItem.js
     containers/
       TodoListItem.js
     actions.js
     selectors.js 
   action.js
   reducers.js
   selectors.js
   utils.js
   middleware.js
```


It is always good to break features into smaller sub-features with encapsulated logic to reduce the complexity.
Try to think of it as applying The Single Responsibility Principle. 
Each feature only does one thing, and it is isolated in its own directory.
As you applications grows and you add more and more features, 
it really pays of to structure your code using these rules. Somebody that will come to work on a project after
you will really thank you ;]

The standard feature has unfortunately one disadvantage. It is statically mounted at a specific place in a state. 
Imagine a situation when you want to display two Todo Lists on the same page.
If you do that, it will work and the Todo Lists will display. The problem arises when you try to interact with them. 
Changing state in one, for example marking an item as done, or re-ordering the items, will cause the items in the second list to be updated.
The cause of this effect is the fact that they are both focused on the same place in the Redux state and 
act accordingly based on Redux state changes. You may never experience this situation, it really depends
on the type of the application you are building and the use cases. If you do, there is a solution.
Enter the realm of **reusable features**.

## Reusable features

[Some people](https://kickstarter.engineering/namespacing-actions-for-redux-d9b55a88b1b1) have already dealt with this problem. My solution is a little bit different but
at the end we’re trying to solve the same thing. So what is a **reusable feature** ?
It’s basically a standard feature but instead of things defined statically, everything (except components)
are defined inside **factory functions**. Factory functions allow us to create things in a lazy configurable manner.
Observe, for example, the difference between standard feature actions and reusable one.


#### Standard feature actions.js

```js
const STANDARD_FEATURE_INCREMENT_CLICK = `${namespace}_STANDARD_FEATURE_INCREMENT_CLICK`;

export const incrementClick = createAction(STANDARD_FEATURE_INCREMENT_CLICK);
```
     
#### Reusable feature actions.js

```js
export default function createActions(namespace, selectors) {

  const REUSABLE_FEATURE_INCREMENT_CLICK = `${namespace}_REUSABLE_FEATURE_INCREMENT_CLICK`;

  const incrementClick = createAction(REUSABLE_FEATURE_INCREMENT_CLICK);


  return {
    REUSABLE_FEATURE_INCREMENT_CLICK: REUSABLE_FEATURE_INCREMENT_CLICK,

    incrementClick,
  };
}
```

And that’s it. You define everything inside these factory functions. 
At this stage the reusable feature acts as a mere template. Check how the full
implementation of a [reusable feature looks](https://github.com/char0n/react-reusable-features/tree/master/src/app/reusable-feature) in our [reference repository](https://github.com/char0n/react-reusable-features).
Features like these cannot be used and mounted to your React application.
You have to create an **instance** from it.

Creating an instance is as easy as calling the factory functions defined in the reusable feature template.
Again we adhere to the same rules about directory structure and file names as we did for standard features
and reusable feature templates. To see how instances are created from the templates please refer 
to the [reference repository](https://github.com/char0n/react-reusable-features) where we create [instance-1](https://github.com/char0n/react-reusable-features/tree/master/src/app/reusable-feature-instance-1) and [instance-2](https://github.com/char0n/react-reusable-features/tree/master/src/app/reusable-feature-instance-2) from our reusable [feature template](https://github.com/char0n/react-reusable-features/tree/master/src/app/reusable-feature).
Describing it here in code examples will really be out of scope of this article. 
Now if you mount these two instances into the React application they work completely independently,
one doesn’t interfere with another, but they share the same code.
And that’s the most important point about reusable features: write once, but use many times...
 
One last note about React+Redux: Even if you are currently using another framework or library like Angular or Vue,
I think it’s important to understand how React and Redux work and how they changed the development of Single Page Applications.

Like always, I end my article with the following axiom: Define your code-base as pure functions and
lift them only if needed. And then compose, compose, compose...


PS: I’d like to thank to Kyle Fuller for proofreading this article.