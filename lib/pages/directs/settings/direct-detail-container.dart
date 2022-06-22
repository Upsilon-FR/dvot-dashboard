import 'package:dvot_dashboard_init/class/custom-toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../class/direct.dart';

class DirectDetailContainer extends StatelessWidget {
  final Direct? direct;

  const DirectDetailContainer({Key? key, required this.direct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).cardColor,
      type: MaterialType.transparency,
      textStyle: const TextStyle(
        fontWeight: FontWeight.normal,
        color: Colors.black,
        fontSize: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "TITRE:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  direct!.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          const Text(
            "Description:",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            direct!.description,
            textAlign: TextAlign.right,
          ),
          Divider(
            color: Theme.of(context).canvasColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Lien:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                child: Text(direct!.link),
                onTap: () => {
                  Clipboard.setData(
                    ClipboardData(
                      text: direct!.link,
                    ),
                  ),
                  CustomToast.showSuccessToast(
                    msg: "Lien copié",
                    context: context,
                  ),
                },
              ),
            ],
          ),
          Divider(
            color: Theme.of(context).canvasColor,
          ),
        ],
      ),
    );
  }
}
