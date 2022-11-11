import 'package:flutter/material.dart';
import 'package:partner_app/modules/homescreen/bottomtabbar/tabs/aboutustab/aboutuscontroller.dart';


class AboutUsTab extends StatefulWidget {
  const AboutUsTab({super.key});

  @override
  State<AboutUsTab> createState() => _AboutUsTabState();
}

class _AboutUsTabState extends State<AboutUsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'About Us',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut',
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(height: 15.0),
              const Text(
                'Do Workout everywhere',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 15.0),
              const Text(
                'Our partners have gyms throughout the United States',
                style: TextStyle(fontSize: 15.0, color: Colors.grey),
              ),
              SizedBox(height: 10.0),
              SizedBox(
                width: MediaQuery.of(context).size.width - 20,
                height: 200.0,
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image:
                      'https://images.pexels.com/photos/41949/earth-earth-at-night-night-lights-41949.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20.0),
              const Text(
                'Do Workout everywhere',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 15.0),
              const Text(
                'The number of our customers has reached 400000',
                style: TextStyle(fontSize: 15.0, color: Colors.grey),
              ),
              SizedBox(height: 10.0),
              SizedBox(
                width: MediaQuery.of(context).size.width - 20,
                height: 200.0,
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image:
                      'https://images.pexels.com/photos/1954524/pexels-photo-1954524.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20.0),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
