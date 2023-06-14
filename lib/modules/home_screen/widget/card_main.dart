import 'package:flutter/material.dart';

class CardMain extends StatelessWidget {
  const CardMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        height: 120,
        width: MediaQuery.of(context).size.width * .95,
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: const Text(
                            'Total Knee replacement',
                            style: TextStyle(
                              color: Color(0xff124164),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              letterSpacing: .14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Icon(Icons.more_vert)
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ImageIcon(
                            AssetImage("assets/images/calender.png"),
                            color: Color(0xff124164),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              '3:00 PM, Oct 23,2022',
                              style: TextStyle(
                                color: Color(0xff124164),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                letterSpacing: .14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 26.0,
                            height: 26.0,
                            decoration: BoxDecoration(
                              color: const Color(0xff7c94b6),
                              image: const DecorationImage(
                                image:
                                    AssetImage('assets/images/doctorImg.png'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50.0)),
                              border: Border.all(
                                color: const Color(0xff21D59B),
                                width: 2.0,
                              ),
                            ),
                          ),
                          const Text(
                            'Dr.James',
                            style: TextStyle(
                              color: Color(0xff124164),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              letterSpacing: .14,
                            ),
                          ),
                          Container(
                            width: 26.0,
                            height: 26.0,
                            decoration: BoxDecoration(
                              color: const Color(0xff7c94b6),
                              image: const DecorationImage(
                                image:
                                    AssetImage('assets/images/doctor2Img.png'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50.0)),
                              border: Border.all(
                                color: const Color(0xff21D59B),
                                width: 2.0,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Dr.James',
                              style: TextStyle(
                                color: Color(0xff124164),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                letterSpacing: .14,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              '5 +',
                              style: TextStyle(
                                color: Color(0xff124164),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                letterSpacing: .14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const ImageIcon(AssetImage('assets/images/icon_arrow.png'))
            ],
          ),
        ),
      ),
    );
  }
}
