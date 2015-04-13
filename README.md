[![Build Status](https://travis-ci.org/duykhoa/loving-story.svg?branch=master)](https://travis-ci.org/duykhoa/loving-story)

# README

[![Join the chat at https://gitter.im/duykhoa/loving-story](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/duykhoa/loving-story?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

#### Requirement
1. Rails 4.2rc1
2. Ruby 2.2-head
3. Postgres 9.3
4. Rmagick

#### Install
1. Git ``clone``
2. ``bundle install``. If get an error message, configure 3 files
  - config/application.yml
  - config/dropbox.yml
  - config/database.yml
  and re-bundle
3. rake db:bootstrap to bootstrap your database
4. follow paperclip-dropbox to add dropbox credential (if you are sys-admin)
5. spring rails s (or create binstubs - up to you).

#### How it work?
The concept is very basic. Go to the homepage, pick a template, filling information and tada.
We give you a website under domain *.4ever.tenluaweb.com. Look awesome, huh?

Your website is about your love story, with count up lock, your header photos (wow!!), your avatars, your album
You can show people your story, how you meet together, your cool timeline, the first kiss ^^
And your friend can send you some complement and best wish via facebook comment, share and like.

#### Copyright by TenLuaWeb 2015. Bug and issue are welcome!

#### Director: Khoa Tran ([github.com/duykhoa](github.com/duykhoa))

#### Want to contribute? Fork it, and write some codes, create a pull request, we will review and merge! Welcome to join!

