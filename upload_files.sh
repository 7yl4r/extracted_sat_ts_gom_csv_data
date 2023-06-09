#!/bin/bash
# upload .csv files to github
# This can be run from a cronjob.
# To do so: add a line like the following to your crontab
#    using the `crontab -e` command.
# 0 * * * * * ~/extracted_sat_ts_gom_csv_data/upload_files.sh

FILEDIR=/srv/imars-objects/tpa_pgs/rois/gom/extracted_sat_ts_gom_csv_data/

cd $FILEDIR && \
  git pull && \
  git add ./data/*.csv && \
  git commit -m 'auto-upload csv files' && \
  git push
