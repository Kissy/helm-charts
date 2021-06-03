{{/*
Return the proper cpi image name
*/}}
{{- define "vSphereCPI.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.vSphereCPI.image "global" .Values.global) }}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "vSphereCPI.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.vSphereCPI.image  ) "global" .Values.global) -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "vSphereCPI.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (printf "cloud-provider-interface-%s" (include "common.names.fullname" .)) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Compile all warnings into a single message.
*/}}
{{- define "vSphereCPI.validateValues" -}}
{{- $messages := list -}}
{{- $messages := without $messages "" -}}
{{- $message := join "\n" $messages -}}
{{- if $message -}}
{{-   printf "\nVALUES VALIDATION:\n%s" $message -}}
{{- end -}}
{{- end -}}

