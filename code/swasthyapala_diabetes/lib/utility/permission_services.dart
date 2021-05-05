import 'package:permission_handler/permission_handler.dart';
//Check contacts permission

Future<PermissionStatus> getPermission() async {
  PermissionStatus permission = await Permission.contacts.status;
  if (permission.isDenied) {
    permission = await Permission.contacts.request();
  }
  return permission;
}
