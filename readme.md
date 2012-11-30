## What is Quoty?
**Quoty** - A place where people can share and save the most touching and inspiring quotes or words, in a *modern* way.

One of my hobby projects build with Rails, deployed on [Heroku](http://quoty.herokuapp.com/), try it.

## The Vision ##

### The Problems
If you search for any famous quotes on google, you may find lots of  sites with disturbing ads, messy layouts, unreadable fonts. Once you looked, closed the tab, and that's it. Nothing more happens.

### What I want to create ###

Quoty, well it's still a temporary name, doesn't aim to be the biggest quotes website. Instead, I want to create a community who loves the essence of human intelligence, which I believe is our language, the words, quotes, conversations, or even jokes. Besides those quotes from some "Big Giants", not trying to deny them here but they are not a MUST condition to make a quote classic and lasts forever, our parents, friends, wife/husband, anyone can say something very touching, warming words. **If there is a story about it, if it means something to you and you really want to "save" that moment, I hope you can find here is the right place. At least that's what I'm trying to build.**

So the general/traditional quotes are really not everything here. Tweets, video clips, lines from some movies, words from friends or family members, just post it. I'll try to find the right way to keep the original taste and flavour. And that's why I said Quoty is a temporary name, because it emphasize "quotes" too much.

Oh I won't put any ads on it. Try to make it clean and simple. A peaceful place. (I may need some design help to really create the visual feelings about it.)

## Requirements ##

- Rails 3.2+
- Ruby 1.9.3+
- RVM

## Installation ##

In most cases:

```
git clone git@github.com:kinopyo/quoty.git
cd quoty
bundle
rake db:setup
rails s
open "http://localhost:3000"
```

If you need twitter or facebook integration, you have to setup your own keys to `config/initializers/omniauth.rb`.

## TODO ##
https://www.pivotaltracker.com/projects/697543
