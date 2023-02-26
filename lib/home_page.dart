import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rest_api_example/api_service.dart';
import 'package:rest_api_example/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _userFuture = ApiService().getUsers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('REST API EXAMPLE'),
      ),
      body: FutureBuilder<List<UserModel>>(
        future: _userFuture,
        initialData: const [],
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            if (snapshot.error is UsersNotFoundException) {
              return Text((snapshot.error as UsersNotFoundException).exception);
            }
            return const Text("Sorry looks like you took a wrong turn");
          } else {
            final user = snapshot.data!.first;
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) {
                return Center(child: Text(user.email));
              },
            );
          }
        },
      ),
    );
  }
}
