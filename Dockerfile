FROM ruby:2.7.2-alpine

ENV LANG=C.UTF-8 \
  TZ=Asia/Tokyo

WORKDIR /app
RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
        gcc \
        g++ \
        libc-dev \
        libxml2-dev \
        linux-headers \
        make \
        mysql-client \
        mysql-dev \
        nodejs \
        tzdata \
        build-base \
        curl-dev \
        yarn

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

# # Start the main process.
# CMD ["rails", "server", "-b", "0.0.0.0"]

EXPOSE 3000
