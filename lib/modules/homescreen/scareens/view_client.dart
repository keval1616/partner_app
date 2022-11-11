import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymui/scareens/view_history.dart';
import 'package:gymui/users.dart';
import 'package:gymui/utils.dart';
import 'package:gymui/widgets/height_spacer.dart';
import 'package:marquee/marquee.dart';

class ViewClient extends StatefulWidget {
  final User user;
  const ViewClient({super.key, required this.user});

  @override
  State<ViewClient> createState() => _ViewClientState();
}

class _ViewClientState extends State<ViewClient> {
  String lastVisite = '';

  Widget textScroll() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      decoration: const BoxDecoration(color: Colors.amberAccent),
      child: Center(
        child: Marquee(
          text: '    Access is allowed    ',
          style: const TextStyle(
              color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget visiteBlock() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: const BorderRadius.all(Radius.circular(10.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Times visited',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
                ),
                const HeightSpacer(height: 10.0),
                Text(
                  widget.user.visiteCount.toString(),
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: const BorderRadius.all(Radius.circular(10.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Last visit',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
                ),
                HeightSpacer(height: 10.0),
                Text(
                  '11 Aug 2020 11:56 AM',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'Client History',
          style: TextStyle(color: Colors.black),
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
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 130,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 220,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const HeightSpacer(height: 130.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        widget.user.name.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont(Utlis.fontName,
                            textStyle: const TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ),
                    const HeightSpacer(height: 5.0),
                    Text(
                      widget.user.email,
                      style: const TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    const HeightSpacer(height: 30.0),
                    textScroll(),
                    const HeightSpacer(height: 10.0),
                    visiteBlock(),
                    const HeightSpacer(height: 50.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ViewHistory(name: widget.user.name)));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 20.0,
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        decoration: BoxDecoration(
                            color: Utlis.green,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30.0))),
                        child: const Center(
                          child: Text(
                            'VIEW CUSTOMER HISTORY',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 10,
              child: CircleAvatar(
                radius: 110.0,
                backgroundImage: NetworkImage(
                  widget.user.profilePictureUrl,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
