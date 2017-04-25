# docker-pgtap

[![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](https://github.com/LREN-CHUV/docker-pgtap/blob/master/LICENSE) [![DockerHub](https://img.shields.io/badge/docker-lren%2Fflyway-008bb8.svg)](https://hub.docker.com/r/lren/flyway/) [![CircleCI](https://circleci.com/gh/LREN-CHUV/docker-pgtap/tree/master.svg?style=svg)](https://circleci.com/gh/LREN-CHUV/docker-pgtap/tree/master) [![ImageVersion](https://images.microbadger.com/badges/version/lren/flyway.svg)](https://hub.docker.com/r/lren/flyway/tags "lren/flyway image tags") [![ImageLayers](https://images.microbadger.com/badges/image/lren/flyway.svg)](https://microbadger.com/#/images/lren/flyway "lren/flyway on microbadger")
[![CHUV](https://img.shields.io/badge/CHUV-LREN-AF4C64.svg)](https://www.unil.ch/lren/en/home.html)

pgTAP - Unit testing for PostgreSQL.

This is a docker image that contains pgTAP.

## About pgTAP

> pgTAP is a suite of database functions that make it easy to write TAP-emitting unit tests in psql scripts or xUnit-style test functions. The TAP output is suitable for harvesting, analysis, and reporting by a TAP harness.

From: [pgTAP: Unit testing for PostgreSQL](http://pgtap.org/)

## Install

This docker image is available as an automated build on [the docker registry hub](https://registry.hub.docker.com/u/lren/pgtap/), so using it is as simple as running:


```console
$ docker run lren/pgtap:0.96.0-0
```

## How to use this image

### Start a postgres instance

```console
$ docker run --name db-under-test -e POSTGRES_PASSWORD=mysecretpassword -d postgres
```
then fill the database with tables and data, using something you want to test.

### Execute the tests

```console
$ docker run -i -t --rm --name pgtap --link db-under-test:db -e PASSWORD=postgres -v /local/folder/with/tests/:/test lren/pgtap:0.96.0-0
```

Environment variables:

* DATABASE
* HOST=db
* PORT=5432
* USER="postgres"
* PASSWORD=""
* TESTS="/test/*.sql"

## Build

Run: `./build.sh`

## Publish on Docker Hub

Run: `./publish.sh`

## License

### Docker packaging

(this project)

Copyright (C) 2010-2017 [LREN CHUV](https://www.unil.ch/lren/en/home.html)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

Initial packaging done by Andreas Wålm <andreas@walm.net>

### pgTAP

[pgTAP license](https://github.com/theory/pgtap#copyright-and-license)

Copyright (c) 2008-2016 David E. Wheeler. Some rights reserved.

Permission to use, copy, modify, and distribute this software and its documentation for any purpose, without fee, and without a written agreement is hereby granted, provided that the above copyright notice and this paragraph and the following two paragraphs appear in all copies.

IN NO EVENT SHALL DAVID E. WHEELER BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING LOST PROFITS, ARISING OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF DAVID E. WHEELER HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

DAVID E. WHEELER SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE SOFTWARE PROVIDED HEREUNDER IS ON AN "AS IS" BASIS, AND DAVID E. WHEELER HAS NO OBLIGATIONS TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
