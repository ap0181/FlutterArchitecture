import 'package:business_logic/utils/DatabaseKeyConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_spinkit/src/wave.dart';

import 'TextStyles.dart';

class CenterLoadingIndicator extends StatelessWidget {

  bool withBackground;
  var topPadding;

  CenterLoadingIndicator(
      {Key? key,
      this.withBackground = false,
      this.topPadding = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: withBackground ? Colors.black45 : Colors.transparent,

      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Column(
            children: [
              SpinKitWave(
                color: Colors.green,
                size: MediaQuery.of(context).size.width * 0.2,
              ),
              DatabaseKeyConstant.IS_EMPTY_MESSAGE
                  ? Container()
                  : Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text("Please wait...",
                        textAlign: TextAlign.center,
                        style: TextStyles().getCommonTextStyle().copyWith(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontFamily: "AvenirCondensed"),
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
