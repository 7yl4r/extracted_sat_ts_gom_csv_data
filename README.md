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

sat_products["Satellite Product .nc files \n (IMaRS, CoastWatch, etc)"]
imars_csv["time-series extracted \n for each RoI from each \n set of .nc files \n (IMaRS)"];
github_csv["extracted_sat_ts_gom_csv_data \n git repo \n (GitHub)"]
influx["Dashboard InfluxDB"]
grafana["mbon-dashboard-server \n dashboard display"]

sat_products 
  -- "[daily] MATLAB \n extraction cronjob \n(IMaRS)" --> 
imars_csv
  -- "[daily] git autocommit + push" -->
github_csv
  -- "mbon-dashboard-server [daily] airflow job" -->
influx
  -- "Dashboard query ([on-demand])" -->
grafana

subgraph Legend
    example["data description \n (stored location)"] -- "job description" --> B
end

```
