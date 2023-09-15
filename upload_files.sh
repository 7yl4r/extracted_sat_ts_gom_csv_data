#!/bin/bash
# upload .csv files to github
# This can be run from a cronjob.
# To do so: add a line like the following to your crontab
#    using the `crontab -e` command.
# 0 * * * * * ~/extracted_sat_ts_gom_csv_data/upload_files.sh

FILEDIR=/srv/imars-objects/tpa_pgs/rois/gom/extracted_sat_ts_gom_csv_data/

set -e

cd $FILEDIR
echo ============================================================
echo pulling repo to avoid merge conflicts...
git pull 
echo adding csv files to local git...
git add ./data/*.csv
echo committing added files...
git commit -m 'auto-upload csv files'
echo pushing to git...
git push
echo ============================================================
