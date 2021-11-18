import 'package:doanktl/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoaded) {
              return ListView.builder(
                  itemCount: state.vocabularies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Text(state.vocabularies[index].vocabName),
                    );
                  });
            }
            return Container();
          },
        ),
      ),
    );
  }

  void testData() {}
}
