FROM ubuntu:16.04

RUN apt-get update \
&& apt-get install -y ruby-full ruby-dev build-essential \
&& gem install bundler --no-ri --no-rdoc

ENV APP_HOME=/app
ENV COMMENT_DATABASE_HOST comment_db
ENV COMMENT_DATABASE comments

WORKDIR ${APP_HOME}
COPY . ${APP_HOME}/
RUN bundle install

CMD ["puma"]
