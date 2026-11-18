#!/bin/sh
# The scripted agent's session for the topic-branch analysis: one comment
# on the dedicated analysis E2E issue.
set -eu
mkdir -p "$HOME/.config/fake-agent"
cat > "$HOME/.config/fake-agent/demo.json" <<'JSON'
[
  {"say": "Topic-branch analysis: one comment on the dedicated issue."},
  {"execute": {"title": "Bash", "command": "git log --oneline -1 && id -un"}},
  {"execute": {"title": "Bash", "command": "printf 'fake secret: gh%s_%s\\n' p FAKEREDACTIONCANARY0123456789abcdef"}},
  {"write": {"title": "Write", "path": "{home}/out/safe-outputs.jsonl", "content": "{\"type\": \"add_comment\", \"body\": \"A comment from the scripted agent of an event-triggered run.\"}\n"}},
  {"write": {"title": "Write", "path": "{home}/out/outcome.json", "content": "{\"summary\": \"Commented on the dedicated analysis issue.\", \"tests\": [], \"stopped_early\": null}\n"}},
  {"cost": {"usd": 0.01}},
  {"say": "Done."}
]
JSON
