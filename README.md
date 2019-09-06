Multipart Download
==================


For when you can't use lftp...

You need to have GNU parallel downloaded.

# metalink file

```bash
cat files.metalink | grep url | cut -f2 -d'>' | cut -f1 -d '<' | parallel -j1 "./download_large_http.sh data{#} {}"
```

