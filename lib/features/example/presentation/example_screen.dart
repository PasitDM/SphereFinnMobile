import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/components/components.dart';
import '../../../../core/state/app_state.dart';
import 'example_cubit.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends AppState<ExampleScreen, ExampleCubit> {
  @override
  PreferredSizeWidget? get appBar => PrimaryAppBar(
        title: serviceCenterLabel?.locateUsSection?.title ?? '',
      );

  @override
  Widget body() {
    return BlocBuilder<ExampleCubit, ExampleState>(
      builder: (context, state) {
        if (state.action == ExampleAction.loading) {
          return const LoadingWidget();
        }

        return const Column(
          children: [],
        );
      },
    );
  }
}
