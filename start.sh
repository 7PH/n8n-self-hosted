#!/bin/sh

n8n import:credentials --separate --input=credentials
n8n import:workflow --separate --input=workflows
n8n start $N8N_OPTIONS
