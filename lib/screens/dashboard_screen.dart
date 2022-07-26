import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/carousel_widget.dart';
import '../widgets/chart_widget.dart';
import '../screens/form_screen.dart';
import 'package:provider/provider.dart';
import '../providers/providerDetails.dart';

class DashboardScreen extends StatefulWidget {
  //DashboardScreen({Key? key}) : super(key: key);
  static const routeName = 'dashboard_screen';

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final detailsProvider =
        Provider.of<ProviderDetails>(context).providerDetails;

    return Scaffold(
      appBar: MyAppBar('Dashboard', false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: mediaQuery.size.height * 0.01,
            ),
            Container(
              // color: Colors.amber,
              padding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: mediaQuery.size.width * 0.12,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 1,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_a_photo,
                            color: Theme.of(context).primaryColor,
                            size: 25,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: mediaQuery.size.width * 0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tanay Banerjee',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                      SizedBox(
                        height: mediaQuery.size.height * 0.01,
                      ),
                      Text('somewhat@somewhere.com')
                    ],
                  ),
                  SizedBox(
                    width: mediaQuery.size.width * 0.05,
                  ),
                  // IconButton(
                  //   onPressed: () {
                  //     print('clicked');
                  //   },
                  //   icon: Icon(
                  //     Icons.edit,
                  //     size: 17,
                  //   ),
                  // )
                ],
              ),
            ),
            SizedBox(
              height: mediaQuery.size.height * 0.1,
            ),
            Container(
                height: mediaQuery.size.height * 0.3, child: MyChartWidget()),
            SizedBox(
              height: mediaQuery.size.height * 0.1,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Personal details',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  // Text(
                  //   'Edit',
                  //   style: TextStyle(color: Colors.blue),
                  // )
                  TextButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, FormScreen.routeName);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FormScreen()));
                    },
                    child: Text('Edit'),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('GST Number'),
                      SizedBox(
                        height: mediaQuery.size.height * 0.01,
                      ),
                      Container(
                        width: mediaQuery.size.width * 0.4,
                        height: mediaQuery.size.height * 0.05,
                        child: Center(
                            child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                    detailsProvider['data']['gstNumber']))),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xff1f1f1f),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(-4, -4),
                                blurRadius: 8,
                              )
                            ]),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Text('Aadhar Number'),
                      SizedBox(
                        height: mediaQuery.size.height * 0.01,
                      ),
                      Container(
                        width: mediaQuery.size.width * 0.4,
                        height: mediaQuery.size.height * 0.05,
                        child: Center(
                            child: FittedBox(
                                child: Text(
                                    detailsProvider['data']['aadharNumber']))),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xff1f1f1f),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(-4, -4),
                                blurRadius: 8,
                              )
                            ]),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Bank Name'),
                      SizedBox(
                        height: mediaQuery.size.height * 0.01,
                      ),
                      Container(
                        width: mediaQuery.size.width * 0.4,
                        height: mediaQuery.size.height * 0.05,
                        child: Center(
                            child: FittedBox(
                                child:
                                    Text(detailsProvider['data']['bankName']))),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xff1f1f1f),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(-4, -4),
                                blurRadius: 8,
                              )
                            ]),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Text('Account Number'),
                      SizedBox(
                        height: mediaQuery.size.height * 0.01,
                      ),
                      Container(
                        width: mediaQuery.size.width * 0.4,
                        height: mediaQuery.size.height * 0.05,
                        child: Center(
                            child: FittedBox(
                                child: Text(
                                    detailsProvider['data']['bankAccountNo']))),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xff1f1f1f),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(-4, -4),
                                blurRadius: 8,
                              )
                            ]),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: mediaQuery.size.height * 0.1,
            ),
            CarouselWidget(
              mediaQuery: mediaQuery,
              text: 'Advance Booking',
              isVideo: false,
              isBooking: true,
              isOffer: false,
            ),
            SizedBox(
              height: mediaQuery.size.height * 0.1,
            ),
            CarouselWidget(
                mediaQuery: mediaQuery,
                text: 'Offers',
                isVideo: false,
                isBooking: false,
                isOffer: true),
            SizedBox(
              height: mediaQuery.size.height * 0.15,
            ),
          ],
        ),
      ),
    );
  }
}
