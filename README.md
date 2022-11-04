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

#### Getting started (not templating)
Generate simple report for all panels in Grafana dashboard.

./grafana-pyreport.py -t 2w <apikey> <dashboard id> <url to grafana>

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

Dashboard exmple:
![This is an image](https://myoctocat.com/assets/images/base-octocat.svg)

#### TODO
- template option to change image size
- possibility to use configuration file(s) (URL, API-key and dashboard id)
- possibility to create report straight from the Grafana dashboard
- generate docker image
