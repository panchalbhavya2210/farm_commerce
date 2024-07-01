import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

Color background = const Color.fromRGBO(223, 241, 230, 1);
Color rgbo = const Color.fromRGBO(0, 126, 47, 1);

void main() {}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SearchWidget()),
            const SliverToBoxAdapter(child: CarouselImage()),
            SliverToBoxAdapter(
                child: CategoryBar(
              shouldDisplay: true,
            )),
            ProductGrid(
              shouldButtonDisplay:
                  false, // Pass the parameter indicating that the button should not be displayed
            ),
          ],
        ),
      ),
    );
  }
}

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  // ignore: unused_field
  final TextEditingController _searchValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              autocorrect: true,
              decoration: InputDecoration(
                isDense: true,
                hintText: "Search..",
                prefixIcon: Icon(
                  Icons.search,
                  size: 30,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: background,
              borderRadius: const BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            margin: const EdgeInsets.only(left: 15, top: 15),
            child: IconButton(
              onPressed: () => {},
              icon: SvgPicture.asset('icons/filter.svg'),
              iconSize: 35,
            ),
          )
        ],
      ),
    );
  }
}

class CarouselImage extends StatelessWidget {
  const CarouselImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: CarouselSlider(
          options: CarouselOptions(
            height: 170.0,
            autoPlay: true,
            enableInfiniteScroll: true,
            viewportFraction: 1,
          ),
          items: [
            'images/farmer.png',
            'images/farmer.png',
            'images/farmer.png',
          ].map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  // width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 0),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    children: [
                      Image.asset(
                        imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CategoryBar extends StatelessWidget {
  CategoryBar({super.key, required this.shouldDisplay});
  bool shouldDisplay = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: shouldDisplay ? 130 : 110,
      margin: const EdgeInsets.only(top: 0, bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Categories"),
                Text(
                  "View all",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryParm(
                      paramName: "Fruits",
                      paramImage:
                          "https://img.freepik.com/free-photo/front-view-fresh-red-apples-ripe-mellow-fruits-white-desk-fruit-color-tree-fresh-plant-red_140725-110203.jpg?t=st=1719068711~exp=1719072311~hmac=f62e0ffdb353194f2e0cc515554f3bb3a09b5b802a93423608bf91d35220e441&w=996"),
                  CategoryParm(
                    paramName: "Grains",
                    paramImage:
                        "https://img.freepik.com/free-photo/background-different-types-groats-corn-seeds-chickpeas-red-lentils-buckwheat-rice-top-view_141793-6799.jpg?t=st=1719068764~exp=1719072364~hmac=170e85380866d8f78a42848d13a6cbf0e64eba7f345d6344ab6db55e94076685&w=996",
                  ),
                  CategoryParm(
                    paramName: "Herbs",
                    paramImage:
                        "https://img.freepik.com/premium-photo/collection-herbs-spices-white-table_781284-10176.jpg?w=360",
                  ),
                  CategoryParm(
                    paramName: "Vegetables",
                    paramImage:
                        "https://img.freepik.com/free-photo/various-vegetables-fruits-laid-out-circle-dark-background_169016-23758.jpg?t=st=1719068882~exp=1719072482~hmac=0ae5916c8350aa15d029e4ec088719d2e471409893b6d5104481f7a7b45eda50&w=740",
                  ),
                  CategoryParm(
                    paramName: "Oats",
                    paramImage:
                        "https://img.freepik.com/free-photo/oatmeal-surface_144627-34399.jpg?t=st=1719068912~exp=1719072512~hmac=4ae7ccd38cdcd6061f14dc23d62227ec253422e3bacd0cd28bcb70bf65f380b2&w=996",
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: shouldDisplay == true
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Browse Products"),
                        Text(
                          "View all",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        )
                      ],
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryParm extends StatelessWidget {
  const CategoryParm(
      {super.key, required this.paramName, required this.paramImage});
  final String paramImage;
  final String paramName;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: background,
      ),
      clipBehavior: Clip.hardEdge,
      width: 150,
      margin: const EdgeInsets.only(right: 20, top: 10),
      child: Material(
        color: Colors.transparent, // Make the Material widget transparent
        child: InkWell(
          onTap: () => {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                margin: const EdgeInsets.only(left: 6),
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: Image.network(
                    paramImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: Text(
                  paramName,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ProductGrid extends StatelessWidget {
  ProductGrid({super.key, required this.shouldButtonDisplay});

  bool shouldButtonDisplay = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 140) / 2;
    final double itemHeightHome = (size.height - kToolbarHeight - 250) / 2;
    final double itemWidth = size.width / 2;

    // Define a list of products with their details
    final List<Map<String, dynamic>> products = [
      {
        'imageUrl': 'images/berries.png',
        'name': 'Berries',
        'price': 500.0,
        'rating': 4.5,
        'people': 672
      },
      {
        'imageUrl': 'images/tulsi.png',
        'name': 'Tulsi',
        'price': 300.0,
        'rating': 4.2,
        'people': 324
      },
      {
        'imageUrl': 'images/milk.png',
        'name': 'Milk',
        'price': 150.0,
        'rating': 4.8,
        'people': 560
      },
      {
        'imageUrl': 'images/tameta.png',
        'name': 'Tomatoes',
        'price': 200.0,
        'rating': 4.3,
        'people': 873
      },
    ];

    return SliverPadding(
      padding: const EdgeInsets.all(0),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: shouldButtonDisplay
              ? (itemWidth / itemHeight)
              : (itemWidth / itemHeightHome),
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            // Extract product details
            final product = products[index];
            return GridInfo(
              imageUrl: product['imageUrl'],
              name: product['name'],
              price: product['price'],
              rating: product['rating'],
              people: product['people'],
              shouldButtonDisplay: shouldButtonDisplay, // Pass the parameter
            );
          },
          childCount: products.length,
        ),
      ),
    );
  }
}

class GridInfo extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double price;
  final double rating;
  final int people;
  final bool shouldButtonDisplay; // Add the parameter to the constructor

  const GridInfo({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.rating,
    required this.people,
    required this.shouldButtonDisplay, // Initialize the parameter
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      clipBehavior: Clip.hardEdge,
      child: Material(
        color: Colors.transparent, // Make the Material widget transparent
        child: InkWell(
          onTap: () => {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image.asset(imageUrl),
                    Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(132, 255, 255, 255),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: IconButton(
                        onPressed: () => {},
                        icon: SvgPicture.asset("icons/heart.svg"),
                        iconSize: 35,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Text(
                    name,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "₹${price.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 45 / 2,
                        ),
                        Text(rating.toStringAsFixed(1)),
                        Text(
                          "($people)",
                          style: const TextStyle(color: Colors.black54),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              if (shouldButtonDisplay)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: rgbo,
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            fontSize: 35 / 2)),
                    child: const Text("Add to cart"),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
