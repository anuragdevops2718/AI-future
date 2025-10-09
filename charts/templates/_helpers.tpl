{{- /*
Return a safe fullname: prefer .Release.Name, else fallback to chart name
*/ -}}
{{- define "ai-platform-op.fullname" -}}
{{- if .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- /*
Return commonly-used labels as YAML mapping (use with include and indent)
*/ -}}
{{- define "ai-platform-op.labels" -}}
app.kubernetes.io/name: {{ include "ai-platform-op.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name | default (include "ai-platform-op.fullname" .) }}
app.kubernetes.io/managed-by: {{ .Release.Service | default "helm" }}
{{- end -}}
