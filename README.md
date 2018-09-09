# compliment-bot
a mastodon bot that posts compliments

Current stage: proof of concept. Once every few hours, generate a second-person
compliment and post it to the public timeline.

dependencies: `gem 'mastodon-api'`

To use, generate a bearer token on your mastodon account, and put it in the
environment variable CB_BEARER_TOKEN. Otherwise, it'll just print compliments
every 15-30 seconds to stdout. (You can make a bearer token on the web in your mastodon settings, under 'Development'.)

Run with something like
`ruby main.rb`

By default, the bot waits a polite time period before posting anything.
This is one hour if it's posting to mastodon; it's 5 seconds if it's
writing to stdout. To override this, specify number of seconds to wait on
the command-line. For example,
`ruby main.rb 1800`
will wait a half hour and
`ruby main.rb 0`
will make its first post instantly.
