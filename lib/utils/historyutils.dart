import 'package:flutter/material.dart';
import 'package:partner_app/utils/gyms.dart';
import 'package:partner_app/utils/users.dart';

class Utlis {
  static String fontName = 'Roboto Condensed';
  static Color deepGreen = const Color.fromRGBO(58, 118, 85, 1);
  static Color green = const Color.fromRGBO(84, 168, 121, 1);

  static List<User> users = [
    const User('example.abc@gmail.com', 'Jackson Graham', 125,
        'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=800'),
    const User('example.efg@gmail.com', 'Leslie Alex', 120,
        'https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?auto=compress&cs=tinysrgb&w=800'),
    const User('example.hig@gmail.com', 'Theressa Webb', 75,
        'https://images.pexels.com/photos/1858175/pexels-photo-1858175.jpeg?auto=compress&cs=tinysrgb&w=800'),
    const User('example.klm@gmail.com', 'Kristin Watson', 50,
        'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ];

  static List<Gyms> gyms = [
    const Gyms(
        'AOne GYm',
        '11 Aug 2020 11:56 AM',
        'https://images.pexels.com/photos/2247179/pexels-photo-2247179.jpeg?auto=compress&cs=tinysrgb&w=800',
        '4517 Washington Ave. Manchester, Kentucky39495'),
    const Gyms(
        'CA GYm',
        '10 Aug 2020 11:56 AM',
        'https://images.pexels.com/photos/897064/pexels-photo-897064.jpeg?auto=compress&cs=tinysrgb&w=800',
        '4517 Washington Ave. Manchester, Kentucky 39495'),
    const Gyms(
        'ATwo GYm',
        '9 Aug 2020 11:56 AM',
        'https://images.pexels.com/photos/703016/pexels-photo-703016.jpeg?auto=compress&cs=tinysrgb&w=800',
        '4517 Washington Ave. Manchester, Kentucky 39495'),
    const Gyms(
        'AThree GYm',
        '8 Aug 2020 11:56 AM',
        'https://images.pexels.com/photos/949131/pexels-photo-949131.jpeg?auto=compress&cs=tinysrgb&w=800',
        '4517 Washington Ave. Manchester, Kentucky  39495'),
    const Gyms(
        'AFour GYm',
        '7 Aug 2020 11:56 AM',
        'https://images.pexels.com/photos/791763/pexels-photo-791763.jpeg?auto=compress&cs=tinysrgb&w=800',
        '4517 Washington Ave. Manchester, Kentucky 39495')
  ];
}
