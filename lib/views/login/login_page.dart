import 'package:eshemachoch_mobile_application/viewmodels/consumer/consumer_model.dart';
import 'package:eshemachoch_mobile_application/views/login/otp_page.dart';
import 'package:eshemachoch_mobile_application/views/login/unregistered_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final fieldKey = GlobalKey<FormFieldState>();
  String? phoneNumber;
  @override
  Widget build(BuildContext context) {
    handleLogin() async {
      fieldKey.currentState!.save();
      await FirebaseAuth.instance.signOut();
      bool phoneRegistered =
          await context.read<ConsumerModel>().checkExistence(phoneNumber!);
      if (phoneRegistered) {
        FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phoneNumber!,
          verificationCompleted: (credential) async {
            final consumerCredential =
                await FirebaseAuth.instance.signInWithCredential(credential);

            await context
                .read<ConsumerModel>()
                .loginConsumer(await consumerCredential.user!.getIdToken());
          },
          verificationFailed: (e) {},
          codeSent: (verificationId, resendToken) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MyOTPPage(verificationId: verificationId)),
            );
          },
          codeAutoRetrievalTimeout: (verificaitonId) {},
        );
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MyUnregisteredPage()));
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/login.png',
              width: 150,
              height: 150,
            ),
            Column(
              children: [Text('WELCOME TO E-SHEMACHOCH')],
            ),
            TextFormField(
              key: fieldKey,
              decoration: InputDecoration(
                label: Text('Phone Number'),
                prefixIcon: Icon(Icons.phone),
              ),
              onSaved: (value) {
                phoneNumber = value;
              },
            ),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () async {
                try {
                  await handleLogin();
                } catch (_) {
                  ScaffoldMessenger.of(context)
                    ..showSnackBar(SnackBar(
                        content: Text("Failed to login, please try again.")));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
