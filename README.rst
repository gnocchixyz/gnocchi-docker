===================
 Gnocchi on Docker
==================
testing

This repository contains Dockerfiles and a docker-compose scenario that can be
used to build an image of `Gnocchi`_ latest version and run a small cluster of
it.

Choose prometheus or collectd based on requirement from docker-compose-host.yaml/docker-compose-prom.yaml and append it to docker-compose.yaml.

The compose instance is then made of:

- Two containers running Gnocchi-api and Gnocchi-metricd
- A container running PostgreSQL (indexer)
- A container running Redis (storage)
- A container running Grafana
- A container running collectd/prometheus

To run it simply type::

  $ ./build-base-images.sh # Build base images (only once)
  $ docker-compose up

And it will start all those containers in the right order. Once started, you
can point your browser at `http://<ip of docker>:3000` to access Grafana. The
default username is "admin" and password is "password".

Devel
=====

To run master branches of Gnocchi, collectd-gnocchi, grafana-gnocchi-datasource, run::

  $ source devel.env
  $ ./build-base-images.sh # Build base images (only once)
  $ docker-compose build --no-cache --force-rm  # To force rebuild image from source
  $ docker-compose up


.. _Gnocchi: http://gnocchi.xyz
