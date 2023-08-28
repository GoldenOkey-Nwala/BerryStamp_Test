import 'package:berrystamp_test/constants/colors.dart';
import 'package:berrystamp_test/services/api_services.dart';
import 'package:berrystamp_test/utils/snackbar_helper.dart';
import 'package:flutter/material.dart';

import '../constants/spacer.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool isLoading = true;
  List users = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final user = users as Map;
    return Scaffold(
      backgroundColor: grey,
      body: Visibility(
        visible: isLoading,
        replacement: ListView(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/users.jpg'),
                ),
              ),
            ),
            heightSpace(5),
            Center(
              child: Text(
                "user['first_name']", // + user["last_name"],
                style: TextStyle(
                  color: lightDark,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            heightSpace(3),
            Center(
              child: Text(
                'user["email"]',
                style: TextStyle(
                  color: dark,
                  fontSize: 15,
                  letterSpacing: 1,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              margin: const EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.flight_land),
                    title: const Text('Settings'),
                    trailing: const Icon(Icons.label),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.flight_land),
                    title: const Text('Information'),
                    trailing: const Icon(Icons.label),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.flight_land),
                    title: const Text('Logout'),
                    trailing: const Icon(Icons.label),
                    onTap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Future<void> fetchData() async {
    final response = await ApiServices.getData();
    if (response != null) {
      setState(() {
        isLoading = false;
        // users = response;
      });
    } else {
      showErrorMessage(context, message: 'Something went wrong.');
    }
    setState(() {
      isLoading = false;
    });
  }
}
