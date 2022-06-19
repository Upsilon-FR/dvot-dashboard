import 'package:flutter/material.dart';

class DirectsContent extends StatelessWidget {
  const DirectsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              child: Text(
                "Gestion Directs",
                style: Theme.of(context).textTheme.headline1,
              ),
              width: double.infinity,
            ),
            flex: 1,
          ),
          const SizedBox(height: 50,),
          Expanded(
            child: Container(
              color: Colors.red,
            ),
            flex: 5,
          ),
          const SizedBox(height: 50,),
          Expanded(
            child: Container(
              color: Colors.blue,
            ),
            flex: 5,
          ),
        ],
      ),
    );
  }
}
