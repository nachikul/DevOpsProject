{{/*
Expand the name of the chart
*/}}
{{- define "redis-cluster.fullname" -}}
{{ include "redis-cluster.name" . }}-{{ .Release.Name }}
{{- end -}}

{{/*
Default name template
*/}}
{{- define "redis-cluster.name" -}}
{{ .Chart.Name }}
{{- end -}}