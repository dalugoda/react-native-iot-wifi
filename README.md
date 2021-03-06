# react-native-iot-wifi

Wifi configuration.
This library was written to config iot devices. With iOS 11 Apple introduced NEHotspotConfiguration class for wifi configuration. Library supports same functionality on ios and android.

## 1.0.6

Android: Added build gradle compatibility.

- This changes enables compatibility when building your project using commands such as `.gradlew assembleRelease`.

## 1.0.5

Android: Added `forceWifiUsage` method. to use this method, do the following steps:

- create a file in `Android/app/src/main/res/xml`

```xml
<?xml version="1.0" encoding="utf-8"?>
<network-security-config>
  <domain-config cleartextTrafficPermitted="true">
    <domain includeSubdomains="true">YOUR DEVICE URL(i.e. 10.0.0.1)</domain>
  </domain-config>
</network-security-config>
```

- Edit your `AndroidManifest.xml`

```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest ...>
    <uses-permission android:name="android.permission.INTERNET" />
    <application
        ...
        android:usesCleartextTraffic="true"
        android:networkSecurityConfig="@xml/network_security_config"
        ...>
        ...
    </application>
</manifest>
```

## 1.0.4

wifi connection was dropping after a few seconds after connecting, this seems to occur only to devices using iOS 13. As a fix I changed the configuration.joinOnce = false; for the connect and connectSecure methods this change will maintain the connection to the wifi network even after the app is closed or on the background. this may not be ideal for certain use cases.

## 1.0.32

- added missing iOS connection error handling.
- added missing podspec file dependency from package.json.

## 1.0.3

I tested the library with RN v 0.61.2 for both iOS and Android and was able to fix conflicts related to the dependencies and auto linking with iOS.

- re-factored podspec and relocated file into root directory.

## 1.0.2

- Fixed some bugs from the syntax in the podspec

## 1.0.1

- Added error handling for iOS wifi connection failure.

- Added podspec for RN 6.1.2 compatibility.

## 1.0.0

- Optional Force binding to a Wifi on both iOS and Android platforms
- Android: Better error handling
- Android: Detection for a system added config which cant be reused, removed or updated
- Android: Reliable polling for requested network connection for callbacks
- It does do a lot of other cleanup and re-use of code

## 0.4.5

Android:

- Makes the connect call asynchronous on Android
- Fails for Android Q as the API is deprecated

iOS:

- Fixes APIs on Simulator as it was behind a compile time macro
- Exposed and returns defaults for Simulator targets

## 0.3.0

- `connectSecure()` now works
- `getSSID()` should work on android

## iOS

> Important
> IOTWifi uses NEHotspotConfigurationManager. To use the NEHotspotConfigurationManager class, you must enable the Hotspot Configuration capability in [Xcode](http://help.apple.com/xcode/mac/current/#/dev88ff319e7).

1. Drang an drop `IOTWifi.xcodeproj` to your workspace
2. [Link target](https://help.apple.com/xcode/mac/current/#/dev51a648b07) to `libIOTWifi.a` library
3. [Link target](https://help.apple.com/xcode/mac/current/#/dev51a648b07) to `NetworkExtension.framework` framework
4. [Enable](http://help.apple.com/xcode/mac/current/#/dev88ff319e7) `Hotspot Configuration`
5. For iOS 12 [Enable](http://help.apple.com/xcode/mac/current/#/dev88ff319e7) `Access WiFi Information`

## android

## Usage

```javascript
import Wifi from "react-native-iot-wifi";

Wifi.isApiAvailable(available => {
  console.log(available ? "available" : "failed");
});

Wifi.getSSID(SSID => {
  console.log(SSID);
});

Wifi.connect("wifi-name", error => {
  console.log(error ? "error: " + error : "connected to wifi-name");
});

Wifi.removeSSID("wifi-name", error => {
  console.log(error ? "error: " + error : "removed wifi-name");
});
```
