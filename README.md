Uses the `mirror` function of `lftp` to clone directories between the local
system and a ftp server.

This docker image was mainly devised to be used on automated shell scripts.

By default it uploads files, the environment variable `direction` can be used
to download files.

## Usage examples:

### Upload data

To upload data in the directory local `to_upload` to the `uploads` directory on
the remote server.

```bash
DIRECTION=upload
FTP_USER=your_username
FTP_PASS=your_password
FTP_HOST=ftps://someserver.com
FTP_SOURCE=/sync
FTP_TARGET=/uploads
```

```bash
docker run -v `pwd`/to_upload:/sync --env-file env-file jfig/lftp-sync
```

### Download data

the example bellow will download all data on the directory
`/wwwroot/user_uploads` to the directory `server_sync` on the local system.

```bash
DIRECTION=download
FTP_USER=your_username
FTP_PASS=your_password
FTP_HOST=ftps://someserver.com
FTP_SOURCE=/wwwroot/user_uploads
FTP_TARGET=/sync
```

```bash
docker run -v `pwd`/server_sync:/sync --env-file env-file jfig/lftp-sync
```
