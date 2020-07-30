# init-macOS-dev

[![Platform](https://img.shields.io/badge/platform-macOS_High_Sierra-brightgreen.svg)](https://www.apple.com/macos/high-sierra/)

init my macOS development environment

download and install applications for custom


## usage

```bash
curl -sSL -H 'Cache-Control: no-cache' git.io/InitMacDev | bash
```

## Descrption

before use this initialization, you shoule

- make sure you have a fast network environment
- login your Apple account / iCloud / App Store
- `sudo xcode-select --install` and reboot
- make sure your App Store account are purchased with `init-application.sh - ${mas_only_app}`
- make sure ssh config which you want sync in `{iCloud}/Documents/Temporary/ssh-config/`
- [option] make sure ShadowsocksX config at `{iCloud}/Documents/Shadowconfig/ssx-ng-config.plist`



## Author

**SSlaunch.sh** © [zthxxx](https://github.com/zthxxx), Released under the **[MIT](./LICENSE)** License.<br>

> Blog [@zthxxx](https://blog.zthxxx.me) · GitHub [@zthxxx](https://github.com/zthxxx)

