import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled2/models/tags_response.dart';
import 'package:untitled2/modules/home/tab_item.dart';

void main() {
  group("Tap item test", () {
    testWidgets('TabItem Widget Test', (WidgetTester tester) async {
      // Build the TabItem widget with isSelected as false
      Tag testTag = Tag(name: 'Test tag');
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: TabItem(testTag, false),
        ),
      ));

      // Verify if the text 'Test Source' is found
      expect(find.text('Test Source'), findsOneWidget);
      // Verify if the text color is green when isSelected is false
      final Text textWidget = tester.widget(find.text('Test Source')) as Text;
      expect(textWidget.style?.color, equals(Colors.green));
    });
  });
}
