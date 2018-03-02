# chiliMD
http://chilimd.jackclee.com

## Description
In today's age of "fake news", credible and easy information sharing is more important than ever.  chiliMD is a user-driven educational platform that enhances open and credible information-gathering, information-sharing, collaborative peer-review, and makes citing references a snap.

## Technologies
Back-end: Ruby on Rails, API, Ajax
Database: PostgreSQL, Active Record
Front-end: Action View, ES6 JavaScript, HTML5, CSS/Sass, jQuery, Ajax, Bootstrap
Technologies: OAuth, Refile, Chart Kick, Mechanize
Deployment: AWS (E2, Route 53)

## Features
- OAuth sign-up with facebook or google.
- Create posts. Attach media files to your posts. Easily cite your sources using DOI (digital object identifier).
- Upload media files.
- Search by post, media type, tags, etc.
- Add content to your review list.

## Installation and Setup
* Simply clone this repo, run `rails db:create`, then run `psql chilimd_development < chilimd_backup.sql`. Finally, run `rails s`.
* You may need to brew install minimagick if you do not have it installed locally, or the image thumbnails will not work.
* You will need your own developer app keys from facebook and google to use OAuth.
