import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bund_investments/features/investments/data/models/bonds_response.dart';
import 'package:bund_investments/features/investments/domain/repos/investment_repo.dart';
import 'package:meta/meta.dart';

part 'fixed_income_event.dart';
part 'fixed_income_state.dart';

class FixedIncomeBloc extends Bloc<FixedIncomeEvent, FixedIncomeState> {
  final InvestmentRepo investmentRepo;
  FixedIncomeBloc(this.investmentRepo) : super(FixedIncomeInitial()) {
    on<RetrieveBonds>(_handleRetrieveBonds);
  }

  FutureOr<void> _handleRetrieveBonds(
      RetrieveBonds event, Emitter<FixedIncomeState> emit) async {
    emit(LoadingState());
    final either = await investmentRepo.getBonds();
    either.fold((l) => {emit(ErrorState(l.message ?? ''))},
        (r) => {emit(BondsLoaded(bondList: r))});
  }
}
