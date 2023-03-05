import 'package:appsauri/ui/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'network/api/api_rest.dart';
import 'provider/app_provider.dart';
import 'routers/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ApiRest.configureDio();

  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => AppProvider(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TIQUEPOS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routers,
      initialRoute: SplashPage.id,
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   String title;
//   final AnimalsController _animalsController = Get.put(AnimalsController());

//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   List<String> animals = [
//     '🐸 Rana',
//     '🦁 León',
//     '🐶 Perro',
//     '🐱 Gato',
//     '🦛 Hipopótamo',
//     '🐻 Oso',
//     '🐼 Panda',
//     '🐭 Ratón',
//     '🦊 Zorro',
//     '🐨 Koala',
//     '🐷 Cerdito',
//     '🐙 Pulpo',
//     '🐬 Delfín'
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 20.0),
//             child: GestureDetector(
//               onTap: () => Get.to(
//                   ListCard()) /*Navigator.pushNamed(context, "/listcard")*/,
//               child: const Icon(
//                 Icons.list,
//                 size: 26.0,
//               ),
//             ),
//           )
//         ],
//       ),
//       body: GetX<AnimalsController>(
//           init: _animalsController,
//           builder: (AnimalsController animalsController) {
//             return ListView.builder(
//                 itemCount: animalsController.list.length,
//                 itemBuilder: (_, index) {
//                   return ListTile(
//                     title: Text(animalsController.list[index]),
//                     trailing: IconButton(
//                       onPressed: () => animalsController.remove(index),
//                       icon: const Icon(
//                         Icons.close,
//                       ),
//                     ),
//                   );
//                 });
//           }),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           var rand = Random();
//           _animalsController.add(animals[rand.nextInt(animals.length)]);
//         },
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
