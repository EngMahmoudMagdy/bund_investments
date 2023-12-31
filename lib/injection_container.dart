import 'package:bund_investments/core/network/network_info.dart';
import 'package:bund_investments/features/investments/data/data_sources/investment_remote_data_source.dart';
import 'package:bund_investments/features/investments/data/repos/investment_repo_impl.dart';
import 'package:bund_investments/features/investments/domain/repos/investment_repo.dart';
import 'package:bund_investments/features/investments/presentation/bloc/fixed_income_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final di = GetIt.instance;

Future<void> init() async {
  di.registerLazySingleton<FixedIncomeBloc>(
    () => FixedIncomeBloc(di<InvestmentRepo>()),
  );
  di.registerLazySingleton<InvestmentRepo>(
    () => InvestmentRepoImpl(
        networkInfo: di<NetworkInfo>(),
        investmentRemoteDataSource: di<InvestmentRemoteDataSource>()),
  );

  di.registerLazySingleton(() => http.Client());
  di.registerLazySingleton<InvestmentRemoteDataSource>(
    () => InvestmentRemoteDataSourceImpl(client: di<http.Client>()),
  );
  di.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(di<Connectivity>()));
  di.registerLazySingleton(() => Connectivity());
}
