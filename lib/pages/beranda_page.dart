import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  Future<void> logout(BuildContext context) async {
    //menghapus session
    final pref = await SharedPreferences.getInstance();
    await pref.remove('isLogin');

    if (!context.mounted) return;

    //akan di pindahkan ke halaman login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      );
  }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 200),

              //title
              const Text(
                'hallo \n'
                'Selamat Datang Admin',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 79),

              //Button logout
              SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton(
                  onPressed: () => logout(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFA3C3C),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 16, 
                      color:  Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            ],  
          ),
         ),
      ),
    );
   }
  }


