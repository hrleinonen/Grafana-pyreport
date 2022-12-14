# Grafana-pyreport

I needed a tool to create Word reports from Grafana OSS version and I did not find existing tool
which includes also some kind of templating capabilities. So that's why i decided to create my own tool.

So here comes grafana-pyreport. Code is tested using Python 3.9.12.

Usage:
```
./grafana-pyreport.py [-h] [-p] -t TIMEFRAME [-l TEMPLATE] [-o ORG] [-z TIMEZONE] [-f FOLDER] apitoken desktop url

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

#### Templating
Templating is quite straightforward.

```
<title> Is Header
<id:> Is Grafana Image Id
<p> Is page break
Normal text is normal text.

Example template (fortigate.tpl):

<title>Fortigate statistical data
Data comes from Grafana (Elasticseach) and Zabbix monitoring.

Fortigate ACL deny, based on settings.
<id:2>
<id:3>
<id:5>
<id:18>

<id:11>

<id:21>

Fortigate failed management logins.
<id:10>
<p>
<title>Fortigate monitoring data from Zabbix
Data from this section comes from Zabbix.

<id:9>

Peaks in graph can indicate some network scanner activity.

<id:20>
```

Dashboard exmple:

![This is an image](https://github.com/hrleinonen/Grafana-pyreport/blob/main/reports/Dashboard.jpg)

You can find your dashboard id here:

![This is an image](https://github.com/hrleinonen/Grafana-pyreport/blob/main/reports/Dashboard%20Id.png)

#### Getting started (not templating)
Generate simple report for all panels in Grafana dashboard.
```
./grafana-pyreport.py -t 2w <apikey> <dashboard id> <url to grafana>
```
#### Getting started (templating)
Generate simple report for all panels in Grafana dashboard.
```
./grafana-pyreport.py -p -t 2w <apikey> <dashboard id> <url to grafana>
```
After this open your report and check panel id's.
  
Now generate template file using text editor.

Generate report using template.
```
./grafana-pyreport.py -l fortigate.tpl -t 2w <apikey> <dashboard id> <url to grafana>
```

#### Docker (build your own)
- download Dockerfile, requirements.txt and grafana-pyreport.py
- build docker image
- make output and template directories
- start docker container
- generate reports

Build docker image:
```
docker build -t grafana-pyreport:0.92 .
```

Generate directories:
```
mkdir -p /<dir>/ouput && mkdir -p /<dir>/templates
```

Start docker container:
```
docker run -d -it -v /opt/grafana-pyreport/templates:/opt/grafana-pyreport/templates -v /opt/grafana-pyreport/output:/opt/grafana-pyreport/output \
--name grafana-pyreport grafana-pyreport:0.92
```

Generate reports:
```
docker exec -it grafana-pyreport grafana-pyreport -t 1w <apikey> <dashboard id> <url to grafana>
```

#### TODO
- template option to change image size
- possibility to use configuration file(s) (URL, API-key and dashboard id)
- possibility to create report straight from the Grafana dashboard
- generate docker image
