import 'dart:io';

void main() {
  // String manipulation: Taking user input for daily water usage
  print("Enter your daily water usage in liters:");
  String input = stdin.readLineSync() ?? '0';
  
  // Manipulating string data: Converting to uppercase, extracting substring, and reversing the input
  String upperCaseUsage = input.toUpperCase();
  String subString = input.length > 3 ? input.substring(0, 3) : input;
  String reversedInput = input.split('').reversed.join();
  
  // Case conversion
  print("Uppercase Input: $upperCaseUsage");
  print("First three characters: $subString");
  print("Reversed Input: $reversedInput");
  
  // Storing results in collections
  List<String> waterData = [];
  waterData.add(input);
  
  // Adding the manipulated strings
  waterData.add(upperCaseUsage);
  waterData.add(reversedInput);
  
  print("Stored Data: $waterData");

  // Date and time operations: Logging the time of entry
  DateTime now = DateTime.now();
  print("Entry Date: ${now.toString()}");
  
  // Write the data to a file
  File logFile = File('water_usage_log.txt');
  
  try {
    logFile.writeAsStringSync(
      'Entry Time: ${now.toString()}\nData: $waterData\n\n',
      mode: FileMode.append,
    );
    print("Data successfully logged to water_usage_log.txt");
  } catch (e) {
    print("Error writing to file: $e");
  }
  
  // File reading to verify the contents
  try {
    String content = logFile.readAsStringSync();
    print("Current Log File Content:\n$content");
  } catch (e) {
    print("Error reading from file: $e");
  }
}
