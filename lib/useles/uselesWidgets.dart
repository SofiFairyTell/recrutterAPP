// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // throw UnimplementedError();
//     return MaterialApp(
//         home: Scaffold(
//           backgroundColor: Colors.greenAccent,
//           appBar: AppBar(
//             title: Text("HRecruter"),
//             centerTitle: true,
//           ),
//           body: Center(
//             child: Container(
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   LinearProgressIndicator(value: 23),
//                   Text(
//                     '23 %',
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   ),
//                   Text(
//                     'Приложение загружается',
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           floatingActionButton: FloatingActionButton(
//             onPressed: null,
//             child: Icon(Icons.wallet_membership),
//           ),
//         ));
//   }
// }
//
// class Active extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _ActiveState(); //реализация класса состояния
//   }
// }
//
// class _ActiveState extends State<Active> {
//   bool _loading;
//   double _progressValue;
//
//   @override
//   void initState() {
//     _loading = false;
//     _progressValue = 0.0;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//           backgroundColor: Colors.greenAccent,
//           appBar: AppBar(
//             title: Text("HRecruter"),
//             centerTitle: true,
//           ),
//           body: Center(
//             child: Container(
//               padding: EdgeInsets.all(16),
//               child: _loading
//                   ? Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   LinearProgressIndicator(value: 23),
//                   Text(
//                     '${(_progressValue * 100).round()}%',
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   )
//                 ],
//               )
//                   : Text(
//                 'Приложение загружено',
//                 style: TextStyle(color: Colors.white, fontSize: 20),
//               ),
//             ),
//           ),
//           floatingActionButton: FloatingActionButton(
//             onPressed: () {
//               setState(() {
//                 _loading = !_loading;
//                 _updateProgress();
//               });
//             },
//             child: Icon(Icons.wallet_membership),
//           ),
//         ));
//   }
//
//   void _updateProgress() {
//     const oneSec = const Duration(seconds: 1);
//     Timer.periodic(oneSec, (Timer t) {
//       setState(() {
//         _progressValue += 0.2;
//         if (_progressValue.toStringAsFixed(1) == '1.0') {
//           _loading = false;
//           t.cancel();
//           _progressValue = 0.0;
//           return;
//         }
//       });
//     });
//   }
// }
// // void main() {
// //   // runApp(MyApp());
// //   runApp(
// //     Center(
// //       child: Text(
// //         "RECRUTER",
// //         textDirection: TextDirection.ltr,
// //         style: TextStyle(
// //           fontSize: 50,
// //           background: Paint()..color = Colors.blue,
// //         ),
// //       ),
// //     ),
// //   );
// // }
// //
// // class MyApp extends StatelessWidget {
// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: MyHomePage(title: 'Второе   '),
// //     );
// //   }
// // }
// //
// // class MyHomePage extends StatefulWidget {
// //   MyHomePage({Key key, this.title}) : super(key: key);
// //
// //   final String title;
// //
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }
// //
// // class _MyHomePageState extends State<MyHomePage> {
// //   int _counter = 0;
// //
// //   void _incrementCounter() {
// //     setState(() {
// //       _counter++;
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(widget.title),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             Text(
// //               'Нажали на кнопку много раз:',
// //             ),
// //             Text(
// //               '$_counter',
// //               style: Theme.of(context).textTheme.headline4,
// //             ),
// //             Text(
// //               'А вот тут мы добавили картинку!',
// //               style: Theme.of(context).textTheme.headline4,
// //             ),
// //             Container(
// //               color: Colors.white,
// //               child: Image.network("https://picsum.photos/250?image=9"),
// //             ),
// //             Container(
// //               color: Colors.white,
// //               child: Image.asset("/owl.jpg"),
// //             ),
// //           ],
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: _incrementCounter,
// //         tooltip: 'Increment',
// //         child: Icon(Icons.add),
// //       ), // This trailing comma makes auto-formatting nicer for build methods.
// //     );
// //   }
// // }