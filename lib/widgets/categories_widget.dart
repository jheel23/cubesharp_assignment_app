import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Categories',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
          ),
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                typesOfCategory(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8L2CLjVSg-niOL28tvFGDYQkDcMke8nJH_2Afu84opjb0Sb2t-aHKoU_I4eN8itEo22k&usqp=CAU',
                    'Power Tools\nKit'),
                typesOfCategory(
                    'https://5.imimg.com/data5/RC/MN/ZA/SELLER-2413318/timing-pulley.jpg',
                    'Timing Pulley'),
                typesOfCategory(
                    'https://5.imimg.com/data5/ZT/AI/ST/SELLER-89852680/ms-nut-bolt-500x500.jpg',
                    'Nut Bolt'),
                typesOfCategory(
                    'https://5.imimg.com/data5/VO/IN/MY-5697460/rubber-timing-belts-500x500.jpg',
                    'Timing Belts'),
                typesOfCategory(
                    'https://www.familyhandyman.com/wp-content/uploads/2019/02/Stanleyhacksaw.jpg',
                    'Hackshaws')
              ],
            ))
      ],
    );
  }

  Column typesOfCategory(String url, String title) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: const Alignment(0.0, 1.3),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          height: 60,
          width: 70,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(url),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
        Text(title,
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.w100, color: Colors.black))
      ],
    );
  }
}
