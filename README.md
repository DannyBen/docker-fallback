Fallback - Default Ingress Backend
==================================================

This is a simple docker image intended to be used as a default backend to
an nginx proxy.

---

- [View on DockerHub][2]
- [View on Github][3]

---


Usage
--------------------------------------------------

### Start the server

With [opcode][1]

    $ op serve

or without

    $ cd app && rackup -p 3000 -o 0.0.0.0

or with docker-compose

    $ docker-compose up

or with plain docker

    $ docker run --rm -it -p 3000:3000 dannyben/fallback


### View the pages

Then you can test HTTP codes by either passing them in the path:

    $ open http://localhost:3000/503

or by sending the `X-Code` header:

    $ curl -v http://localhost:3000 -H "X-Code: 503"


---

[1]: https://github.com/DannyBen/opcode
[2]: https://hub.docker.com/r/dannyben/fallback/
[3]: https://github.com/DannyBen/docker-fallback

