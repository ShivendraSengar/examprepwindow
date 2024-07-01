import 'package:exam_prep_tool/app/widgets/custom_widgets.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';

class BuildShimmer extends StatelessWidget {
  const BuildShimmer({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Vx.gray300,
      highlightColor: Vx.white,
      child: child == null ? buildSkeltion() : child!,
    );
  }
}
