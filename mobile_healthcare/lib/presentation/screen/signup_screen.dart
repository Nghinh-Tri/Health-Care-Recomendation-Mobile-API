import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';
import 'package:mobile_healthcare/logic/bloc/user/sign_up/sign_up_bloc.dart';
import 'package:mobile_healthcare/logic/bloc/user/sign_up/sign_up_event.dart';
import 'package:mobile_healthcare/logic/bloc/user/sign_up/sign_up_state.dart';
import 'package:mobile_healthcare/presentation/widgets/common/border_button.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends BaseState<SignUpScreen> {
  var userPhone = TextEditingController();
  var userFullname = TextEditingController();
  var chosenDate = "";
  var userPassword = TextEditingController();
  var validate = false;

  @override
  Widget build(BuildContext context) {
    _onSignUpButtonPressed() {
      if (userPhone.text.isEmpty ||
          userFullname.text.isEmpty ||
          chosenDate == "" ||
          userPassword.text.isEmpty) {
        setState(() {
          validate = !validate;
        });
      } else {
        BlocProvider.of<SignUpBloc>(context).add(
          SignUpButtonPressed(
            phone: userPhone.text,
            fullname: userFullname.text,
            dob: chosenDate,
            passwords: userPassword.text,
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        child: _appBar(context),
        preferredSize: const Size.fromHeight(Dimens.appbarHeight),
      ),
      body: BlocListener<SignUpBloc, SignUpState>(
        listener: (listenerContext, state) {
          if (state is SignUpFailure) {
            Scaffold.of(listenerContext)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(translator.text("signup_failure")),
                ),
              );
          }

          if (state is SignUpSuccess) {
            Scaffold.of(listenerContext)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  backgroundColor: Colors.blue,
                  content: Text(translator.text("signup_success")),
                ),
              );
          }
        },
        child: Container(
          height: Dimens.signupBoxHeight,
          margin: const EdgeInsets.only(
            left: Dimens.size70,
            right: Dimens.size70,
            top: Dimens.size15,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(width: Dimens.thick02),
            borderRadius: BorderRadius.circular(Dimens.size8),
          ),
          child: Column(
            children: <Widget>[
              _numberRow(
                context: context,
                icon: Icons.phone,
                label: translator.text("login_phone"),
                controller: userPhone,
              ),
              _textRow(
                context: context,
                icon: Icons.person,
                label: translator.text("user_fullname"),
                controller: userFullname,
              ),
              _dateRow(
                context,
                chosenDate,
              ),
              _passwordRow(
                context: context,
                icon: Icons.lock,
                label: translator.text("login_password"),
                controller: userPassword,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: Dimens.size5,
                ),
                child: BorderButton(
                  title: translator.text("signup"),
                  color: Theme.of(context).accentColor,
                  width: Dimens.loginButtonWidth,
                  function: _onSignUpButtonPressed,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      color: Theme.of(context).primaryColor,
      elevation: 1,
      shape: Border(
        bottom: BorderSide(
          width: Dimens.thick01,
          color: Theme.of(context).highlightColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: Dimens.size20,
          bottom: Dimens.size20,
        ),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: Dimens.size30,
              ),
              color: Theme.of(context).cardColor,
              onPressed: () => {
                Navigator.pop(context),
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: Dimens.size120,
                top: Dimens.size12,
              ),
              child: Text(
                translator.text("signup"), //for testing
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: Dimens.size20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _numberRow(
      {BuildContext context,
      IconData icon,
      String label,
      TextEditingController controller}) {
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
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: label,
                counterText: "",
                labelText: validate ? translator.text("phone_validate") : null,
                labelStyle: TextStyle(
                  color: Colors.red,
                ),
              ),
              keyboardType: TextInputType.number,
              maxLength: 10,
              textDirection: ui.TextDirection.ltr,
              controller: controller,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _textRow(
      {BuildContext context,
      IconData icon,
      String label,
      TextEditingController controller}) {
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
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: label,
                labelText:
                    validate ? translator.text("fullname_validate") : null,
                labelStyle: TextStyle(
                  color: Colors.red,
                ),
              ),
              textDirection: ui.TextDirection.ltr,
              controller: controller,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _dateRow(BuildContext context, String date) {
    final maxDay = DateTime.now().day;
    final maxMonth = DateTime.now().month;
    final minYear = DateTime.now().year - 100;
    final maxYear = DateTime.now().year - 18;
    return GestureDetector(
      onTap: () {
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
      },
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

  Widget _passwordRow(
      {BuildContext context,
      IconData icon,
      String label,
      TextEditingController controller}) {
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
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: label,
                labelText:
                    validate ? translator.text("password_validate") : null,
                labelStyle: TextStyle(
                  color: Colors.red,
                ),
              ),
              obscureText: true,
              textDirection: ui.TextDirection.ltr,
              controller: controller,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }
}
