

import 'package:flutter/material.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_text_button.dart';

class SeeStudentsGrades extends StatelessWidget {
  const SeeStudentsGrades({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height:  MediaQuery.sizeOf(context).height * .12,
        ),
        const Divider(
          color: Colors.black26,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'See the grades of the previous exam :',
          style: AppStyles.styleSemiBold20(context),
        ),
        const SizedBox(
          height: 20,
        ),
        Align(
          alignment: AlignmentDirectional.center,
          child: CustomTextButton(
            color: Colors.brown,
            text: 'Go ',
            function: () {},
            width:50,
            height: 45,
          ),
        ),
      ],
    );
  }
}
