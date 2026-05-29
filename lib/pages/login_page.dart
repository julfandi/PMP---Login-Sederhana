import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'beranda_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    if (username == "2411500008" && password == "12345") {
      //simpan session
      final pref = await SharedPreferences.getInstance();
      await pref.setBool('isLogin', true);
      await pref.setString('username', username);

      if (!mounted) return;

      // pindah ke halaman berbeda
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BerandaPage()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Login Gagal")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 100),

              //title
              const Text(
                'Login Page',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 100),

              // username
              SizedBox(
                height: 44,
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: "Masukan username",
                    hintStyle: const TextStyle(
                      color: Color(0xAAAAAAAA),
                      fontSize: 16
                    ),

                    contentPadding: const EdgeInsets.symmetric(horizontal: 14),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xAAAAAAAA)),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFF000000)),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // password
              SizedBox(
                height: 44,
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "Masukan password",
                    hintStyle: const TextStyle(
                      color: Color(0xAAAAAAAA),
                      fontSize: 16
                    ),

                    contentPadding: const EdgeInsets.symmetric(horizontal: 14),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xAAAAAAAA)),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFF000000)),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              CheckboxListTile(
                contentPadding: EdgeInsets.zero, 
                value: true,
                onChanged: (value) {},
                title: const Text("Remember Me"),
              ),

              //Button login
              SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4444FF),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Login",
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