# podserver
A simple podcast service for distributing content from Google Drive.

## Caveat: Everything below is merely aspirational.

A confgured directory on Google Drive is scanned for subdirectories containing MP3 files. Each such subdirectory is a separate podcast, and each MP3 file within it is an episode of that podcast.
  - The name of the subdirectory is the name of the podcast.
  - The MP3 files, in alphabetical order, are the episodes of the podcast.
  - ID3 metadata in each MP3 file provides title and timestamps. If the timestamp of epilode i is not greater than that of episode i-1, the timestamp of episode i will be adjusted accordingly.

| Entry point | Response |
| --- | --- |
| / | 302 redirect to https://www.youtube.com/watch?v=dQw4w9WgXcQ |
| /channel/{URL-encoded-podcast-name} | ordinary RSS XML for a podcatcher. |
| /list | HTML-formatted list of all podcasts and episodes. |
| /refresh | re-reads the configured directory of podcasts and redirects to /list |
