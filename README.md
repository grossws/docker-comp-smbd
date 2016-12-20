# Info

CentOS basic [Dockerfiles][df] with test [Samba][samba] server for automated builds on [docker hub][dhub].

Based on [`grossws/centos:7`][base] image.

## Usage

To run `smbd` for testing environment:

```bash
docker run -it --rm -v /tmp/share-data:/data -p 445:445 grossws/smbd:latest
```

Also additional params could be passed to `smbd` daemon:
```bash
# with debug level == 4
docker run -it --rm -v /tmp/share-data:/data -p 445:445 grossws/smbd:latest smbd -- -d 4
```

After that share could be accessed using `smbclient` or any other tool:
```bash
smbclient -U ro //localhost/data
```

## Users

Two users are available:
- `ro` with read-only access (password is `test`);
- `rw` with read-write access (password is `test`).

Is part of the [docker-components][dcomp] repo.

[df]: http://docs.docker.com/reference/builder/ "Dockerfile reference"
[samba]: https://www.samba.org/
[dhub]: https://hub.docker.com/u/grossws/
[base]: https://github.com/grossws/docker-comp-smbd
[dcomp]: https://github.com/grossws/docker-components


# Licensing

Licensed under MIT License. See [LICENSE file](LICENSE)
