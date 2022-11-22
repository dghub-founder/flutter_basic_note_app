import 'package:flutter/material.dart';
import 'package:note/components/config/routes.dart';
import 'package:note/pages/detail_page.dart';
import 'package:note/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:get_storage/get_storage.dart';

import 'components/config/providers.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.get(),
      child: MaterialApp(
        title: 'My note app',
        initialRoute: Routes.init(),
        routes: Routes.get(),
      ),
    );
  }
}
