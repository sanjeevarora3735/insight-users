import 'package:flutter/material.dart';

import '../../../model/users_info.dart';

class UserProfilePage extends StatelessWidget {
  dynamic args;

  UserProfilePage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    final user = args['user'] as User;
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        backgroundColor: Colors.white70,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 60,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blueAccent,
                  child: Text(
                    user.name[0].toUpperCase(),
                    style: const TextStyle(fontSize: 40, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              user.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '@${user.username}',
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            const Divider(),
            ListTile(
              title: const Text('Email'),
              subtitle: Text(user.email),
            ),
            ListTile(
              title: const Text('Phone'),
              subtitle: Text(user.phone),
            ),
            ListTile(
              title: const Text('Website'),
              subtitle: Text(user.website),
            ),
            const Divider(),
            ListTile(
              title: const Text('Address'),
              subtitle: Text('${user.address.street}, ${user.address.suite}, ${user.address.city}, ${user.address.zipcode}'),
            ),
            ListTile(
              title: const Text('Geo Coordinates'),
              subtitle: Text('Lat: ${user.address.geo.lat}, Lng: ${user.address.geo.lng}'),
            ),
            const Divider(),
            ListTile(
              title: const Text('Company'),
              subtitle: Text(user.company.name),
            ),
            ListTile(
              title: const Text('Catch Phrase'),
              subtitle: Text(user.company.catchPhrase),
            ),
            ListTile(
              title: const Text('BS'),
              subtitle: Text(user.company.bs),
            ),
          ],
        ),
      ),
    );
  }
}
