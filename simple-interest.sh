#!/usr/bin/env bash

set -euo pipefail

read -r -p "Principal: " principal
read -r -p "Annual rate of interest (%): " rate
read -r -p "Time period (years): " time

number_pattern='^[0-9]+([.][0-9]+)?$'
for value in "$principal" "$rate" "$time"; do
    if [[ ! $value =~ $number_pattern ]]; then
        printf 'Error: enter non-negative numbers for principal, rate, and time.\n' >&2
        exit 1
    fi
done

awk -v principal="$principal" -v rate="$rate" -v time="$time" \
    'BEGIN { printf "Simple interest: %.2f\n", principal * rate * time / 100 }'