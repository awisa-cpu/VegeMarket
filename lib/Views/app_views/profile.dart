import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Controllers/auth/auth_bloc_controller.dart';
import 'package:shopcart/Controllers/auth/auth_event.dart';
import 'package:shopcart/models/auth_user.dart';
import 'package:shopcart/services/auth/auth_service.dart';
import 'package:shopcart/utilities/dialogs/signout_dialog.dart';
import '../../utilities/widgets/container_deco.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AuthUser? get user => AuthService.fromFirebase().currentUser;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;

    //
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text(
          'Profile Settings',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),

      //
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //user details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //initials
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //full name
                    const Text(
                      'Daniel Akinola',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    //email
                    Text(user?.email ?? ''),

                    //status
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: user!.isEmailVerified
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),

                        const SizedBox(
                          width: 15,
                        ),
                        //
                        Text(
                            user!.isEmailVerified ? 'Verified' : 'Not Verified')
                      ],
                    )
                  ],
                ),

                //profile image
                CircleAvatar(
                  radius: 35.5,
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    backgroundImage: const AssetImage(
                      'lib/images/profile.jpeg',
                    ),
                    radius: 30.5,
                  ),
                )
              ],
            ),

            const SizedBox(
              height: 15.5,
            ),

            //profile editor
            GestureDetector(
              onTap: () async {
                await _showProfileEdit(context, color);
              },
              child: Container(
                width: 100,
                height: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Edit profile',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )

            //
            ,
            const SizedBox(
              height: 25,
            ),

            const Text(
              'Details',
              style: TextStyle(fontSize: 17),
            ),

            //details section
            const ListTile(
              leading: ContainerDeco(icon: Icon(Icons.abc_sharp)),
              title: Text('Name'),
              trailing: Text('Daniel Akinola'),
            ),
            Divider(
              color: color,
            ),
            //
            const ListTile(
              leading: ContainerDeco(icon: Icon(Icons.abc_rounded)),
              title: Text(
                'User Name',
              ),
              trailing: Text('Daniel Akinola'),
            ),
            Divider(
              color: color,
            ),

            //
            const ListTile(
              leading: ContainerDeco(icon: Icon(Icons.phone)),
              title: Text('Phone Number'),
              trailing: Text('08028824153'),
            ),
            Divider(
              color: color,
            ),

            //
            ListTile(
              leading: const ContainerDeco(icon: Icon(Icons.email_outlined)),
              title: const Text('Email'),
              trailing: Text(user?.email ?? ''),
            ),
            Divider(
              color: color,
            ),

            //logout
            ListTile(
              leading: const ContainerDeco(icon: Icon(Icons.logout)),
              title: const Text('Log out'),
              trailing: IconButton(
                enableFeedback: false,
                onPressed: _logout,
                icon: const Icon(Icons.chevron_right),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _showProfileEdit(BuildContext context, Color color) {
    return showModalBottomSheet(
      context: context,
      elevation: 1,
      isScrollControlled: true,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const SizedBox(
                  height: 15.9,
                ),

                //title and back button
                Row(
                  children: [
                    //
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back),
                    ),

                    const SizedBox(
                      width: 80.5,
                    ),
                    //
                    const Text(
                      'Your profile',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),

                //
                const SizedBox(
                  height: 10.5,
                ),

                //profile image
                CircleAvatar(
                  radius: 60.5,
                  child: CircleAvatar(
                    backgroundColor: color,
                    backgroundImage: const AssetImage(
                      'lib/images/profile.jpeg',
                    ),
                    radius: 55.5,
                  ),
                ),

                //
              ],
            ),
          ),
        );
      },
    );
  }

  void _logout() async {
    final value = await showSignOutDialog(
      context: context,
      title: "Sign Out ",
      content: "Are you sure you want to sign out?",
    );

    //
    if (value != null && value == true) {
      Future.delayed(
        Duration.zero,
      ).then((_) {
        context.read<AuthenticationBloc>().add(AuthEventSignOut());
      });
    }
  }
}
