FROM ruby:2.5.1

LABEL maintanier "Brian Colfer <bcolfer@zendesk.com>"

RUN mkdir /app

WORKDIR /app
ADD Gemfile /app
ADD Gemfile.lock /app
ADD spec /app/spec

RUN bundle install --deployment

ENV TARGET_HOST=localhost
ENV TARET_PORT=4567
ENV EXPECTED_TEXT="Hello"

ENV SPEC_TO_RUN=./spec/hello_spec.rb

ENTRYPOINT ["bundle", "exec","ruby", "rspec"]
CMD ['./spec/hello_spec.rb']



