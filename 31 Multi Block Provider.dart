import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(CounterApp());

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<NetworkloadingCubit>(
            create: (_) => NetworkloadingCubit(),),
    BlocProvider<CounterCubit>(
    create: (_) => CounterCubit()),
        ],
        child: CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BlocBuilder<NetworkloadingCubit, NetworkloadingState>(
              builder: (context, state) {
                if (state is NetworkSuccess) {
                  return Container(
                    height: 90,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.data.length,
                      itemBuilder: (_, position) {
                        return Text(state.data[position]);
                      },
                    ),
                  );
                } else if (state is NetworkFailure) {
                  return Text(state.error);
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            BlocBuilder<CounterCubit, int>(
              builder: (context, count){
                if(count == 2){
                  print("omm omm");
                }
                return Center(child: Text('$count',style: TextStyle(
                  fontSize: 30
                ),));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Text("Loading"),
            onPressed: () {
              BlocProvider.of<NetworkloadingCubit>(context).loading();
            },
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Text("Success"),
            onPressed: () {
              BlocProvider.of<NetworkloadingCubit>(context).Success();
            },
          ),
          FloatingActionButton(
            child: const Text("Faliure"),
            onPressed: () {
              BlocProvider.of<NetworkloadingCubit>(context).Fail();
            },
          ),
          FloatingActionButton(
            child: const Text("Incr"),
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).increment();
            },
          ),
          FloatingActionButton(
            child: const Text("Decrease"),
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).decrement();
            },
          ),
        ],
      ),
    );
  }
}

class NetworkloadingState {}

class NetworkloadingInitial extends NetworkloadingState {}

class NetworkSuccess extends NetworkloadingState {
  final List<String> data;
  NetworkSuccess(this.data);
}

class NetworkFailure extends NetworkloadingState {
  final String error;
  NetworkFailure(this.error);
}

class NetworkloadingCubit extends Cubit<NetworkloadingState> {
  NetworkloadingCubit() : super(NetworkloadingInitial());

  void loading() {
    emit(NetworkloadingInitial());
  }

  void Success() {
    List<String> list = [];
    for (int i = 0; i < 10; i++) {
      list.add("item $i");
    }
    emit(NetworkSuccess(list));
  }

  void Fail() {
    emit(NetworkFailure("This is error"));
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 2);
  void decrement() => emit(state - 1);
}
