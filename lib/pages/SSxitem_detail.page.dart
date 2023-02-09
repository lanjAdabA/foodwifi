import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logics/item_details/cubit/item_detailed_cubit.dart';

class ItemDetailSPage extends StatelessWidget {
  const ItemDetailSPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ItemDetailedCubit>().state;

    switch (state.status) {
      case Status.initial:
        return Center(child: CircularProgressIndicator.adaptive());
      case Status.loading:
        return Center(child: CircularProgressIndicator.adaptive());
      case Status.loaded:
        return Scaffold(
          body: Column(children: [Text(state.productdetail.toString())]),
        );
      case Status.error:
        return Center(child: CircularProgressIndicator.adaptive());
    }
  }
}
