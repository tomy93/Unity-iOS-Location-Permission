# Unity-iOS-Location-Permission

Check for authorizationStatus == 0 to validate your app has the full Location Permission granted.

Remember that iOS requires the user to enable permission directly into the app settings menu. 
Navigate the user there using _accessIOSSettings() in the plugin or directly from Unity by using:
```
#if UNITY_IOS
  Application.OpenURL("app-settings:");
#endif
```

Instructions to setup the plugin:
- Place LocationPermissionStatus.mm in Assets/Plugins/iOS.
- Add the necessary interop functions where needed, i.e:
```
#if UNITY_IOS && !UNITY_EDITOR
  [DllImport("__Internal")]
  private static extern int _getLocationPermissionStatus();
#endif
```
- Handle your ask permission prompts.
