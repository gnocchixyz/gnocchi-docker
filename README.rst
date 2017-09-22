===================
 Gnocchi on Docker
===================

This repository contains Dockerfiles and a docker-compose scenario that can be
used to build an image of `Gnocchi`_ latest version and run a small cluster of
it.

The compose instance is made of:

- A container running Gnocchi
- A container running PostgreSQL (indexer)
- A container running Redis (storage)
- A container running Grafana
- A container running collectd

To run it simply type::

  $ docker-compose up

And it will start all those containers in the right order. Once started, you
can point your browser at `http://<ip of docker>:3000` to access Grafana. The
default username is "admin" and password is "password".

Devel
=====

To run master branches of Gnocchi, collectd-gnocchi, grafana-gnocchi-datasource, run::

  $ source devel.en
  $ ./build-base-images.sh # Build base images (only once)
  $ docker-compose build --no-cache --force-rm  # To force rebuild image from source
  $ docker-compose up


.. _Gnocchi: http://gnocchi.xyz
