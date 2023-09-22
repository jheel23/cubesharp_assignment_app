import 'package:flutter/material.dart';

class CustomStackWidget extends StatelessWidget {
  const CustomStackWidget({
    super.key,
    required this.deviceSize,
  });

  final Size deviceSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          height: deviceSize.height * 0.2,
          width: deviceSize.width * 0.9,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              'https://blog.renovationfind.com/wp-content/uploads/2021/07/AdobeStock_108146585.jpeg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          height: deviceSize.height * 0.2,
          width: deviceSize.width * 0.9,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(40.0, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Opacity(
                  opacity: 0.7,
                  child: Text(
                    '30% discount',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w100,
                        color: Colors.white),
                  )),
              Opacity(
                opacity: 0.7,
                child: Container(
                  height: 2,
                  width: 20,
                  decoration: const BoxDecoration(
                      color: Color(0xffe55a44),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Best Hand Tools\nCollection',
                maxLines: 2,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  //!Can be later implemented to navigate to products screen.
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  height: 20,
                  width: 60,
                  decoration: BoxDecoration(
                      color: const Color(0xffe55a44),
                      borderRadius: BorderRadius.circular(2)),
                  child: const Center(
                    child: FittedBox(
                      child: Text(
                        'Shop Now',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
