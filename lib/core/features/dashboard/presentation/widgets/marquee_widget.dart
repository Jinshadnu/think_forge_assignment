import 'package:flutter/material.dart';

class Marquee extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final double velocity;

  const Marquee({
    Key? key,
    required this.text,
    this.style,
    this.velocity = 50.0,
  }) : super(key: key);

  @override
  _MarqueeState createState() => _MarqueeState();
}

class _MarqueeState extends State<Marquee> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: (widget.text.length / 10 * 3).toInt()),
      vsync: this,
    )..repeat();
    _animation = Tween(begin: 1.0, end: -1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Transform.translate(
                offset: Offset(_animation.value * 100, 0),
                child: Text(
                  widget.text,
                  style: widget.style,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
