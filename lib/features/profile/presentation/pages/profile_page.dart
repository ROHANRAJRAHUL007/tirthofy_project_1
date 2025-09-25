import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:tirthofy_code_1/features/profile/presentation/pages/profile_page_userdatamodel.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Future<UserModel> fetchUserDetails() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();

    return UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<UserModel>(
        future: fetchUserDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Error fetching user details"));
          }
          if (!snapshot.hasData) {
            return const Center(child: Text("No user data found"));
          }

          final user = snapshot.data!;

          return Column(
            children: [
              // Top header
              Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 40,
                    right: 20,
                    child: Icon(Icons.edit, color: Colors.white),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(user.imageUrl),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 60),

              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    ProfileTile(
                      icon: Icons.person,
                      title: "Name",
                      value: user.name,
                    ),
                    ProfileTile(
                      icon: Icons.apartment,
                      title: "Department",
                      value: user.department,
                    ),
                    ProfileTile(
                      icon: Icons.phone,
                      title: "Phone no.",
                      value: user.phone,
                    ),
                    ProfileTile(
                      icon: Icons.email,
                      title: "E-Mail",
                      value: user.email,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.teal),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
      ),
    );
  }
}
