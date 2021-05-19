const win32TypeMap = <String, String>{
  // Base C types
  'void': 'Void',
  // A message parameter. Declared as `UINT_PTR`.
  'WPARAM': 'IntPtr',

  // A message parameter. Declared as `LONG_PTR`.
  'LPARAM': 'IntPtr',

  // Signed result of message processing. Declared as `LONG_PTR`.
  'LRESULT': 'IntPtr',

  'FARPROC': 'IntPtr',
  'LARGE_INTEGER': 'Int64',
  'ULARGE_INTEGER': 'Uint64',

  // A floating-point variable. Defined as `float`.
  'FLOAT': 'Float',

  'DOUBLE': 'Double', 'double': 'Double',
  'VOID': 'Void',

  'CONSOLE_READCONSOLE_CONTROL': 'Void',

  // Callbacks
  'LPCCHOOKPROC': 'Pointer<NativeFunction<CCHookProc>>',
  'LPCFHOOKPROC': 'Pointer<NativeFunction<CFHookProc>>',
  'LPFRHOOKPROC': 'Pointer<NativeFunction<FRHookProc>>',
  'LPOFNHOOKPROC': 'Pointer<NativeFunction<OFNHookProc>>',
  'DLGPROC': 'Pointer<NativeFunction<DlgProc>>',
  'DRAWSTATEPROC': 'Pointer<NativeFunction<DrawStateProc>>',
  'WNDPROC': 'Pointer<NativeFunction<WindowProc>>',
  'WNDENUMPROC': 'Pointer<NativeFunction<EnumWindowsProc>>',
  'FONTENUMPROCW': 'Pointer<NativeFunction<EnumFontFamExProc>>',
  'ENUMRESNAMEPROCW': 'Pointer<NativeFunction<EnumResNameProc>>',
  'ENUMRESTYPEPROCW': 'Pointer<NativeFunction<EnumResTypeProc>>',
  'MONITORENUMPROC': 'Pointer<NativeFunction<MonitorEnumProc>>',
  'GRAYSTRINGPROC': 'Pointer<NativeFunction<OutputProc>>',
  'SENDASYNCPROC': 'Pointer<NativeFunction<SendAsyncProc>>',
  'PHANDLER_ROUTINE': 'Pointer<NativeFunction<HandlerProc>>',
  'TIMERPROC': 'Pointer<NativeFunction<TimerProc>>',
  'PFN_AUTHENTICATION_CALLBACK_EX':
      'Pointer<NativeFunction<PfnAuthenticationCallbackEx>>',
  'PSYM_ENUMERATESYMBOLS_CALLBACKW':
      'Pointer<NativeFunction<SymEnumSymbolsProc>>',
  'LPEXCEPFINO_DEFERRED_FILLIN': 'Pointer<NativeFunction<ExcepInfoProc>>',

  // Void pointers
  'LPVOID': 'Pointer', 'PVOID': 'Pointer', 'LPCVOID': 'Pointer',
  'LPUNKNOWN': 'Pointer<IntPtr>',

  // Strings
  'LPWSTR': 'Pointer<Utf16>', 'LPCWSTR': 'Pointer<Utf16>',
  'LPCTSTR': 'Pointer<Utf16>',
  'LPTSTR': 'Pointer<Utf16>', 'LPWCH': 'Pointer<Utf16>',
  'LPCWCH': 'Pointer<Utf16>',
  'LPCOLESTR': 'Pointer<Utf16>',
  'LPOLESTR': 'Pointer<Utf16>',
  'PCNZWCH': 'Pointer<Utf16>',
  'LPCSTR': 'Pointer<Uint8>',
  'LPSTR': 'Pointer<Uint8>',
  'LPCCH': 'Pointer<Uint8>',
  'TCHAR': 'Uint16',
  'PCSTR': 'Pointer<Uint8>',
  'PSTR': 'Pointer<Utf8>',
  'PCTSTR': 'Pointer<Utf16>',
  'PCWSTR': 'Pointer<Utf16>',
  // A pointer to a null-terminated string of 16-bit Unicode characters.
  'PWSTR': 'Pointer<Utf16>',
  'BSTR': 'Pointer<Utf16>',

  // Pointers not prefixed with LP*

  'PSIZE_T': 'Pointer<IntPtr>',

  'PSID': 'Pointer',

  'mdTypeDef': 'Uint32',
  'IMetaDataDispenserEx': 'IntPtr',
  'IMetaDataImport2': 'IntPtr',

  // COM interfaces
  'IAppxBlockMapReader': 'Pointer',
  'IAppxFile': 'Pointer',
  'IAppxFilesEnumerator': 'Pointer',
  'IAppxManifestApplication': 'Pointer',
  'IAppxManifestApplicationsEnumerator': 'Pointer',
  'IAppxManifestCapabilitiesEnumerator': 'Pointer',
  'IAppxManifestDeviceCapabilitiesEnumerator': 'Pointer',
  'IAppxManifestDriverDependenciesEnumerator': 'Pointer',
  'IAppxManifestHostRuntimeDependenciesEnumerator': 'Pointer',
  'IAppxManifestMainPackageDependenciesEnumerator': 'Pointer',
  'IAppxManifestOSPackageDependenciesEnumerator': 'Pointer',
  'IAppxManifestOptionalPackageInfo': 'Pointer',
  'IAppxManifestPackageDependenciesEnumerator': 'Pointer',
  'IAppxManifestPackageDependency': 'Pointer',
  'IAppxManifestPackageId': 'Pointer',
  'IAppxManifestProperties': 'Pointer',
  'IAppxManifestQualifiedResourcesEnumerator': 'Pointer',
  'IAppxManifestReader': 'Pointer',
  'IAppxManifestResourcesEnumerator': 'Pointer',
  'IAppxManifestTargetDeviceFamiliesEnumerator': 'Pointer',
  'IAppxPackageReader': 'Pointer',
  'IAppxPackageWriter': 'Pointer',
  'IBindCtx': 'Pointer',
  'IConnectionPoint': 'Pointer',
  'IConnectionPointContainer': 'Pointer',
  'IEnumConnectionPoints': 'Pointer',
  'IEnumConnections': 'Pointer',
  'IEnumIDList': 'Pointer',
  'IEnumMoniker': 'Pointer',
  'IEnumNetworkConnections': 'Pointer',
  'IEnumNetworks': 'Pointer',
  'IEnumShellItems': 'Pointer',
  'IEnumSpellingError': 'Pointer',
  'IEnumString': 'Pointer',
  'IEnumVARIANT': 'Pointer',
  'IEnumWbemClassObject': 'Pointer',
  'IFileDialogEvents': 'Pointer',
  'IFileOperationProgressSink': 'Pointer',
  'IInspectable': 'Pointer',
  'IKnownFolder': 'Pointer',
  'IMoniker': 'Pointer',
  'INetwork': 'Pointer',
  'INetworkConnection': 'Pointer',
  'IOptionDescription': 'Pointer',
  'IPropertyDescriptionList': 'Pointer',
  'IPropertyStore': 'Pointer',
  'IProvideClassInfo': 'Pointer',
  'IRunningObjectTable': 'Pointer',
  'IShellFolder': 'Pointer',
  'IShellItem': 'Pointer',
  'IShellItemArray': 'Pointer',
  'IShellItemFilter': 'Pointer',
  'ISpellChecker': 'Pointer',
  'ISpellCheckerChangedEventHandler': 'Pointer',
  'ISpellingError': 'Pointer',
  'IStream': 'Pointer',
  'ITypeComp': 'Pointer',
  'ITypeInfo': 'Pointer',
  'ITypeLib': 'Pointer',
  'IUnknown': 'Pointer',
  'IUri': 'Pointer',
  'IWbemCallResult': 'Pointer',
  'IWbemClassObject': 'Pointer',
  'IWbemContext': 'Pointer',
  'IWbemObjectSink': 'Pointer',
  'IWbemQualifierSet': 'Pointer',
  'IWbemServices': 'Pointer',

  // Special cases
  'RPC_AUTH_IDENTITY_HANDLE': 'Pointer',

  'OLECHAR': 'Utf16',
  'VARIANTARG': 'Void', 'va_list': 'Void',
  'HPCON*': 'Pointer<IntPtr>',
  'LPHWAVEOUT': 'Pointer<IntPtr>',
  'LOGFONTW': 'LOGFONT',
  'SHELLEXECUTEINFOW': 'SHELLEXECUTEINFO',
  'WNDCLASSW': 'WNDCLASS',
  'LPPROC_THREAD_ATTRIBUTE_LIST': 'Pointer',
};
