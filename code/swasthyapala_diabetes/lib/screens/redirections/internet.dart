import 'package:flutter/material.dart';
import 'package:swasthyapala_diabetes/utility/internet.dart';
import 'package:swasthyapala_diabetes/widgets/util/no_internet.dart';

class NetworkConnectivityScreen extends StatefulWidget {
  @override
  _NetworkConnectivityState createState() => _NetworkConnectivityState();
}

class _NetworkConnectivityState extends State<NetworkConnectivityScreen> {
  bool isConnected = false;

  @override
  void initState() {
    //change the connection if the internet is connected
    isConnectionReady().then((value) {
      setState(() {
        isConnected = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Center(
            child: isConnected ? Text('internet Connected') : NoInternet()),
      ),
    );
  }
}
