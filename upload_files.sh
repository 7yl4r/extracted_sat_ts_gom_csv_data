#!/bin/bash
# upload .csv files to github
# This can be run from a cronjob.
# To do so: add a line like the following to your crontab
#    using the `crontab -e` command.
# 0 * * * * * ~/extracted_sat_ts_gom_csv_data/upload_files.sh
echo ============================================================
FILEDIR=/srv/imars-objects/tpa_pgs/rois/gom/extracted_sat_ts_gom_csv_data/

set -e

# this setting helps avoid git asking for user input
export GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no"

tee_cmd=tee -a upload_extractions.log

cd $FILEDIR
echo pulling repo to avoid merge conflicts... | tee upload_extractions.log
git pull | $tee_cmd
echo adding csv files to local git... | $tee_cmd
git add ./data/*.csv | $tee_cmd
echo committing added files... | $tee_cmd
git commit -m 'auto-upload csv files' | $tee_cmd
echo pushing to git... | $tee_cmd
git push | $tee_cmd
echo ============================================================
