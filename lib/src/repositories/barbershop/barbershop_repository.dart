import 'package:dw_barbershop/src/core/exceptions/repository_exception.dart';
import 'package:dw_barbershop/src/core/model/barbershop_model.dart';
import 'package:dw_barbershop/src/core/model/user_model.dart';

import '../../core/fp/either.dart';

abstract interface class BarbershopRepository {
  Future<Either<RepositoryException, BarbershopModel>> getMyBarbershop(
      UserModel userModel);
}
