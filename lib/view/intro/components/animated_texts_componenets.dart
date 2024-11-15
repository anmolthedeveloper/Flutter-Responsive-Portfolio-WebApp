import 'package:flutter/material.dart';

import '../../../res/constants.dart';
import '../../../view model/responsive.dart';

class AnimatedImageContainer extends StatefulWidget {
  const AnimatedImageContainer({Key? key, this.height = 275, this.width = 275})
      : super(key: key);
  final double? width;
  final double? height;
  @override
  AnimatedImageContainerState createState() => AnimatedImageContainerState();
}

class AnimatedImageContainerState extends State<AnimatedImageContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true); // Repeat the animation loop
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final value = _controller.value;
        return Transform.translate(
          offset: Offset(0, 2 * value), // Move the container up and down
          child: Container(
            clipBehavior: Clip.hardEdge,
            height: widget.height!,
            width: widget.width!,
            padding: const EdgeInsets.all(defaultPadding / 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: const LinearGradient(colors: [
                Colors.amber,
                Colors.deepOrange,
              ]),
              boxShadow: const [
                BoxShadow(
                  color: Colors.amber,
                  offset: Offset(-2, 0),
                  blurRadius: 8,
                ),
                BoxShadow(
                  color: Colors.deepOrange,
                  offset: Offset(2, 0),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Image.asset(
                'assets/images/profile.jpg',
                // height: Responsive.isLargeMobile(context)
                //     ? MediaQuery.sizeOf(context).width * 0.2
                //     : Responsive.isTablet(context)
                //         ? MediaQuery.sizeOf(context).width * 0.14
                //         : 200,
                // width: Responsive.isLargeMobile(context)
                //     ? MediaQuery.sizeOf(context).width * 0.2
                //     : Responsive.isTablet(context)
                //         ? MediaQuery.sizeOf(context).width * 0.14
                //         : 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
