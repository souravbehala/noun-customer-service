import 'package:flutter/material.dart';
import 'package:noun_service_app/widgets/bottom_navigation_bar.dart';
import '../providers/stationNameList.dart';
import 'package:provider/provider.dart';

class DropdownWidget extends StatefulWidget {
  //DropdownWidget({Key? key}) : super(key: key);
  final List<dynamic> dataList;

  DropdownWidget(this.dataList);

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  var _selectedItem;
  late String hintText;

  @override
  void initState() {
    // TODO: implement initState
    hintText = widget.dataList[0]['stationName'];
    super.initState();
  }

  // @override
  // void initState() {
  //   _selectedItem = widget.dataList[0]['stationName'];
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: _selectedItem,
          hint: Text(
            // widget.dataList[0]['stationName'],
            hintText,
            style: TextStyle(color: Colors.white),
          ),
          items: widget.dataList
              .map((item) => DropdownMenuItem(
                    child: Text(
                      item['stationName'],
                    ),
                    value: item['id'].toString(),
                  ))
              .toList(),
          onChanged: (item) async {
            setState(() {
              _selectedItem = item;
            });
            print('Selected Station: $_selectedItem');
            var response =
                await Provider.of<StationNameList>(context, listen: false)
                    .getStationDetails(_selectedItem == null
                        ? int.parse(widget.dataList[0]['id'])
                        : int.parse(_selectedItem));
            // Navigator.of(context).push(
            //     MaterialPageRoute(builder: (context) => BottomNavigation()));
          },
        ),
      ),
    );
  }
}
