import 'package:flutter/material.dart';
import 'package:noun_service_app/providers/addressProvider.dart';
import 'package:provider/provider.dart';
import '../providers/changeAddress.dart';

class SelectAddress extends StatefulWidget {
  SelectAddressState createState() => SelectAddressState();
}

class SelectAddressState extends State<SelectAddress> {
  final _controller = TextEditingController();
  List<dynamic> _placesList = [];
  Map<String, dynamic> _placesId = {};
  bool isLoading = true;
  double latitude = 0.0;
  double longitude = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    inputQueryText;
    setPlaceId;
    super.initState();
  }

  void inputQueryText(String value) {
    Provider.of<ChangeLocationProvider>(context, listen: false)
        .findPlaceAutoCompleteSearch(value)
        .then((_) {
      setState(() {
        _placesList =
            Provider.of<ChangeLocationProvider>(context, listen: false).places;
      });
    });
  }

  Future<void> setPlaceId(String placeId) async {
    _placesId =
        await Provider.of<ChangeLocationProvider>(context, listen: false)
            .getLatLong(placeId);
    setState(() {
      isLoading = false;
      latitude = _placesId['result']['geometry']['location']['lat'];
      longitude = _placesId['result']['geometry']['location']['lng'];
    });

    print('Latitude $latitude');
    print('Longitude $longitude');
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScale = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: Row(
          children: [
            InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(Icons.arrow_back, color: Colors.white)),
            Expanded(
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(bottom: height * 0.006),
                  padding: EdgeInsets.only(left: width * 0.02),
                  // height: double.infinity,
                  height: height * 0.055,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                      // color: Colors.transparent,
                      // color: Colors.amber,
                      borderRadius: const BorderRadius.all(Radius.circular(14)),
                      border: Border.all(color: Colors.green, width: 2)),
                  child: Row(
                    children: [
                      Flexible(
                          flex: 9,
                          fit: FlexFit.tight,
                          child: Center(
                            child: TextField(
                              controller: _controller,
                              onChanged: (value) {
                                inputQueryText(value);
                              },
                              autofocus: true,
                              cursorColor: Colors.grey,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter Address',
                                hintStyle: TextStyle(color: Colors.white),
                                // suffixIcon: Icon(
                                //   Icons.send,
                                //   color: Colors.grey,
                                //   size: 20,
                                // )
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: height * 1,
        // color: Colors.red,
        child: ListView.builder(
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setPlaceId(_placesList[index]['place_id']).then((_) {
                print('Here Goes The Lat: $latitude');
                print('Here Goes The Lng: $longitude');
                // Provider.of<BusinessProfileProvider>(context, listen: false)
                //     .postBusinessAddress(latitude, longitude)
                //     .then((_) {
                Provider.of<LocationProvider>(context, listen: false)
                    .newAddress(latitude, longitude)
                    .then((_) {
                  Navigator.of(context).pop();
                });
                // });
              });
            },
            child: Container(
              padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
              width: double.infinity,
              height: height * 0.08,
              // color: Colors.amber,
              child: Row(
                children: [
                  const Icon(Icons.my_location, color: Colors.green),
                  SizedBox(width: width * 0.02),
                  Expanded(
                    child: Text(
                      _placesList[index]['description'],
                      // overflow: TextOverflow.visible,
                      textScaleFactor: textScale,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          itemCount: _placesList.length,
        ),
      ),
    );
  }
}
