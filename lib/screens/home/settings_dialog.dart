import 'package:flutter/material.dart';
import '../../models/game_list_filtering_type.dart';

typedef void SettingsDialogCallback(List<bool> values, gameListFilteringType type);

class SettingsDialog extends StatefulWidget {

  final gameListFilteringType filterType;
  final SettingsDialogCallback onSubmit;
  final List<bool> setValues;

  SettingsDialog({
    Key key,
    this.filterType,
    this.onSubmit,
    this.setValues,
  }) : super(key: key);

  @override
  _SettingsDialogState createState() => _SettingsDialogState();

}

class _SettingsDialogState extends State<SettingsDialog> {

  List<bool> values = [true, true];

  @override
  void initState() {
    values = widget.setValues;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _widgets = List<Widget>();

    if (widget.filterType == gameListFilteringType.sport) {
      _widgets.add(_getCheckBox(0, "Fótbolti"));
      _widgets.add(_getCheckBox(1, "Handbolti"));
    } else if (widget.filterType == gameListFilteringType.gender) {
      _widgets.add(_getCheckBox(0, "Konur"));
      _widgets.add(_getCheckBox(1, "Karlar"));
    } else if (widget.filterType == gameListFilteringType.category) {
      _widgets.add(_getCheckBox(0, "Meistaraflokkur"));
      _widgets.add(_getCheckBox(1, "U 23"));
      _widgets.add(_getCheckBox(2, "1. flokkur"));
      _widgets.add(_getCheckBox(3, "2. flokkur"));
      _widgets.add(_getCheckBox(4, "3. flokkur"));
      _widgets.add(_getCheckBox(5, "4. flokkur"));
      _widgets.add(_getCheckBox(6, "5. flokkur"));
    }

    _widgets.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget> [
          RaisedButton(
            color: Color.fromARGB(255, 218, 29, 35),
            textColor: Colors.white,
            onPressed: () {
              Navigator.pop(context);
              widget.onSubmit(values, widget.filterType);
            },
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