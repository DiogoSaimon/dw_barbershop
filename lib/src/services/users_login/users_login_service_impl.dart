// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dw_barbershop/src/core/constants/local_storage_keys.dart';
import 'package:dw_barbershop/src/core/exceptions/auth_exception.dart';
import 'package:dw_barbershop/src/core/exceptions/service_exception.dart';
import 'package:dw_barbershop/src/core/fp/either.dart';
import 'package:dw_barbershop/src/core/fp/nil.dart';
import 'package:dw_barbershop/src/repositories/user/user_repository.dart';
import 'package:dw_barbershop/src/services/users_login/users_login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersLoginServiceImpl implements UserLoginService {
  final UserRepository userRepository;
  UsersLoginServiceImpl({
    required this.userRepository,
  });
  @override
  Future<Either<ServiceException, Nil>> execute(
      String email, String password) async {
    final loginResult = await userRepository.login(email, password);

    switch (loginResult) {
      case Success(value: final accessToken):
        final sp = await SharedPreferences.getInstance();
        sp.setString(LocalStorageKeys.accessToken, accessToken);
        return Success(nil);
      case Failure(:final exception):
        return switch (exception) {
          AuthUnauthorizedException() =>
            Failure(ServiceException(message: 'Login ou senha inválidos')),
          AuthError() =>
            Failure(ServiceException(message: 'Erro ao realizer login')),
        };
    }
  }
}
