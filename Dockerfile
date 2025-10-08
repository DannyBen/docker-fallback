FROM dannyben/alpine-ruby:3.3.3

ENV PS1 "\n\n>> fallback \W \$ "

COPY Gemfile* ./

RUN gem install bundler && bundle install

WORKDIR /app

COPY app .

EXPOSE 3000

CMD bundle exec rackup -p 3000 -o 0.0.0.0 -E production
