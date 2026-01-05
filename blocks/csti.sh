#!/bin/bash

n_issues=$(acli jira workitem search --jql 'project = "CSTI" AND "Team[Team]" = f86306f2-93d0-4875-bb73-427be4b15436 AND status != Done AND status != Completed AND status != Canceled' --json | jq length)
[[ "$n_issues" > 0 ]] && echo "🎫$n_issues" || echo ""
