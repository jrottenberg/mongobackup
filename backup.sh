#!/bin/bash


set -euo pipefail


mongodump --host "${MONGO_SERVER}" --archive=test.20150715.gz --gzip