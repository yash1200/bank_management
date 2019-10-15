import 'package:bank_management/provider/AppProvider.dart';
import 'package:bank_management/utils/Style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  var textStyle = TextStyle(
    fontSize: 18,
  );

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: darkColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Profile',
          style: TextStyle(
            color: darkColor,
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          SizedBox(
            height: size.height / 60,
          ),
          Container(
            height: size.height / 5,
            width: size.height / 5,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 1.5,
                color: darkColor,
              ),
            ),
            child: Text(
              provider.getUser.branches.toString(),
              style: TextStyle(
                fontSize: size.height / 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          SizedBox(
            height: size.height / 40,
          ),
          Text(
            provider.getUser.name,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: size.height / 40,
          ),
          ListTile(
            title: Text(
              'Balance',
              style: textStyle,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(FontAwesomeIcons.rupeeSign),
                Text(
                  provider.getUser.balance.toString(),
                  style: textStyle,
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              'Unadded Money',
              style: textStyle,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(FontAwesomeIcons.rupeeSign),
                Text(
                  provider.getUser.addAmount.toString(),
                  style: textStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
