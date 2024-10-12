import 'package:caht_appreview/firebase_options.dart';
import 'package:caht_appreview/views/chat_view.dart';
import 'package:caht_appreview/views/cubits/login_cubit/login_cubit.dart';
import 'package:caht_appreview/views/cubits/login_cubit/register_cubit/register_cubit.dart';
import 'package:caht_appreview/views/home_view.dart';
import 'package:caht_appreview/views/register_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ScolarApp());
}

class ScolarApp extends StatelessWidget {
  const ScolarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit(),),
        BlocProvider(create: (context) => RegisterCubit(),),
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeView.id: (context) => HomeView(),
          RegisterView.id: (context) => RegisterView(),
          ChatView.id: (context) => ChatView(),
        },
        initialRoute: HomeView.id,
      ),
    );
  }
}
