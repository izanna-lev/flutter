// import 'package:flutter_keychain/flutter_keychain.dart';
//
// Future<Map<String, dynamic>?> getKeyChain() async {
//   var email = await FlutterKeychain.get(key: "com.app.sneakers-email");
//   var name = await FlutterKeychain.get(key: "com.app.sneakers-name");
//   if (email == null && name == null) {
//     return null;
//   } else {
//     return {"name": name ?? "", "email": email ?? ""};
//   }
// }
//
// putKeyChain({required String? name, required String? email}) async {
//   await FlutterKeychain.put(key: "com.app.sneakers-email", value: email ?? "");
//   await FlutterKeychain.put(key: "com.app.sneakers-name", value: name ?? "");
//   // removeKeyChain();
// }
