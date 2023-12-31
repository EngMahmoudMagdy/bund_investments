import 'package:bund_investments/core/error/exceptions.dart';
import 'package:bund_investments/core/error/failures.dart';
import 'package:bund_investments/core/network/network_info.dart';
import 'package:bund_investments/features/investments/data/data_sources/investment_remote_data_source.dart';
import 'package:bund_investments/features/investments/data/models/bonds_response.dart';
import 'package:bund_investments/features/investments/domain/repos/investment_repo.dart';
import 'package:dartz/dartz.dart';

class InvestmentRepoImpl extends InvestmentRepo {
  final NetworkInfo networkInfo;
  final InvestmentRemoteDataSource investmentRemoteDataSource;

  InvestmentRepoImpl({
    required this.networkInfo,
    required this.investmentRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<Bond>>> getBonds() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await investmentRemoteDataSource.getBonds();
        //Return successful data from backend.
        return Right(result.list);
      } on ServerException catch (e) {
        //Return Server Error message
        return Left(ServerFailure(e.message));
      } on AuthException {
        //Return Auth Error message
        return const Left(AuthFailure('You need to login'));
      }
    } else {
      //Return Connection Error message
      return const Left(ConnectionFailure('No internet connection'));
    }
  }
}
