# extracted_sat_ts_gom_csv_data

* dan has nightly routine to extract locations 
  * orchestrated by cron
  * runs matlab scripts
* a different cron job calls upload_files.sh to upload the csv files here
* once into github
  * can be pulled into quarto directly
  * can be pulled into grafana via modified airflow job
    * TODO: replace `imars.usf.edu/public_html/...` with `raw.github.com/...` in curl command  

### data-flow diagram:

```mermaid
graph TD

upstream_products["L2 files from NASA+ESA \n (CoastWatch, etc)"]
sat_products["Mapped satellite Product .nc files"]
imars_csv["time-series extracted .csv \n for each RoI from each \n set of .nc files \n (IMaRS)"];
github_csv["extracted_sat_ts_gom_csv_data \n git repo \n (GitHub)"]
influx["Dashboard InfluxDB"]
grafana["mbon-dashboard-server \n dashboard display"]

upstream_products
  -- "nightly fetch script \n (dotis@seashell crontab)" -->
sat_products 
  -- "nightly MATLAB \n extraction cronjob \n(dotis@seashell crontab)" --> 
imars_csv
  -- "nightly git autocommit + push \n(dotis@manglillo crontab)" -->
github_csv
  -- "mbon-dashboard-server airflow job" -->
influx
  -- "Dashboard query" -->
grafana

subgraph Legend
    example["data description \n (stored location)"] -- "job description" --> B
end
```
