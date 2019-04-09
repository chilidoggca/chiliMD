# chiliMD
http://chilimd.jackclee.com

## Description
In today's age of "fake news", credible and easy information sharing is more important than ever.  chiliMD is a user-driven educational platform that enhances open and credible information-gathering, information-sharing, collaborative peer-review, and makes citing references a snap.

## Features
- OAuth sign-up with facebook or google.
- Create posts. Attach media files to your posts. Easily cite your sources using DOI (digital object identifier).
- Upload media files.
- Search by post, media type, tags, etc.
- Add content to your review list.

## Screen Shots
![chiliMD Edit Post](/public/screenshot-3.jpg)
A powerful WYSIWYG Editor makes creating content easier.

![chiliMD Add References](/public/screenshot-4.jpg)
Easily add references to posts with DOIs.

![chiliMD Search Feature](/public/screenshot-5.jpg)
Responsive and powerful search feature by posts, media types, tags or users.

![chiliMD Review List](/public/screenshot-1.jpg)
Users can add content to their list for later review.

## Installation and Setup
* Simply clone this repo, run `bundle`, `rails db:create`, then run `psql chilimd_development < chilimd_backup.sql`. Finally, run `rails s`.
* You may need to brew install minimagick if you do not have it installed locally, or the image thumbnails will not work.
* You will need your own developer app keys from facebook and google to use OAuth.

## Technologies
Back-end: Ruby on Rails, API, Ajax<br>
Front-end: Action View, JavaScript ES6, HTML5, CSS/Sass, jQuery, Ajax, Bootstrap<br>
Database: PostgreSQL, Active Record<br>
Other technologies: OAuth, Refile, Chart Kick, Mechanize<br>
Deployment: AWS (EC2, Route 53), NGINX<br>

## Reflection
- I set out to do this project because I wanted to play with a large database with many tables that interact with each other in different ways. I learned a lot about designing an Entity Relationship Diagram and setting up polymorphic associations in Rails.
- I was inspired to make an app that help people learn and share information easier because I feel that is one of technology's greatest assets. There are many ways that I can go to further develop this project. I could further develop it to become an open source research tool, or I could make it into a medical education platform by further developing the social media features. I am not sure which way I will go yet.
