import 'package:flutter/material.dart';

class Task2Page extends StatefulWidget {
  const Task2Page({Key? key}) : super(key: key);

  @override
  State<Task2Page> createState() => _Task2PageState();
}

class _Task2PageState extends State<Task2Page>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    _animation = Tween<Size>(
      begin: const Size(100, 100),
      end: const Size(200, 200),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn))
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          _controller.repeat(reverse: true);
        }
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task2"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, ch) => Container(
            width: _animation.value.width,
            height: _animation.value.height,
            child: Image.asset("assets/images/heart.png"),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () {
          _controller.forward();
        },
      ),
    );
  }
}
