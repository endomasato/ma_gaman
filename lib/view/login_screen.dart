import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ma_gaman/models/login_model.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final LoginModel loginModel = ref.watch(LoginModelProvider);
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    String email = "";
    String password = "";

    return Scaffold(
      appBar: AppBar(
        title: Text("ログイン/新規登録"),
      ),
      body: Form(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("GA-MAN App", style: Theme
                  .of(context)
                  .textTheme
                  .headline4),
              SizedBox(height: 50,),
              SizedBox(
                width: 600,
                child: TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.ac_unit),
                    filled: true,
                    fillColor: Colors.orange,
                    labelText: "お名前",
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? value) {
                    if (value?.isEmpty == true) {
                      return "メールアドレスを入力してください";
                    }
                    return null;
                  },
                  onChanged: (String text) {
                    loginModel.userName = text;
                  },
                ),
              ),
              SizedBox(height: 50,),
              SizedBox(
                width: 600,
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.ac_unit),
                    filled: true,
                    fillColor: Colors.orange,
                    labelText: "メールアドレス",
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? value) {
                    if (value?.isEmpty == true) {
                      return "メールアドレスを入力してください";
                    }
                    return null;
                  },
                  onChanged: (String text) {
                    loginModel.email = text;
                  },
                ),
              ),
              SizedBox(height: 50,),
              SizedBox(
                width: 600,
                child: TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.ac_unit),
                      filled: true,
                      fillColor: Colors.orange,
                      labelText: "パスワード"),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  validator: (String? value) {
                    if (value?.isEmpty == true) {
                      return "パスワードを入力してください";
                    }
                    return null;
                  },
                  onChanged: (String text) {
                    loginModel.password = text;
                  },

                ),
              ),
              SizedBox(height: 50,),
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                    onPressed: () => loginModel.login(context),
                    child: Text('ログイン'),
                  ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                    onPressed: () => loginModel.createUser(context),
                    child: Text('新規登録'),
                  ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
