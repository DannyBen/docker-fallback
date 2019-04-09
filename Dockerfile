FROM alpine:3.9

ENV TERM=linux
ENV PS1 "\n\n>> fallback \W \$ "
WORKDIR /app

RUN apk --no-cache add ruby ruby-etc
RUN echo 'gem: --no-document' > /etc/gemrc && gem install rack webrick

COPY app .

EXPOSE 3000
CMD rackup -p 3000 -o 0.0.0.0
