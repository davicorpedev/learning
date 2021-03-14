import 'package:flutter/material.dart';
import 'package:learning_app/presentation/pages/animation/widgets/my_painter.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )
      ..forward()
      ..addListener(() {
        if (_controller.value == 1) {
          _controller.animateTo(0);
        } else if (_controller.value == 0) {
          _controller.animateTo(1);
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animations")),
      body: Stack(
        children: [
          CustomPaint(
            painter: MyPainter(),
            size: Size.infinite,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: AnimatedBuilder(
                  animation: _controller,
                  child: InkWell(
                    onTap: () {
                      _controller.animateBack(0);
                    },
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  builder: (BuildContext context, Widget? child) {
                    return Transform.scale(
                      scale: _controller.value,
                      child: child,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
