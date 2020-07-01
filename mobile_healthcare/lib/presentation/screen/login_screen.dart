import 'package:flutter/material.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';
import 'package:mobile_healthcare/presentation/widgets/common/border_button.dart';

class LoginScreen extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userPhone = TextEditingController();
    var userPassword = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        child: _appBar(context),
        preferredSize: const Size.fromHeight(Dimens.appbarHeight),
      ),
      body: Container(
        height: Dimens.loginBoxHeight,
        margin: const EdgeInsets.only(
          left: Dimens.size70,
          right: Dimens.size70,
          top: Dimens.size50,
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
                title: translator.text("login_title"),
                color: Theme.of(context).accentColor,
                width: Dimens.loginButtonWidth,
              ),
            ),
            _signUpButton(context),
          ],
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
              onPressed: () => {},
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: Dimens.size110,
                top: Dimens.size12,
              ),
              child: Text(
                translator.text("login_title"), //for testing
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
              ),
              keyboardType: TextInputType.number,
              maxLength: 10,
              textDirection: TextDirection.ltr,
              controller: controller,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _passwordRow(
      {BuildContext context,
      IconData icon,
      String label,
      TextEditingController controller}) {
    return Container(
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
              ),
              obscureText: true,
              textDirection: TextDirection.ltr,
              controller: controller,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _signUpButton(BuildContext context) {
    return FlatButton(
      onPressed: () => {},
      child: Text(
        translator.text("signup"),
        style: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
