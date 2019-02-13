# FileWave Booster Docker Image

## UPDATE: FileWave got their knickers in a bunch and told me to remove the image from dokcer hub. So fork off this repo, Change the Dockerfile as you see fit and roll your own image 

This Docker image runs a FileWave Booster

# Settings

Several options are customizable using environment variables.

* ``FWBOOSTER_NAME``: The device name of the Booster. Defaults to ``NewBooster``.
* ``FWBOOSTER_LOCATION``: The location of the Booster. Defaults to ``New Branch Office``.
* ``FWBOOSTER_PASSWORD``: The password of the Booster. Defaults to ``filewave``.
* ``FWBOOSTER_PORT``: The TCP port of the Booster. Defaults to ``20013``.
* ``FWBOOSTER_PUBPORT``: The Publish of the Booster. Defaults to ``20003``.
* ``FWSERVER1_PORT``: The TCP Port of Server 1 that the Booster Connects to. Defaults to ``20015``.
* ``FWSERVER1_ADDR``: The IP or DNS address of Server 1 that the Booster Connects to. Defaults to ``no.server.set``.
* ``FWSERVER1_SUBSPORT``: The Subscriptions TCP port of Server 1 that the Booster Connects to. Defaults to ``20005``.
* ``FWBOOSTER_SSLLOADER``: Boolean value to turn SSL on/off for Loader Connections. Defaults to ``0``.
* ``FWBOOSTER_FREEDISKSPACELIMIT``: Free Diskspace Limit. Defaults to ``500``.

# Running the FileWave Booster Container

```bash
$ docker pull nielshojen/filewavebooster
$ docker run -d --restart always --name=filewavebooster \
  --restart="always" \
  -p 20003:20003 \
  -p 20004:20004 \
  -p 20013:20013 \
  -p 20014:20014 \
  -e FWBOOSTER_NAME="supercoolbooster" \
  -e FWSERVER1_ADDRESS="myfilewaveserver.mydomain.com" \
  nielshojen/filewavebooster
```

# Persisting the Booster Data

The booster data lives in /var/FWBooster, so mounting that to a directory on the host would require an extra line:

```bash
$ docker pull nielshojen/filewavebooster
$ docker run -d --restart always --name=filewavebooster \
  --restart="always" \
  -p 20003:20003 \
  -p 20004:20004 \
  -p 20013:20013 \
  -p 20014:20014 \
  -v /local/host/folder:/var/FWBooster \
  -e FWBOOSTER_NAME="supercoolbooster" \
  -e FWSERVER1_ADDRESS="myfilewaveserver.mydomain.com" \
  nielshojen/filewavebooster
```

# Specific Versions

You can use the version tag to run a specific version fo the booster if needed (eg. 12.9.0):

```bash
$ docker pull nielshojen/filewavebooster:12.9.0
$ docker run -d --restart always --name=filewavebooster \
  --restart="always" \
  -p 20003:20003 \
  -p 20004:20004 \
  -p 20013:20013 \
  -p 20014:20014 \
  -e FWBOOSTER_NAME="supercoolbooster" \
  -e FWSERVER1_ADDRESS="myfilewaveserver.mydomain.com" \
  nielshojen/filewavebooster:12.9.0
```
