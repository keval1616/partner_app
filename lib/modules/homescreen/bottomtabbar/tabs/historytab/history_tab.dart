import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partner_app/modules/homescreen/scareens/view_client.dart';
import 'package:partner_app/utils/historyutils.dart';


class HistoryTab extends StatefulWidget {
  const HistoryTab({super.key});

  @override
  State<HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  String startDate = '12 SEPTEMBER';
  String endDate = '18 SEPTEMBER 2022';
  int selected = 0;
  int income = 5125;

  Widget dateRanges() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          startDate.toUpperCase(),
          style:
              TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              )),

        const SizedBox(
          width: 5.0,
        ),
        const Text(
          '-',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          width: 5.0,
        ),
        Text(

          endDate.toUpperCase(),
          style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),

      ],
    );
  }

  Widget buttonBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //week, month, year block
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 6,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 0;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                    color: selected == 0 ? Utlis.deepGreen : Utlis.green,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(5.0),
                        topLeft: Radius.circular(5.0)),
                  ),
                  child: Center(
                    child: Text(
                      'WEEK',
                      style:  TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),

                  ),
                ),
              ),
              Container(
                width: 1.0,
                height: 39,
                decoration: BoxDecoration(color: Utlis.deepGreen),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 1;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                    color: selected == 1 ? Utlis.deepGreen : Utlis.green,
                  ),
                  child: Center(
                    child: Text(
                      'MONTH',
                      style: GoogleFonts.getFont(Utlis.fontName,
                          textStyle: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                    ),
                  ),
                ),
              ),
              Container(
                width: 1.0,
                height: 39,
                decoration: BoxDecoration(color: Utlis.deepGreen),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 2;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                    color: selected == 2 ? Utlis.deepGreen : Utlis.green,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(5.0),
                        topRight: Radius.circular(5.0)),
                  ),
                  child: Center(
                    child: Text(
                      'YEAR',
                      style: GoogleFonts.getFont(Utlis.fontName,
                          textStyle: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        //date select button
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 6,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                decoration: BoxDecoration(
                  color: Utlis.green,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(5.0),
                      topLeft: Radius.circular(5.0)),
                ),
                child: Center(
                  child: Text(
                    'DATE',
                    style: GoogleFonts.getFont(Utlis.fontName,
                        textStyle: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                  ),
                ),
              ),
              Container(
                width: 1.0,
                height: 39,
                decoration: BoxDecoration(color: Utlis.deepGreen),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                decoration: BoxDecoration(
                  color: Utlis.green,
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(5.0),
                      topRight: Radius.circular(5.0)),
                ),
                child: const Center(
                  child: Icon(
                    Icons.arrow_drop_down,
                    size: 19.0,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget emptyContainer(Color color) {
    return Container(
      width: MediaQuery.of(context).size.width - 20.0,
      height: 8.0,
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(20.0))),
    );
  }

  Widget incomeBlock() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0.1,
            blurRadius: 5,
            offset: const Offset(0, 0.75),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          emptyContainer(Colors.green.withOpacity(0.6)),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        income.toString(),
                        style: GoogleFonts.getFont(Utlis.fontName,
                            textStyle: const TextStyle(
                                fontSize: 45.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -2)),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '\$',
                        style: GoogleFonts.getFont(Utlis.fontName,
                            textStyle: const TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ],
                  ),
                  const Text('Income')
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.2),
                        shape: BoxShape.circle),
                    child: Center(
                      child: Icon(
                        Icons.arrow_upward,
                        color: Colors.green.withOpacity(0.9),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    '+106%',
                    style: TextStyle(
                        color: Colors.green.withOpacity(0.8), fontSize: 16.0),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget visiotorBlock() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 241, 203, 203),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0.1,
            blurRadius: 5,
            offset: const Offset(0, 0.75),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          emptyContainer(const Color.fromARGB(255, 132, 40, 34)),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '812',
                    style: GoogleFonts.getFont(Utlis.fontName,
                        textStyle: const TextStyle(
                            fontSize: 45.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -2)),
                  ),
                  const Text('Number of customer visited')
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 239, 159, 150),
                        shape: BoxShape.circle),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_downward,
                        color: Color.fromARGB(255, 111, 54, 54),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    '-106%',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 163, 69, 69)
                            .withOpacity(0.8),
                        fontSize: 16.0),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Client History',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              dateRanges(),
              const SizedBox(height: 10.0),
              buttonBlock(),
              const SizedBox(height: 20.0),
              incomeBlock(),
              const SizedBox(height: 15.0),
              visiotorBlock(),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'Visited',
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Text(
                    'User profile',
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              const SizedBox(height: 20.0),
              ListView.builder(
                  itemCount: Utlis.users.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ViewClient(user: Utlis.users[index])));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 50.0,
                              child: Center(
                                child: Text(
                                  '${Utlis.users[index].visiteCount}',
                                  style: const TextStyle(fontSize: 16.0),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 30.0,
                            ),
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30.0)),
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: Image.network(
                                  Utlis.users[index].profilePictureUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Utlis.users[index].name,
                                  style: const TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  Utlis.users[index].email,
                                  style: const TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
