import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sn/features/auth/auth.dart';

import 'features/home.dart';

class WrapperPage extends StatelessWidget {
  const WrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    var user = auth.currentUser;
    print(user);
    return user == null ? AuthPage() : HomePage();
  }
}
