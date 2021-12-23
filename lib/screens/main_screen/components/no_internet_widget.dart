import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoInternetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: double.infinity,
              height: 200,
              child: SvgPicture.asset("assets/images/signal.svg")),
          const Text(
            'check your connection .... ',
            style: TextStyle(fontFamily: 'Baloo2 Regular'),
          ),
        ],
      ),
    );
  }
}
