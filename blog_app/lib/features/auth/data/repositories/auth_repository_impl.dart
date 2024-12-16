import 'package:blog_app/core/error/exceoptions.dart';
import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  const AuthRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failures, String>> LoginWithEmailPassword(
      {required String email, required String password}) {
    // TODO: implement LoginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, String>> signUpWithEmailPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final userId = await remoteDataSource.signUpWithEmailPassword(
          email: email, password: password, name: name);
      return right(userId);
    } on ServerException catch (e) {
      return left(Failures(e.message));
    }
  }
}
