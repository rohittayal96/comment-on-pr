FROM ruby:2.7-alpine

LABEL "com.github.actions.name"="Comment on PR"
LABEL "com.github.actions.description"="Leaves a comment on an PR"
LABEL "com.github.actions.repository"="https://github.com/rohittayal96/comment-on-pr"
LABEL "com.github.actions.maintainer"="Rohit Tayal <rohit.tayal@zomato.com>"
LABEL "com.github.actions.icon"="message-square"
LABEL "com.github.actions.color"="blue"

RUN gem install octokit

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
