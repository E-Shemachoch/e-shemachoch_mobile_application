import 'package:eshemachoch_mobile_application/viewmodels/consumer/consumer_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyOTPPage extends StatefulWidget {
  const MyOTPPage({Key? key, required this.verificationId}) : super(key: key);
  final String verificationId;

  @override
  _MyOTPPageState createState() => _MyOTPPageState();
}

class _MyOTPPageState extends State<MyOTPPage> {
  final _formKey = GlobalKey<FormFieldState>();
  String? smsCode;
  @override
  Widget build(BuildContext context) {
    _signInWithSmsCode() async {
      _formKey.currentState!.save();
      var credential = PhoneAuthProvider.credential(
          verificationId: widget.verificationId, smsCode: smsCode!);

      try {
        final consumerCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        await context
            .read<ConsumerModel>()
            .loginConsumer(await consumerCredential.user!.getIdToken());
      } on FirebaseAuthException {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("The code you entered is incorrect.")));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed to login, please try again.")));
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
              'assets/confirm.png',
              width: 150,
              height: 150,
            ),
            TextFormField(
              key: _formKey,
              decoration: InputDecoration(
                label: Text('SMS Code'),
                prefixIcon: Icon(Icons.lock),
              ),
              onSaved: (value) {
                smsCode = value;
              },
            ),
            ElevatedButton(
              child: Text('Sign in'),
              onPressed: _signInWithSmsCode,
            ),
          ],
        ),
      ),
    );
  }
}
