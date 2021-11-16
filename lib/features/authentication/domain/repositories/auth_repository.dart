import 'package:dartz/dartz.dart';
import 'package:doanktl/core/errors/failures.dart';
import 'package:doanktl/features/authentication/domain/entities/user_status.dart';

abstract class AuthRepository {
  Future<Either<Failures, UserStatus>> getUserStatus();
}
