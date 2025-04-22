import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rapi_app/api_provider.dart';
import 'package:rapi_app/create_user_screen.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        useMaterial3: true,
      ),
      home: UserListScreen(),
    );
  }
}

class UserListScreen extends ConsumerWidget {
  const UserListScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userList = ref.watch(userLlistProvider);
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('USER LIST'))),
      body: userList.when(
        data: (users) {
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatar),
                ),
                title: Text('${user.firstName} ${user.lastName}'),
                subtitle: Text(user.email),
              );
            },
          );
        },
        error: (error, stack) => Text(error.toString()),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Row(
          children: [
            Expanded(
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateUserScreen(),),);
                },
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
