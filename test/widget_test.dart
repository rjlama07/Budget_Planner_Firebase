// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:myapp/controller/stream_controller.dart';
// import 'package:myapp/main.dart';

// void main() {
//   group('StreamGetController', () {
//     late StreamGetController controller;

//     setUp(() {
//       controller = StreamGetController();
//       controller.onInit(); // Initialize streams
//     });

//     tearDown(() {
//       controller.dispose();
//     });

//     test('generateList', () async {
//       List<int> expectedList = [];
//       for (int i = 0; i <= 100; i++) {
//         await Future.delayed(const Duration(milliseconds: 100));
//         expectedList.add(i);
//       }

//       await expectLater(
//           controller.stream1.stream, emitsInOrder([expectedList]));
//       await controller.generateList();
//     });

//     test('generateList1', () async {
//       List<int> expectedList = [];
//       for (int i = 200; i <= 300; i++) {
//         await Future.delayed(const Duration(milliseconds: 100));
//         expectedList.add(i);
//       }

//       await expectLater(
//           controller.stream2.stream, emitsInOrder([expectedList]));
//       await controller.generateList1();
//     });

//     test('generateList2', () async {
//       List<int> expectedList = [];
//       for (int i = 300; i <= 400; i++) {
//         await Future.delayed(const Duration(milliseconds: 100));
//         expectedList.add(i);
//       }

//       await expectLater(
//           controller.stream3.stream, emitsInOrder([expectedList]));
//       await controller.generateList2();
//     });
//   });

  
//   testWidgets('StreamBuilder displays data or loading indicators',
//       (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const MyHomePage());

//     // Wait for the streams to emit data.
//     await tester.pumpAndSettle(
//         const Duration(milliseconds: 100)); // Adjust the duration as needed.

//     // Verify the UI after streams emit data.

//     // Verify that CircularProgressIndicator is no longer shown.
//     expect(find.byType(ListView), findsAny);

//     // Verify the UI based on the emitted data from streams.
//   });
// }
