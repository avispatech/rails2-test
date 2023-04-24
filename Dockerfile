# syntax=docker/dockerfile:1

FROM ruby:3.2-alpine

RUN apk add nodejs yarn postgresql-dev build-base gcompat tzdata
# Create an application directory
RUN mkdir -p /app

# Set the /app directory as the working directory for any command that follows
WORKDIR /app

COPY Gemfile.lock ./

COPY . .

RUN bundle install
RUN rails assets:precompile


EXPOSE 3000

CMD [ "bundle", "exec", "rails", "server" ]

