import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../authentication/presentation/pages/sign_in_home_screen.dart';
import '../../onboarding/presentation/pages/select_categories.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.active)
          {
            final User? user=snapshot.data;
            return user==null ? SignInScreen() : SelectCategoriesScreen();
          }
          else
          {
            return Center(
                child: CircularProgressIndicator()
            );
          }
    });
  }
}
