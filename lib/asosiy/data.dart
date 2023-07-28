
import 'package:dio/dio.dart';

import '../navigatro.dart';

class GetUserService {
  static Future getUser() async {
    try {
      Response response = await Dio().get(NavigatorUrls.getCurrencyUrl);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        print(response.statusMessage.toString());
      }
    } on DioError catch (e) {
      print(e.message.toString());
    }
  }

  static getCurrencyUrl() {}
}
