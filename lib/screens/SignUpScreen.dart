import 'package:flutter/material.dart';
import 'package:recrutterapp/screens/Widgets/PhotoWidget.dart';
// import 'package:firebase_storage/firebase_storage.dart';

class SignUpScreen extends StatefulWidget {
  const   SignUpScreen({required Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreen();
}


class _SignUpScreen extends State<SignUpScreen>  {

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  Future<void> signUp()
  async {
    final navigator = Navigator.of(context);
    navigator.pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // PhotoWidget
              Center(
                child: PhotoWidget(
                  photoUrl: 'assets/images/owl.jpg',
                  onPressed: () => print('Photo was tapped'),
                ),
              ),

              // Full name text field
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'ФИО',
                    prefixIcon: Icon(Icons.person),
                  ),
                  controller: nameController,
                ),
              ),

              // Email text field
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'EMAIL',
                    prefixIcon: Icon(Icons.email),
                  ),
                  controller: emailController,
                ),
              ),

              // Password text field
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Пароль',
                    prefixIcon: Icon(Icons.lock),
                  ),
                    controller: passwordController,
                ),
              ),

              // Register button
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    SizedBox(width: 8), // Пространство между кнопками
                    ElevatedButton(
                      onPressed: () => signUp(),
                      child: Text('Регистрация'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
         ],),
    ),

    );
  }

void imgOnTap(BuildContext context)
{
  // var test = uploadFileToFirebaseStorage;

}
  // Удалено в следствие нвозможности соединится с FireBase :( Проблема версий?
  // Future<String> uploadFileToFirebaseStorage() async {
  //   try {
  //     // Создаем ссылку на экземпляр Firebase Storage
  //     FirebaseStorage storage = FirebaseStorage.instance;
  //
  //     // Создаем ссылку на путь назначения файла в Firebase Storage
  //     Reference storageRef = storage.ref().child('owl.jpg');
  //
  //     // Загружаем файл в Firebase Storage
  //     UploadTask uploadTask = storageRef.putString('assets/images/owl.jpg');
  //
  //     // Ждем завершения загрузки файла и получаем URL-адрес загруженного файла
  //     TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
  //     String downloadUrl = await taskSnapshot.ref.getDownloadURL();
  //
  //     // Возвращаем URL-адрес загруженного файла
  //     return downloadUrl;
  //   } catch (e) {
  //     // Обрабатываем ошибку, если загрузка не удалась
  //     print('Ошибка при загрузке файла в Firebase Storage: $e');
  //     return null;
  //   }
  // }
}
