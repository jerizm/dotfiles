#!/bin/bash

# Prints Claude plan usage, e.g. "5h 12% 7d 40%" (same numbers as /usage in Claude Code).
# shortcut: undocumented endpoint and no token refresh; fails if the token expired until Claude Code runs again.
TOKEN=$(security find-generic-password -s "Claude Code-credentials" -w 2>/dev/null | jq -r '.claudeAiOauth.accessToken // empty')
curl -sf -m 10 https://api.anthropic.com/api/oauth/usage \
    -H "Authorization: Bearer $TOKEN" \
    -H "anthropic-beta: oauth-2025-04-20" |
    jq -er '"5h \(.five_hour.utilization // 0 | round)% 7d \(.seven_day.utilization // 0 | round)%"'
