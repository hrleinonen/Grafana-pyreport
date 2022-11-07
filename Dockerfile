# syntax=docker/dockerfile:1
FROM python:3.9.15-bullseye
LABEL desc="Grafana-pyreport is tool to create DocX reports from Grafana dashboards."
LABEL maintainer="Ville Leinonen"
LABEL licence="GPLv2"
RUN mkdir -p /opt/grafana-pyreport/bin && mkdir -p /opt/grafana-pyreport/templates && mkdir -p /opt/grafana-pyreport/output
WORKDIR /opt/grafana-pyreport/bin
COPY requirements.txt requirements.txt
COPY grafana-pyreport-0.92.py grafana-pyreport.py
RUN chmod +x grafana-pyreport.py
RUN pip install -r requirements.txt && ln -s /opt/grafana-pyreport/bin/grafana-pyreport.py /usr/bin/grafana-pyreport
ENV DOCKER=YES
