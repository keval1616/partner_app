import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gymui/gyms.dart';
import 'package:gymui/utils.dart';
import 'package:gymui/widgets/height_spacer.dart';

class GymDetails extends StatefulWidget {
  final Gyms gyms;
  const GymDetails({super.key, required this.gyms});

  @override
  State<GymDetails> createState() => _GymDetailsState();
}

class _GymDetailsState extends State<GymDetails> {
  List<String> banners = [
    'https://images.pexels.com/photos/2247179/pexels-photo-2247179.jpeg?auto=compress&cs=tinysrgb&w=800',
    'https://images.pexels.com/photos/897064/pexels-photo-897064.jpeg?auto=compress&cs=tinysrgb&w=800'
  ];
  List<String> sports = [
    'ACROBATIC SPORTS',
    'WATER SPORTS',
    'ACROBATIC SPORTS',
    'WATER SPORTS'
  ];

  final TextStyle _textStyle = const TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black);

  late GoogleMapController mapController;

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  Widget bannerBlock() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 180.0,
      child: ListView.builder(
          itemCount: banners.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 180.0,
              margin: const EdgeInsets.only(left: 10.0),
              child: Image.network(
                banners[index],
                fit: BoxFit.cover,
              ),
            );
          }),
    );
  }

  Widget nameBlock() {
    return Container(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.gyms.name,
              style: GoogleFonts.getFont(Utlis.fontName,
                  textStyle: const TextStyle(
                    fontSize: 30.0,
                    letterSpacing: -1,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            const HeightSpacer(height: 10.0),
            SizedBox(
              height: 25.0,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: sports.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10.0),
                      margin: const EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                          border: Border.all(width: 1.0, color: Utlis.green)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sports_gymnastics,
                            color: Utlis.green,
                            size: 15.0,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            sports[index].toUpperCase(),
                            style:
                                TextStyle(fontSize: 12.0, color: Utlis.green),
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ));
  }

  Widget operationHours() {
    return Container(
      margin: const EdgeInsets.only(left: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gym operation hours',
            style: _textStyle,
          ),
          const HeightSpacer(height: 10.0),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: <TextSpan>[
              TextSpan(text: "Mon - Fr: ", style: _textStyle),
              const TextSpan(
                text: '06:00 AM - 11:00 PM',
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ]),
          ),
          const HeightSpacer(height: 10.0),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: <TextSpan>[
              TextSpan(text: "Sa: ", style: _textStyle),
              const TextSpan(
                text: '12:00 AM - 09:00 PM',
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ]),
          ),
          const HeightSpacer(height: 10.0),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: <TextSpan>[
              TextSpan(text: "Sun: ", style: _textStyle),
              const TextSpan(
                text: 'Closed',
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget contactsBlock() {
    return Container(
      margin: const EdgeInsets.only(left: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contacts',
            style: _textStyle,
          ),
          const HeightSpacer(height: 10.0),
          const Text('bill.sanders@abc.com',
              style: TextStyle(fontSize: 18.0, color: Colors.black)),
          const HeightSpacer(height: 10.0),
          const Text('(308) 555-0102',
              style: TextStyle(fontSize: 18.0, color: Colors.black)),
          const HeightSpacer(height: 10.0),
          const Text('(207) 555-0119',
              style: TextStyle(fontSize: 18.0, color: Colors.black))
        ],
      ),
    );
  }

  Widget addressBlock() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Address',
            style: _textStyle,
          ),
          const HeightSpacer(height: 10.0),
          const Text('2715 Ash Dr. San Jose, South Dakota 83475',
              style: TextStyle(fontSize: 18.0, color: Colors.black)),
          const HeightSpacer(height: 10.0),
          SizedBox(
            width: MediaQuery.of(context).size.width - 20,
            height: 180.0,
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                  target: LatLng(38.35822, -106.1275), zoom: 11.5),
              zoomControlsEnabled: false,
              myLocationEnabled: false,
              markers: {
                Marker(
                  markerId: const MarkerId('marker'),
                  infoWindow: const InfoWindow(title: 'Location'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueRed),
                  position: const LatLng(38.35822, -106.1275),
                )
              },
              onMapCreated: (controller) => mapController = controller,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.gyms.name,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeightSpacer(height: 10.0),
            bannerBlock(),
            const HeightSpacer(height: 10.0),
            nameBlock(),
            const HeightSpacer(height: 15.0),
            Container(
              padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.only(left: 10.0),
              width: 90.0,
              decoration: BoxDecoration(
                color: Utlis.green,
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              ),
              child: const Center(
                child: Text(
                  'SAVE GYM',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const HeightSpacer(height: 20.0),
            operationHours(),
            const HeightSpacer(height: 30.0),
            contactsBlock(),
            const HeightSpacer(height: 30.0),
            addressBlock(),
          ],
        ),
      ),
    );
  }
}
