// import 'dart:convert';

// import 'package:get_storage/get_storage.dart';
// import 'package:http/http.dart' as http;

// class AuthService {
//   String domain = 'https://srv.apicalfitness.com/api/';
//   var pref = GetStorage();

//   Future<bool> signIn(String email, String pass) async {
//     bool log;
//     var data = {'username': email, 'password': pass};
//     var url = Uri.parse('${domain}auth/token/');
//     final response = await http.post(url,
//         body: json.encode(data),
//         headers: headers,
//         encoding: Encoding.getByName('utf-8'));

//     if (response.statusCode == 200) {
//       Map<String, dynamic> jsonData = jsonDecode(response.body);
//       String token = jsonData['access'];
//       String refresh = jsonData['refresh'];

//       pref.write('auth', 1);
//       pref.write('email', email);
//       pref.write('password', pass);
//       pref.write('token', token);
//       pref.write('refresh', refresh);

//       log = true;
//     } else {
//       log = false;
//     }

//     return log;
//   }

//   Future<bool> logout() async {
//     bool log = false;

//     // Map<String, String> accessHeaders = {
//     //   'Content-Type': 'application/json;charset=UTF-8',
//     //   'Charset': 'utf-8',
//     //   'Authorization': pref.read('token')
//     // };

//     // var url = Uri.parse('${domain}auth/logout/');
//     // final response = await http.post(url,
//     //     headers: headers, encoding: Encoding.getByName('utf-8'));

//     // print('Status Code ${response.statusCode}');
//     // if (response.statusCode == 201) {
//     //   pref.write('auth', 0);
//     //   pref.write('email', '');
//     //   pref.write('password', '');
//     //   pref.write('token', '');
//     //   pref.write('refresh', '');

//     //   log = true;
//     // } else {
//     //   log = false;
//     // }

//     var url = Uri.parse(
//         '${domain}auth/activate/${pref.read('email')}/${pref.read('token')}/');
//     final response = await http.get(
//       url,
//       headers: {'Content-Type': 'application/json'},
//     );
//     print('Status Code ${response.statusCode}');

//     return log;
//   }

//   Map<String, String> headers = {
//     'Content-Type': 'application/json;charset=UTF-8',
//     'Charset': 'utf-8'
//   };
// }

