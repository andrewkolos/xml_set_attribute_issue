import 'package:xml/xml.dart';
import 'package:test/test.dart';


void main() {
  // passes in 6.2.0 and 6.2.1
  test('set an attribute', () {
    final bookshelfXml = '''<?xml version="1.0"?>
        <car color="blue">
        </car>''';
    final document = XmlDocument.parse(bookshelfXml);
    final carElement = document.rootElement;
    expect(carElement.getAttribute('color'), equals('blue'));
    carElement.setAttribute('color', 'red');
    expect(carElement.getAttribute('color'), equals('red'));
  });
  // passes in 6.2.0
  // fails in 6.2.1
  test('setting attribute that contains a colon in its name', () {
    final bookshelfXml = '''<?xml version="1.0"?>
        <car color:name="blue">
        </car>''';
    final document = XmlDocument.parse(bookshelfXml);
    final carElement = document.rootElement;
    expect(carElement.getAttribute('color:name'), equals('blue'));
    // This creates another color:name
    // attribute instead of overwriting the existing one.
    carElement.setAttribute('color:name', 'red');
    expect(carElement.getAttribute('color:name'), equals('red'));
  });
}
