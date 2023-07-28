import 'package:flutter/material.dart';

import 'asosiy/data.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
      ),
      body: FutureBuilder(
        future: GetUserService.getUser(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    snapshot.data[index]["name"],
                  ),
                  subtitle: Text(snapshot.data[index]["id"]),
                  leading: const CircleAvatar(
                    radius: 20,
                  ),
                );
              },
              itemCount: (snapshot.data as List).length,
            );
          }
        },
      ),
    );
  }
}
