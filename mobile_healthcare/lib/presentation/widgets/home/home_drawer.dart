import 'package:flutter/material.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';

class HomeDrawer extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: <Widget>[
          Container(
            height: Dimens.drawHeaderHeight,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    Icons.person,
                    color: Theme.of(context).cardColor,
                    size: Dimens.size30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      translator.text("username"), //Placeholder
                      style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontSize: Dimens.size20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom:
                    BorderSide(style: BorderStyle.solid, width: Dimens.thick02),
              ),
            ),
            child: ListTile(
              leading: Icon(Icons.favorite),
              title: Text(
                translator.text("marked"),
                style: TextStyle(
                  color: Theme.of(context).textTheme.headline6.color,
                ),
              ),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom:
                    BorderSide(style: BorderStyle.solid, width: Dimens.thick02),
              ),
            ),
            child: ListTile(
              leading: Icon(Icons.remove_red_eye),
              title: Text(
                translator.text("seen"),
                style: TextStyle(
                  color: Theme.of(context).textTheme.headline6.color,
                ),
              ),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom:
                    BorderSide(style: BorderStyle.solid, width: Dimens.thick02),
              ),
            ),
            child: ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text(
                translator.text("logout"),
                style: TextStyle(
                  color: Theme.of(context).textTheme.headline6.color,
                ),
              ),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ),
        ],
      ),
    );
  }
}
