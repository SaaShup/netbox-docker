#!/bin/bash

migrate() {
    # Check if update is needed
    if ! ./manage.py migrate --check >/dev/null 2>&1; then
        echo "⚙️ Applying database migrations"
        ./manage.py migrate --no-input
        echo "⚙️ Running trace_paths"
        ./manage.py trace_paths --no-input
        echo "⚙️ Removing stale content types"
        ./manage.py remove_stale_contenttypes --no-input
        echo "⚙️ Removing expired user sessions"
        ./manage.py clearsessions
        echo "⚙️ Building search index (lazy)"
        ./manage.py reindex --lazy
    fi
}

migrate && supervisord --configuration /etc/supervisor/conf.d/supervisord.conf
