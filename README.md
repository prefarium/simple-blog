# Simple blog
The site is written on Ruby on Rails, which is my first experience with this framework

The current version is deployed on Heroku: [SimpleBlog](https://simple-blog-first-project.herokuapp.com/)

On login page use '1' (without quotes) as login and password in order to see all features of the site


# Functionality
Please note that tests are out-of-date at the moment therefore they shall fail

## Authorization
The authorization system is implemented using the [sorcery](https://rubygems.org/gems/sorcery/) gem

Each authorized user has full access to all the features of the site, in fact being an admin. Unlike a mere mortal, an admin can:
* Add new articles
* Edit and delete articles
* Remove the tags

However, self-registration is only possible if no user has been registered yet. As soon as the first user has registered, the login button appears instead of the registration button. After that, new users can only be added directly to the database

When registering, there are no checks other than confirming the password. You can just write "1"! in all fields, and the user will be created with the following data


## Articles
As mentioned in the previous section, working with articles is only open to authorized users

When creating or editing an article, there are no validations, so you can create completely empty entries

You can add any number of tags when creating and editing an article. To add more than 1 tag, just write them separated by a space. In fact, you can use almost any character to separate tags. In the current version of the site, any sequence of English letters, numbers, and underscores is considered as a tag, and everything else acts as a separator


## Tags
Tags are interactive anywhere on the site. Wherever you see them, you can always click on any of them and get a list of all the articles with this tag

If you delete a tag while editing an article, it will not disappear from the database. To get rid of the tag permanently, you need to delete it from the list on the /tags page (again, this function only available to authorized users)

Tags are also automatically deleted when an article is deleted. Of course, provided that they are not found in other articles


## Comments
Commenting is available to any site user. Similarly to articles, the content of the comment meet no validation before saving, so it is possible to post a completely empty comment

Deleting and editing comments is not implemented
