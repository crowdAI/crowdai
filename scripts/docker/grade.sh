#!/bin/sh

set -x
bash install.sh
bash run.sh
bash callback.sh
set +x
