#!/usr/bin/env bash
set -euo pipefail

echo "Checking CI scripts are executable..."

failed=0
for script in ci/*.sh ci/*.sh.jinja; do
    if [ -f "$script" ] && [ ! -x "$script" ]; then
        echo "ERROR: $script is not executable"
        failed=1
    fi
done

if [ $failed -eq 1 ]; then
    echo "Some CI scripts are missing executable permissions. Run: chmod +x ci/*.sh ci/*.sh.jinja"
    exit 1
fi

echo "All CI scripts are executable"
