import 'package:farm_commerce/home.dart';
import 'package:flutter/material.dart';

Color background = const Color.fromRGBO(223, 241, 230, 1);
Color rgbo = const Color.fromRGBO(0, 126, 47, 1);

void main() {}

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: CategoryBar(
              shouldDisplay: false,
            )),
            ProductGrid(
              shouldButtonDisplay: true,
            ),
          ],
        ),
      ),
    );
  }
}
