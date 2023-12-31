import 'package:bund_investments/core/error/failures.dart';
import 'package:bund_investments/features/investments/data/models/bonds_response.dart';
import 'package:dartz/dartz.dart';

abstract class InvestmentRepo {
  Future<Either<Failure, List<Bond>>> getBonds();
}
