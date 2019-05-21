import 'package:flutter/material.dart';
import '../../models/game_list_filtering_type.dart';

class SettingsDialog extends StatefulWidget {

  final gameListFilteringType filterType;

  SettingsDialog({
    Key key,
    this.filterType
  }) : super(key: key);

  @override
  _SettingsDialogState createState() => _SettingsDialogState();

}

class _SettingsDialogState extends State<SettingsDialog> {

  List<bool> values = [true, true];

  @override
  Widget build(BuildContext context) {
    var _widgets = List<Widget>();

    if (widget.filterType == gameListFilteringType.sport) {
      _widgets.add(_getCheckBox(0, "Fótbolti"));
      _widgets.add(_getCheckBox(1, "Handbolti"));
    } else if (widget.filterType == gameListFilteringType.category) {
      _widgets.add(_getCheckBox(0, "Meistaraflokkur karla"));
      _widgets.add(_getCheckBox(1, "Meistaraflokkur kvenna"));
    }

    _widgets.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget> [
          RaisedButton(
            color: Color.fromARGB(255, 218, 29, 35),
            textColor: Colors.white,
            onPressed: () {},
            child: Text("Vista stillingar")
          )
        ]
      )
    );

    return SimpleDialog(
      title: Text(
        (widget.filterType == gameListFilteringType.sport ? "ÍÞRÓTTAGREINAR" : "FLOKKAR")
      ),
      children: _widgets,
    );
  }

  Widget _getCheckBox(int indx, String label) {
    return Row(
      children: <Widget>[
        Checkbox(
          value: values[indx],
          onChanged: (bool value) {
            setState(() { values[indx] = value; });
          },
        ),
        Text(label),
      ],
    );
  }

}