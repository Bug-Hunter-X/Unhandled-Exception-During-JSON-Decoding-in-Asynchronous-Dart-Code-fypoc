```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Process the JSON response
      final jsonResponse = json.decode(response.body);
      // Access data using the correct key
      final data = jsonResponse['data'];
      print('Data fetched successfully: $data');
    } else {
      // Handle error responses
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions during network requests
    print('Error fetching data: $e');
    // Rethrow the exception to be handled higher up
    rethrow;
  }
}
```