#!/bin/bash
# upload .csv files to github

cd /srv/imars-objects/fgb/EXT_TS_MODA/OC && \
  git pull && \
  git add FGBdbv2_chlor_a_TS_MODA_daily_EFG.csv && \
  git commit -m 'auto-upload csv files' && \
  git push
