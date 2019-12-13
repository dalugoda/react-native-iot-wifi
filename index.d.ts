declare module "@josectobar/react-native-iot-wifi" {
  // tslint:disable:no-namespace
  type ConnectArgs =
    | [string, (error: string) => void]
    | [string, boolean, (error: string) => void];

  type RemoveConnectArgs =
    | [string, (error: string) => void]
    | [string, boolean, (error: string) => void];

  type ConnectSecureArgs =
    | [string, (error: string) => void]
    | [string, string, boolean, (error: string) => void];

  export namespace RNWifi {
    function isApiAvailable(cb: (available: boolean) => void): void;
    function getSSID(cb: (ssid: string) => void): void;
    function connect(...args: ConnectArgs): void;
    function connectSecure(...args: ConnectSecureArgs): void;
    function removeSSID(...args: RemoveConnectArgs): void;
    function forceWifiUsage(useWifi: boolean): void; //Only available for Android
  }

  export default RNWifi;
}
