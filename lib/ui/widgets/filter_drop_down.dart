import 'package:flutter/material.dart';

class FilterDropDown extends StatefulWidget {
  FilterDropDown({Key? key}) : super(key: key);

  @override
  _FilterDropDownState createState() => _FilterDropDownState();
}

class FilterListItem {
  int value;
  String name;
  FilterListItem(this.value, this.name);
}

class _FilterDropDownState extends State<FilterDropDown> {
  int _value = 1;
  List<FilterListItem> _dropdownItems = [
    FilterListItem(1, "All"),
    FilterListItem(2, "Hockey"),
    FilterListItem(3, "Football"),
    FilterListItem(3, "Basketball"),
    FilterListItem(3, "Baseball"),
    FilterListItem(3, "Other"),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10, right: 10),
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 5, top: 3, bottom: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.black,
          ),
          child: DropdownButton(
            dropdownColor: Colors.black,
            underline: SizedBox.shrink(),
            isDense: true,
            value: _value,
            items: _dropdownItems.map((FilterListItem item) {
              return DropdownMenuItem<int>(
                child: Text(item.name,
                    style: TextStyle(color: Colors.white, fontSize: 12)),
                value: item.value,
              );
            }).toList(),
            onChanged: (int? value) {
              setState(() {
                _value = value!;
              });
            },
          ),
        ));
  }
}
