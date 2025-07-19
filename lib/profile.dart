import 'package:cyanaseapp/change_photo.dart';
import 'package:cyanaseapp/nkin.dart';
import 'package:cyanaseapp/subscribe.dart';
import 'package:flutter/material.dart';

// Simulated API calls
Future<Map<String, dynamic>> fetchUserData() async {
  await Future.delayed(Duration(milliseconds: 300));
  return {
    'name': 'John Doe',
    'phone': '+1234567890',
    'email': 'john.doe@example.com',
    'country': 'KE',
    'profilePicture': 'https://via.placeholder.com/150',
  };
}

Future<String> fetchSubscriptionStatus() async {
  await Future.delayed(Duration(milliseconds: 200));
  return 'subscribed';
}

Future<Map<String, String>> fetchNextOfKin() async {
  await Future.delayed(Duration(milliseconds: 200));
  return {
    'name': 'Jane Doe',
    'phone': '+9876543210',
    'email': 'jane.doe@example.com',
  };
}

// ... your existing imports remain the same

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  late Future<void> _loadData;
  String? _loadError;

  String name = '';
  String phone = '';
  String email = '';
  String country = '';
  String profilePicture = '';
  String subStatus = '';
  String kinName = '';
  String kinPhone = '';
  String kinEmail = '';

  @override
  void initState() {
    super.initState();
    _loadData = _fetchAll();
  }

  Future<void> _fetchAll() async {
    try {
      final user = await fetchUserData();
      final sub = await fetchSubscriptionStatus();
      final kin = await fetchNextOfKin();

      setState(() {
        name = user['name'];
        phone = user['phone'];
        email = user['email'];
        country = user['country'];
        profilePicture = user['profilePicture'] ?? '';
        subStatus = sub;
        kinName = kin['name'] ?? '';
        kinPhone = kin['phone'] ?? '';
        kinEmail = kin['email'] ?? '';
        _loadError = null;
      });
    } catch (e) {
      setState(() {
        _loadError = "Failed to load data: ${e.toString()}";
      });
    }
  }

  void _showBottomSheet(Widget child) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder:
          (context) => DraggableScrollableSheet(
            expand: false,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                padding: const EdgeInsets.all(16),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width,
                  ),
                  child: IntrinsicWidth(child: child),
                ),
              );
            },
          ),
    );
  }

  Widget _infoTile(IconData icon, String title, String value) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(
        value,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _loadData,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }

        if (_loadError != null) {
          return Center(
            child: Container(
              decoration: BoxDecoration(color: Colors.grey[100]),
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 48),
                  const SizedBox(height: 12),
                  Text(
                    _loadError!,
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() => _loadData = _fetchAll());
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text("Retry"),
                  ),
                ],
              ),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            leading: const BackButton(),
            title: const Text("Account Details"),
          ),
          body: Container(
            color:
                Colors.grey[100], // 🔹 background color for entire scroll view
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  /// 🔹 Profile Info Card
                  Card(
                    color: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                              'assets/images/night.jpeg',
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.camera_alt),
                            onPressed:
                                () => _showBottomSheet(ChangePhotoForm()),
                          ),
                          const SizedBox(height: 8),
                          _infoTile(Icons.account_circle, "Name", name),
                          _infoTile(Icons.phone, "Phone", phone),
                          _infoTile(Icons.email, "Email", email),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 4),

                  /// 🔹 Subscription Card
                  Card(
                    color: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      title: const Text(
                        "Account Subscription:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: GestureDetector(
                        onTap:
                            () => _showBottomSheet(
                              Subscribe(
                                country: country,
                                name: name,
                                email: email,
                                phone: phone,
                                substatus: subStatus,
                              ),
                            ),
                        child: Text(
                          subStatus,
                          style: const TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 4),

                  /// 🔹 Next of Kin Card
                  Card(
                    color: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            "Next Of Kin Details",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          _infoTile(
                            Icons.account_circle_outlined,
                            "Name",
                            kinName,
                          ),
                          _infoTile(Icons.call_outlined, "Phone", kinPhone),
                          _infoTile(Icons.email_outlined, "Email", kinEmail),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () => _showBottomSheet(NKinForm()),
                            child: const Text("Change Next of Kin"),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
