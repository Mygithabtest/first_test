{{/* Expand the name of the chart */}}
{{- define "hello-java.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Create a default fully qualified app name */}}
{{- define "hello-java.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- printf "%s" $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/* Create chart name and version as used by the chart label */}}
{{- define "hello-java.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Common labels */}}
{{- define "hello-java.labels" -}}
helm.sh/chart: {{ include "hello-java.chart" . }}
{{ include "hello-java.selectorLabels" . }}
app.kubernetes.io/version: {{ default .Chart.AppVersion .Values.imageTag | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/* Selector labels */}}
{{- define "hello-java.selectorLabels" -}}
app.kubernetes.io/name: {{ include "hello-java.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}