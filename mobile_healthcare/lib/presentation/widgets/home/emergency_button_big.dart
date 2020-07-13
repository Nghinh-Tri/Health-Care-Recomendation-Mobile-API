import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobile_healthcare/common/styles/colors.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';
import 'package:mobile_healthcare/logic/bloc/facility/emergency/emergency_event.dart';
import 'package:mobile_healthcare/logic/utility/location.dart';
import 'package:mobile_healthcare/model/user/user_location.dart';

class EmergencyButtonBig extends StatefulWidget {
  @override
  _EmergencyButtonBigState createState() => _EmergencyButtonBigState();
}

class _EmergencyButtonBigState extends BaseState<EmergencyButtonBig> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _emergencyButton(),
        _buttonLabel(),
      ],
    );
  }

  Widget _emergencyButton() {
    return FutureBuilder(
        future: getPosition(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }

          final location = snapshot.data;

          return Padding(
            padding: const EdgeInsets.only(top: Dimens.size150),
            child: GestureDetector(
              onLongPress: () => {
                BlocProvider.of<>(context).add(EmergencyPress(location: location))
              },
              child: ClipOval(
                child: Container(
                  color: CustomColors.emergencyButton,
                  height: Dimens.size120,
                  width: Dimens.size120,
                  child: Icon(
                    Icons.phone,
                    color: CustomColors.phoneIcon,
                    size: Dimens.size60,
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget _buttonLabel() {
    return Padding(
      padding: const EdgeInsets.only(top: Dimens.size20),
      child: Center(
        child: Text(
          translator.text("emergency_button_label"),
          style: TextStyle(
            fontSize: Dimens.size25,
            color: CustomColors.emergencyButton,
          ),
        ),
      ),
    );
  }
}
