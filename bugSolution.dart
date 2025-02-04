```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonResponse = json.decode(response.body);
        // Check if 'data' key exists before accessing it.
        if (jsonResponse.containsKey('data')) {
          final data = jsonResponse['data'];
          print('Data fetched successfully: $data');
        } else {
          throw Exception("JSON response missing 'data' key");
        }
      } on FormatException catch (e) {
        print('Error decoding JSON: $e');
        rethrow; // Re-throw to be handled by the outer catch block
      } catch (e) {
        print('Error processing JSON response: $e');
        rethrow; // Re-throw to be handled by the outer catch block
      }
    } else {
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching data: $e');
    rethrow;
  }
}
```