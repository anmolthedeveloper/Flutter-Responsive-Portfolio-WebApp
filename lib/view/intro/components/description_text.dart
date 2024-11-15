import 'package:flutter/material.dart';

import '../../../view model/responsive.dart';

class AnimatedDescriptionText extends StatelessWidget {
  const AnimatedDescriptionText(
      {super.key, required this.start, required this.end});
  final double start;
  final double end;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: start, end: end),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        var width = MediaQuery.sizeOf(context).width;
        return SizedBox(
          width: width * .4,
          child: Text(
            'Proficient Flutter Developer with extensive experience in developing responsive, high-quality mobile applications. Passionate about enhancing user engagement through thoughtful UX design and efficient coding practices, ensuring optimal app performance and user satisfaction.',
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
            style:
                TextStyle(color: Colors.grey, wordSpacing: 2, fontSize: value),
          ),
        );
      },
    );
  }
}
