# README

The purpose of this project is to familiarise myself with APIs of interest, and to showcase my translation of API documentation into usable code.

It is therefore a proof-of-concept, the concept being that I know how to work with APIs.

Documentation of sorts can be found at [my blog](http://alexandergarber.com).

For each API the process is fairly simple:
1. Write a wrapper in `app/services/`
2. Write a spec in `spec/services`

Sensitive credentials are generally saved to Rails' in-built encrypted credentials file.

The Rails app is not meant to be deployed to production, but rather to be run in Docker, using Docker Compose for the whole setup:
- Rails App ('web')
- Postgresql Database (Development)
- Postgresql Database (Test)
- Redis Database

Of course, with some extra work it *could* be deployed to production, but that is not this project's purpose.

I give no assurances that this will work on anyone else's computer, but if you have all the dependencies running on your host machine -- Bash, cURL, Ruby, Docker, etc. -- there is every reason to expect it to work.
