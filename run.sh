#! /bin/bash

script=$(basename "$0")

file="presentation.md"
options=""

case "$script" in
"run.sh") ;;
"export-html.sh")
  options="--export-html"
  ;;
"export-pdf.sh")
  options="--export-pdf"
  ;;
"calibrate.sh")
  file="calibration.md"
  ;;
*)
  echo "invoke as either run.sh, export.sh or calibrate.sh - was invoked as '$script'"
  exit 1
  ;;
esac

presenterm --config-file config.yml $file $options
