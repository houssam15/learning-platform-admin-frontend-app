import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:licence_driving_admin/core/constants/hive_boxes.dart';
import 'package:licence_driving_admin/features/authentication_management/data/models/user.model.dart';
import 'package:licence_driving_admin/features/authentication_management/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:licence_driving_admin/features/authentication_management/presentation/bloc/authentication/authentication_event.dart';
import 'package:licence_driving_admin/features/authentication_management/presentation/pages/authentication.page.dart';
import 'package:licence_driving_admin/hive/hive_registrar.g.dart';
import 'package:licence_driving_admin/injection_container.dart';

import 'features/authentication_management/presentation/bloc/login/login_bloc.dart';
//import 'package:flutter_localization/flutter_localization.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapters();
  await Hive.openBox<UserModel>(userBox);
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
          title: "Driving Licence Authentication",
          theme: ThemeData(primarySwatch: Colors.blue),
          initialRoute: "/",
          routes: {
            "/": (context) => AuthenticationPage(),
            "/dashboard": (context) => Container()
          }
        );
  }
}
