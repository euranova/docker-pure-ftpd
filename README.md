# Pure FTPd docker image

This image is intended to use for testing / development.

## Usage

Make sure you provide two en vars:

* `FTP_USERNAME`
* `FTP_PASSWORD`

Those vars will be used to create an account on the server.

This account will server a specific folder in the container,
`/home/ftpusers/data`.

Make sure you bind a volume to that folder.