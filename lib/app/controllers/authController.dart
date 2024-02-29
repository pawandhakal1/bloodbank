import 'package:bloodbank/resource/screens/homeScreen.dart';
import 'package:bloodbank/resource/screens/verifyScreen.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

class AuthController extends GetxController {
  var logger = Logger(
    filter: null,
    printer: PrettyPrinter(),
    output: null,
  );
  RxString token = ''.obs;
  final box = GetStorage();
  Dio _dio = Dio();
  void registerUser(
      String name,
      String email,
      String phone,
      String gender,
      String dob,
      String blood,
      String province,
      String district,
      String city,
      String password) async {
    Map<String, dynamic> register = {
      'name': name,
      'email': email,
      'phone': phone,
      'gender': gender,
      'dob': dob,
      'blood_group': blood,
      'province': province,
      'district': district,
      'city': city,
      'password': password,
      'password_confirmation': password,
    };
    printInfo(info: register.toString());
    try {
      String apiUrl = 'http://192.168.1.151:8000/api/register';
      var response = await _dio.post(
        apiUrl,
        data: register,
      );
      logger.i(response);
      if (response.statusCode == 201) {
        box.write('token', response.data["token"]);
        Get.offAll(VerifyPage());
        Get.snackbar("Sucess", "Registration Successfull");
      } else {
        logger.i('Registration failed. Status code: ${response.statusCode}');
        Get.snackbar("Error", "Registration error");
      }
    } catch (e) {
      logger.e('Error during registration: $e');
    }
  }

  void logIn(String email, String password) async {
    Map<String, dynamic> userLogin = {'email': email, 'password': password};
    printInfo(info: userLogin.toString());
    try {
      String apiUrl = "http://192.168.1.151:8000/api/login";
      var response = await _dio.post(apiUrl,
          data: userLogin,
          options: Options(headers: {
            'Accept': 'application/json',
          }));
      if (response.statusCode == 200) {
        var responseData = response.data;
        if (responseData.containsKey('token')) {
          token.value = responseData['token'];
          box.write('token', response.data["token"]);
          Get.offAll(() => HomeScreen());
          print('LogIn successful. Token: $token');
          Get.snackbar("Success", "Log In Successfull");
        } else {
          print('Token not found in the response data.');
        }
      } else {
        print('LogIn failed. Status code: ${response.statusCode}');
        Get.snackbar("Error", "Log in error");
      }
    } catch (e) {
      logger.e('Error during login: $e');
    }
  }

  void verifyphone(String pin) async {
    Map<String, dynamic> verify = {'otp': pin};
    try {
      String apiUrl = 'http://192.168.1.151:8000/api/phone/verify';
      var token = box.read('token');
      if (token == null) {
        print('Token is null. User not authenticated.');
        return;
      }
      logger.i('response');
      var response = await _dio.post(apiUrl,
          data: verify,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          }));
      if (response.statusCode == 200) {
        Get.offAll(() => const HomeScreen());
        Get.snackbar("Sucess", "You register successfully");
      } else {
        logger.i('LogIn failed. Status code: ${response.statusCode}');
        Get.snackbar("Error", "invalid otp");
      }
    } on DioException catch (e) {
      print('Error details: ${e.error}');
    }
  }
}
