import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const _didOnboardKey = 'onBoardingFlag';

  static const dailyAverageV4 = 'dailyAverageV4';
  static const dailyAverageV7 = 'dailyAverageV7';
  static const statisticalV4 = 'statisticalV4';
  static const statisticalV7 = 'statisticalV7';

  //Get onboard
  static Future<bool> isOnboardCompleted() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_didOnboardKey) ?? false;
    } catch (e) {
      return false;
    }
  }

  //Set onboard
  static Future<void> setOnboard({onBoard = true}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_didOnboardKey, onBoard ?? true);
  }

  static Future<void> setDailyAverageV4({double value = 0.0}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var x = prefs.getDouble(dailyAverageV4) ?? 0;
    double newValue = (x + value) / 2;
    await prefs.setDouble(dailyAverageV4, newValue);
  }

  static Future<void> setDailyAverageV7({double value = 0.0}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var x = prefs.getDouble(dailyAverageV7) ?? 0;
    double newValue = (x + value) / 2;
    await prefs.setDouble(dailyAverageV7, newValue);
  }

  static Future<double> getDailyAverageV4() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var x = prefs.getDouble(dailyAverageV4) ?? 0;
    return x;
  }

  static Future<double> getDailyAverageV7() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var x = prefs.getDouble(dailyAverageV7) ?? 0;
    return x;
  }

  static Future<void> updateStatisticalV4(double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var x = prefs.getString(statisticalV4) ?? "";
    List<double> newList = x.split(';').map((str) {
      return double.parse(str);
    }).toList();
    newList.add(value);
    String newString = newList.map((value) {
      return value.toString();
    }).join(';');
    prefs.setString(statisticalV4, newString);
  }

  static Future<void> updateStatisticalV7(double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var x = prefs.getString(statisticalV7) ?? "";
    // x = "1"
    List<double> newList = x.split(';').map((str) {
      return double.parse(str);
    }).toList();
    newList.add(value);
    String newString = newList.map((value) {
      return value.toString();
    }).join(';');
    prefs.setString(statisticalV7, newString);
  }

 static  Future<void> checkIfNewDay() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? lastCheckedDate = prefs.getString('lastCheckedDate');
    String currentDate = DateTime.now().toIso8601String().split('T').first;

    if (lastCheckedDate == null || lastCheckedDate != currentDate) {
      var lastValue = await getDailyAverageV4();
      updateStatisticalV4(lastValue);
      var lastValue2 = await getDailyAverageV7();
      updateStatisticalV7(lastValue2);

      // Update the last checked date
      await prefs.setString('lastCheckedDate', currentDate);
    }
  }
}
