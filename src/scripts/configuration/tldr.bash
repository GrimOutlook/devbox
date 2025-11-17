#!/usr/bin/env bash
echo "Downloading tldr pages"

tldr --update || {
  echo "Failed to download tldr pages"
  return 1
}

echo "Finished downloading tldr pages"
