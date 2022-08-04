import 'package:flutter/cupertino.dart';
import 'package:mvvm/repositories/auth_repo.dart';
import 'package:mvvm/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async {
    _myRepo
        .loginApi(data)
        .then((value) => print(value.toString()))
        .onError((error, stackTrace) => utils.toastMessage(error.toString()));
  }
}
