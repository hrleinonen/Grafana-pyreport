I needed tool to create Word reports from Grafana OSS version, I did not find existing tool
which includes also some kind of templating capabilities. So that's why i decided to create my own tool.

Usage:
```
./grafana-pyreport-0.9.py [-h] [-p] -t TIMEFRAME [-l TEMPLATE] [-o ORG] [-z TIMEZONE] [-f FOLDER] apitoken desktop url

Grafana pyreport help.

positional arguments:
  apitoken              Grafana API token
  desktop               Grafana desktop ID
  url                   Grafana server URL (eg. https://grafana.acme.local:3000)

optional arguments:
  -h, --help            show this help message and exit
  -p, --presentation    Create prensentation template. (default: False)
  -t TIMEFRAME, --timeframe TIMEFRAME Reporting timeframe 1d, 1w, 2w or 1m. (default: None)
  -l TEMPLATE, --template TEMPLATE Use template to create report. (default: None)
  -o ORG, --org ORG     Organization (default is 1). (default: None)
  -z TIMEZONE, --timezone TIMEZONE Setup timezone to Grafana API call (default UTC, this should be safe choice). (default: None)
  -f FOLDER, --folder FOLDER Where to put generated reports (default is working dir). (default: None)
  ```
  
  
