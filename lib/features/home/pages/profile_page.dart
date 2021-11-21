import 'package:doanktl/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {

  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool cursoronav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.grey.shade50,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: MouseRegion(
                  onHover: mousetoav,
                  onExit: mouseleaveav,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://pbs.twimg.com/media/ERyF5_mW4AA9RES.jpg'),
                    child: Visibility(
                      visible: cursoronav,
                      child: IconButton(
                          padding: EdgeInsets.only(top: 10),
                          onPressed: avatarchange,
                          icon: Icon(Icons.photo_camera)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                    if (state is AuthenticationLogin) {
                      return Text(
                        state.userSigInResponse.userName,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      );
                    }
                    return Text(
                      'Username',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'Subheading',
                  style: TextStyle(fontSize: 16),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void appbarback() {}

  void avatarchange() {}

  void mousetoav(PointerHoverEvent hoverEvent) {
    setState(() {
      cursoronav = true;
    });
  }

  void mouseleaveav(PointerExitEvent exitEvent) {
    setState(() {
      cursoronav = false;
    });
  }
}
