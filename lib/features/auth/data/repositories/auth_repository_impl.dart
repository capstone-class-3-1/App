// import 'dart:async';
// import '../../domain/entities/user.dart';
// import '../../domain/entities/auth_token.dart';
// import '../../domain/repositories/auth_repository.dart';
// import '../datasources/auth_remote_datasource.dart';
// import '../datasources/auth_local_datasource.dart';

// class AuthRepositoryImpl implements AuthRepository {
//   final AuthRemoteDataSource remoteDataSource;
//   final AuthLocalDataSource localDataSource;

//   final StreamController<User?> _userController = StreamController<User?>.broadcast();

//   AuthRepositoryImpl({
//     required this.remoteDataSource,
//     required this.localDataSource,
//   });

//   @override
//   Stream<User?> get userStream => _userController.stream;

//   @override
//   Future<AuthResult> login({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final tokenModel = await remoteDataSource.login(
//         email: email,
//         password: password,
//       );
      
//       await localDataSource.saveAuthToken(tokenModel);
      
//       final userModel = await remoteDataSource.getCurrentUser(tokenModel.accessToken);
//       await localDataSource.saveUser(userModel);
      
//       final user = userModel.toEntity();
//       final token = tokenModel.toEntity();
      
//       _userController.add(user);
      
//       return AuthResult.success(user: user, token: token);
//     } catch (e) {
//       return AuthResult.failure(e.toString());
//     }
//   }

//   @override
//   Future<AuthResult> register({
//     required String email,
//     required String password,
//     required String name,
//   }) async {
//     try {
//       final tokenModel = await remoteDataSource.register(
//         email: email,
//         password: password,
//         name: name,
//       );
      
//       await localDataSource.saveAuthToken(tokenModel);
      
//       final userModel = await remoteDataSource.getCurrentUser(tokenModel.accessToken);
//       await localDataSource.saveUser(userModel);
      
//       final user = userModel.toEntity();
//       final token = tokenModel.toEntity();
      
//       _userController.add(user);
      
//       return AuthResult.success(user: user, token: token);
//     } catch (e) {
//       return AuthResult.failure(e.toString());
//     }
//   }

//   @override
//   Future<AuthResult> loginWithGitHub() async {
//     try {
//       final authUrl = await remoteDataSource.loginWithGitHub();
//       return AuthResult.failure('GitHub 로그인 URL: $authUrl');
//     } catch (e) {
//       return AuthResult.failure(e.toString());
//     }
//   }

//   @override
//   Future<void> logout() async {
//     await localDataSource.removeAuthToken();
//     await localDataSource.removeUser();
//     _userController.add(null);
//   }

//   @override
//   Future<AuthToken?> refreshToken() async {
//     try {
//       final currentToken = await localDataSource.getAuthToken();
//       if (currentToken == null) return null;

//       final newTokenModel = await remoteDataSource.refreshToken(
//         currentToken.refreshToken,
//       );
      
//       await localDataSource.saveAuthToken(newTokenModel);
//       return newTokenModel.toEntity();
//     } catch (e) {
//       await logout();
//       return null;
//     }
//   }

//   @override
//   Future<User?> getCurrentUser() async {
//     try {
//       final userModel = await localDataSource.getUser();
//       return userModel?.toEntity();
//     } catch (e) {
//       return null;
//     }
//   }

//   @override
//   Future<bool> isLoggedIn() async {
//     return await localDataSource.isLoggedIn();
//   }

//   void dispose() {
//     _userController.close();
//   }
// }