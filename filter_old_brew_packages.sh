#!/bin/bash

# Date format: YYYY-MM-DD
CUTOFF_DATE=$1

# Function to convert date to seconds since epoch
date_to_seconds() {
    date -j -f "%Y-%m-%d" "$1" "+%s"
}

# Convert cutoff date to seconds since epoch
CUTOFF_SECONDS=$(date_to_seconds $CUTOFF_DATE)

# List all installed packages
brew_list=$(brew list)

for package in $brew_list; do
    # Get the last access time for the package
    last_access_time=$(stat -f "%a" $(brew --prefix $package))

    # If the last access time is earlier than the cutoff date, print the package name
    if [ $last_access_time -lt $CUTOFF_SECONDS ]; then
        package_info=$(brew info $package | grep -E '^\S.*(stable|bottled)' -A 1)
        description=$(echo "$package_info" | sed -n 2p)
        echo "$package ($description) was last accessed on $(date -r $last_access_time '+%Y-%m-%d')."
    fi
done
