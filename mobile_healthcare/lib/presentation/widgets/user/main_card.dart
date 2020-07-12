import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:mobile_healthcare/common/styles/colors.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';
import 'package:intl/intl.dart';
import 'package:mobile_healthcare/logic/bloc/user/edit/edit_bloc.dart';
import 'package:mobile_healthcare/logic/bloc/user/edit/edit_event.dart';
import 'dart:ui' as ui;
import 'package:mobile_healthcare/model/user/user.dart';

class MainCard extends StatefulWidget {
  final User user;

  MainCard({@required this.user});

  @override
  _MainCardState createState() => _MainCardState();
}

class _MainCardState extends BaseState<MainCard> {
  var status = false; //Field's status
  var chosenDate = ""; //User's birthday
  var nameController = TextEditingController(); //User's fullname

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text = widget.user.fullname;
    chosenDate = widget.user.dob;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        top: Dimens.size10,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        border: Border(
          top: BorderSide(
            style: BorderStyle.solid,
            width: Dimens.thick01,
          ),
          bottom: BorderSide(
            style: BorderStyle.solid,
            width: Dimens.thick01,
          ),
        ),
      ),
      child: Column(
        children: <Widget>[
          _numberRow(
            icon: Icons.phone,
            label: translator.text("user_phone"),
            userPhone: widget.user.phone,
          ),
          _textRow(
            icon: Icons.person,
            label: translator.text("user_fullname"),
            controller: nameController,
          ),
          _dateRow(chosenDate),
          status
              ? _editButton(
                  icon: Icons.done,
                  label: translator.text("user_save"),
                )
              : _editButton(
                  icon: Icons.edit,
                  label: translator.text("user_edit"),
                ),
        ],
      ),
    );
  }

  Widget _textRow(
      {IconData icon, String label, TextEditingController controller}) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: Dimens.thick02),
        ),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(left: Dimens.size10, right: Dimens.size5),
            child: Icon(icon),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: Dimens.size5, right: Dimens.size20),
            child: Text(
              label,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              textDirection: ui.TextDirection.ltr,
              enabled: status,
              controller: controller,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _numberRow({IconData icon, String label, String userPhone}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: Dimens.size12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: Dimens.thick02),
        ),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(left: Dimens.size10, right: Dimens.size5),
            child: Icon(icon),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: Dimens.size5, right: Dimens.size20),
            child: Text(
              label,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Text(
            userPhone,
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
    );
  }

  Widget _dateRow(String date) {
    final maxDay = DateTime.now().day;
    final maxMonth = DateTime.now().month;
    final minYear = DateTime.now().year - 100;
    final maxYear = DateTime.now().year - 18;
    return GestureDetector(
      onTap: status
          ? () {
              DatePicker.showDatePicker(
                context,
                showTitleActions: true,
                minTime: DateTime(minYear),
                maxTime: DateTime(maxYear, maxMonth, maxDay),
                onConfirm: (date) {
                  setState(() {
                    chosenDate = DateFormat("yyyy-MM-dd").format(date);
                  });
                },
                currentTime: DateTime.now(),
                locale: LocaleType.vi,
              );
            }
          : () => {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: Dimens.size12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: Dimens.thick02),
          ),
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: Dimens.size10, right: Dimens.size5),
              child: Icon(Icons.date_range),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: Dimens.size5, right: Dimens.size20),
              child: Text(
                translator.text("user_birthday"),
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Text(
              date,
              style: Theme.of(context).textTheme.headline5,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                right: Dimens.size10,
              ),
              child: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }

  void isEdit() {
    setState(() {
      if (status == true) {
        BlocProvider.of<EditBloc>(context).add(
          EditButtonPressed(
            phone: widget.user.phone,
            fullname: nameController.text,
            dob: chosenDate,
            passwords: widget.user.passwords,
            roles: widget.user.roles,
          ),
        );
      }
      status = !status;
    });
  }

  Widget _editButton({IconData icon, String label}) {
    return GestureDetector(
      onTap: isEdit,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: Dimens.size15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: Dimens.size5),
              child: Icon(
                icon,
                color: CustomColors.editButtonColor,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: Dimens.size20,
                fontWeight: FontWeight.bold,
                color: CustomColors.editButtonColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
