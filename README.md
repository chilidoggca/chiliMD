# README

##Description
chiliMD is a user-driven educational platform that enhances open and credible information-gathering, information-sharing, collaborative peer-review, and makes citing references a snap.  Built using Ruby on Rails, HTML/CSS, JavaScript, Bootstrap, jQuery, PostgreSQL, OAuth, and Chart Kick.

##Installation and Setup
Simply clone this repo, run `rails db:create`, then run `psql chilimd_development < chilimd_backup.sql`. Finally, run `rails s`.
You may need to brew install minimagick if you do not have it installed locally, or the image thumbnails will not work.
You will need your own developer app keys from facebook and google to use OAuth.
