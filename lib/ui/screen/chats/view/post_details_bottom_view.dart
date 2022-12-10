import 'package:flutter/material.dart';

import '../../../shared/textfild_common.dart';

class PostDetailsBottomView extends StatelessWidget {
  final TextEditingController comment;
  final Function() send;
  final Function() attachFile;
  final String hintText;
  final bool isAddRequired;

  const PostDetailsBottomView(
      {Key? key,
      required this.comment,
      required this.send,
      required this.attachFile,
      required this.hintText,
      this.isAddRequired = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 10),
          // getHeightSizedBox(h: 13),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CustomTextField2(
              comment: comment,
              hintText: hintText,
              send: send,
              attachFile: attachFile,
            ),
          ),
          // getHeightSizedBox(h: 15),
          const SizedBox(height: 15),

          ///  isAddRequired ? BannerAddOverlay() : SizedBox()
        ],
      ),
    );
  }
}
