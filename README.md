# Docker CouchDB

To run as a named container exposed on port 80:
```bash
sudo docker run -d -p 80:5984 -name couchdb coastwise/couchdb
```

Exposed Volumes
* /usr/local/etc/couchdb (config)
* /usr/local/var/lib/couchdb (data)

## Thanks
* @bradrydzewski [bradrydzewski/couchdb](https://index.docker.io/u/bradrydzewski/couchdb/)
* @klaemo [klaemo/couchdb](https://index.docker.io/u/klaemo/couchdb/)
