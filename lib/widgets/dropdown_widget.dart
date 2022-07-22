import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
  //DropdownWidget({Key? key}) : super(key: key);
  final List<dynamic> dataList;

  DropdownWidget(this.dataList);

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  var _selectedItem;

  // @override
  // void initState() {
  //   _selectedItem = widget.dataList[0]['stationName'];
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: _selectedItem,
          hint: Text(
            widget.dataList[0]['stationName'],
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
          onChanged: (item) {
            setState(() {
              _selectedItem = item;
            });
            print('Selected Station: $_selectedItem');
          },
        ),
      ),
    );
  }
}
