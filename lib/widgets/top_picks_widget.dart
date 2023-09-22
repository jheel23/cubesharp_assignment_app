import 'package:flutter/material.dart';

class TopPicksWidget extends StatelessWidget {
  const TopPicksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(8.0, 0, 0, 5),
            child: Text(
              'Top Picks',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Wrap(
              spacing: 30,
              runSpacing: 20,
              alignment: WrapAlignment.start,
              children: [
                topPicksProducts(
                    'https://s3.toolsvilla.com/products-electric-drill-machine-13mm/1672126174188SA-CF-2242-1.jpg',
                    'Drill Machine',
                    '₹950',
                    '12%Off',
                    '4.0',
                    '840'),
                topPicksProducts(
                    'https://4.imimg.com/data4/CJ/VA/MY-5479919/drill-machine-tool-kit.jpg',
                    'Drill Machine Tool Kit',
                    '₹1550',
                    '5%Off',
                    '4.5',
                    '1470'),
                topPicksProducts(
                    'https://rukminim1.flixcart.com/image/850/1000/kdga1zk0/screwdriver-set/a/4/c/kit-of-combination-plier-8-inch-with-reversable-screwdriver-2-in-original-imafucshp94a9cmv.jpeg?q=20',
                    'Pliers',
                    '₹500',
                    '5%Off',
                    '4.2',
                    '475'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container topPicksProducts(String url, String title, String initialprice,
      String discount, String rating, String discountPrice) {
    return Container(
      height: 220,
      width: 160,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 0.1,
              offset: const Offset(0, 0),
            )
          ],
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: SizedBox(
                height: 130,
                width: 150,
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 10),
            ),
            const SizedBox(
              height: 3,
            ),
            Row(
              children: [
                Opacity(
                  opacity: 0.5,
                  child: Text(
                    initialprice,
                    style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        decorationThickness: 2,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 10),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  discountPrice,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 10),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(discount,
                    style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 10))
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(rating,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10)),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
