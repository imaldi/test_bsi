import 'dart:convert';
import 'dart:io';

typedef CustomerRecord = ({
  int id,
  String customerID,
  DateTime transactionDate
});

void main() {
  print("Enter input data (in json format):");
  String? input = stdin.readLineSync();
  var listFromJson = jsonDecode(input ?? "[]");
  Map<String, int> customerCountMap = {};

  // Count the occurrences of each Customer_ID
  for (var data in listFromJson) {
    var customerId = data["customerID"].toString();
    customerCountMap.update(customerId, (value) => value + 1,
        ifAbsent: () => 1);
  }

  // Sort the Customer_IDs based on count, then by ID if counts are equal
  List<MapEntry<String, int>> sortedCustomerCounts =
      customerCountMap.entries.toList()
        ..sort((a, b) {
          int compare =
              b.value.compareTo(a.value); // Sort by count (biggest to smallest)
          if (compare == 0) {
            // If counts are equal, sort by Customer_ID (ascending)
            return a.key.compareTo(b.key);
          }
          return compare;
        });

  // Print the sorted Customer_IDs and their counts
  for (var entry in sortedCustomerCounts) {
    print('Customer_ID: ${entry.key}, Total Penjualan: ${entry.value}');
  }
}
