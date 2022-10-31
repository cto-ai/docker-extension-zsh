# A simple, ephemeral zsh terminal extension for docker

## Installation

Step 1 : If you have [Docker Desktop 4.10.0](https://docs.docker.com/desktop/release-notes/#docker-desktop-4100) or newer installed then you already have the "docker extension" command available. We recommend upgrading Docker Desktop but if you need to stay on a pre 4.10.0 version then you can install the Docker Extension CLI. Instructions can be found [here](https://github.com/docker/extensions-sdk/releases/).

Step 2 : Build the extension image
```
make image
```

Step 3 : Install extension and verify
```
make install
```

If you want to make changes to the start.sh script, docker-compose or ui components you can run the following command to quickly uninstall, rebuild and install updated extension :
```
make uninstall image install
```

Step 4 : Uninstall extension
```
make uninstall
```

## Screenshots

![](https://github.com/cto-ai/docker-extension-zsh/blob/main/img/example.png?raw=true)


## Video

[![](https://github.com/cto-ai/docker-extension-zsh/blob/main/img/video.png?raw=true)](https://www.loom.com/share/72ce2740caa34b7b8facea00d46cf1e9)

### Credit

Major credit to [@tomwillfixit](https://github.com/tomwillfixit)'s [prior work](https://github.com/tomwillfixit/docker-extension), which made this easy to ship.

### License

GPL
