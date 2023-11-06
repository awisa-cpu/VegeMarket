import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shopcart/utilities/displays/loading_controller.dart';

class OverLayController {
  //
  OverLayController._pri();
  static final OverLayController _instance = OverLayController._pri();
  factory OverLayController() => _instance;

  LoadingController? controller;

  //
  LoadingController _displayOverLay({
    required BuildContext context,
    required String textToShow,
  }) {
    final textSController = StreamController<String>();
    textSController.sink.add(textToShow);

    //
    final size = MediaQuery.of(context).size;

    //
    final overlay = Overlay.of(context);

    //
    final overEntry = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.black.withAlpha(150),
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                maxHeight: size.height * 0.85,
                minHeight: size.height * 0.5,
                maxWidth: size.width * 0.85,
                minWidth: size.width * 0.75,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(
                      height: 10.5,
                    ),
                    StreamBuilder(
                      stream: textSController.stream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final text = snapshot.data as String;
                          return Text(
                            text,
                            style: const TextStyle(fontSize: 18),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
    overlay.insert(overEntry);

    return LoadingController(
      close: () {
        textSController.close();
        overEntry.remove();
        return true;
      },
      update: (text) {
        textSController.add(text);
        return true;
      },
    );
  }

  void showScreen({
    required String text,
    required BuildContext context,
  }) {
    if (controller?.update(text) ?? false) {
    } else {
      controller = _displayOverLay(context: context, textToShow: text);
    }
  }

  void closeScreen() {
    controller?.close();
    controller = null;
  }
}
