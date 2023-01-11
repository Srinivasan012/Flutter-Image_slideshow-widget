import 'dart:async';
import 'package:flutter/material.dart';

class MySlideShowWidget extends StatefulWidget {
  MySlideShowWidget(
      {required this.children,
      this.seconds = 5,
      this.activeColor = Colors.blue,
      this.inactiveColor = Colors.grey});
  final List<Widget> children;
  int seconds;
  Color activeColor;
  Color inactiveColor;
  @override
  _MySlideShowWidgetState createState() => _MySlideShowWidgetState();
}

class _MySlideShowWidgetState extends State<MySlideShowWidget> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  var _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  startTimer() {
    _timer = Timer.periodic(Duration(seconds: widget.seconds), (timer) {
      setState(() {
        _currentPage++;
        if (_currentPage >= widget.children.length) {
          _currentPage = 0;
          _pageController.jumpToPage(_currentPage);
          _timer.cancel();
          startTimer();
        } else {
          _pageController.animateToPage(_currentPage,
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: _pageController,
          children: widget.children,
          onPageChanged: (int index) {
            setState(() {
              _currentPage = index;
              if (_currentPage >= widget.children.length) {
                _currentPage = 0;
              }
            });
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.children.length, (index) {
                return GestureDetector(
                  onTap: () {
                    _currentPage = index;
                    _pageController.jumpToPage(_currentPage);
                    setState(() {});
                  },
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index
                          ? widget.activeColor
                          : widget.inactiveColor,
                    ),
                  ),
                );
              }),
            ),
          ),
        )
      ],
    );
  }
}
