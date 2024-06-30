import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Color background = const Color.fromRGBO(223, 241, 230, 1);
Color rgbo = const Color.fromRGBO(0, 126, 47, 1);
const List<String> list = <String>['Home', 'Work', 'Other'];

void main() {}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ItemContainer(),
            ),
            SliverToBoxAdapter(
              child: Coupon(),
            ),
            SliverToBoxAdapter(
              child: Invoicing(),
            ),
            SliverToBoxAdapter(
              child: ShippingDetails(),
            )
          ],
        ),
      ),
    );
  }
}

class ItemContainer extends StatefulWidget {
  const ItemContainer({super.key});

  @override
  State<ItemContainer> createState() => _ItemContainerState();
}

class _ItemContainerState extends State<ItemContainer> {
  int quantity = 1;
  final TextEditingController _quantityCnt = TextEditingController();

  @override
  void initState() {
    super.initState();
    _quantityCnt.text = quantity.toString();
  }

  @override
  void dispose() {
    _quantityCnt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: const Color.fromRGBO(189, 189, 189, 1)),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100)),
                      clipBehavior: Clip.hardEdge,
                      width: 60,
                      height: 60,
                      child: Image.network(
                          fit: BoxFit.cover,
                          "https://hips.hearstapps.com/hmg-prod/images/repeated-pomegranates-and-one-half-sliced-royalty-free-image-1663258352.jpg?crop=1xw:0.74982xh;center,top&resize=1200:*"),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Pomegranate",
                      style: TextStyle(fontSize: 25, color: Colors.grey[800]),
                    )
                  ],
                ),
                Text(
                  "₹100",
                  style: TextStyle(
                      color: rgbo, fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Add more items",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: rgbo,
                          fontWeight: FontWeight.bold)),
                  Container(
                    decoration: BoxDecoration(
                        color: rgbo, borderRadius: BorderRadius.circular(100)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => {
                            setState(() {
                              if (quantity > 1) {
                                quantity--;
                                _quantityCnt.text = quantity.toString();
                              }
                            })
                          },
                          icon: const Icon(Icons.remove),
                          iconSize: 20,
                          color: Colors.white,
                        ),
                        SizedBox(
                            width: 20,
                            child: TextField(
                              controller: _quantityCnt,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              decoration: const InputDecoration(
                                isDense: false,
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  quantity = int.tryParse(value) ?? 1;
                                });
                              },
                            )),
                        // Text(
                        //   quantity.toString(),
                        //   style: const TextStyle(
                        //       color: Colors.white, fontWeight: FontWeight.bold),
                        // ),
                        IconButton(
                          onPressed: () => {
                            setState(() {
                              quantity++;
                              _quantityCnt.text = quantity.toString();
                            })
                          },
                          icon: const Icon(Icons.add),
                          iconSize: 20,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Coupon extends StatelessWidget {
  const Coupon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: const Color.fromRGBO(189, 189, 189, 1)),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Apply Coupon',
            style: TextStyle(
                fontSize: 18, color: rgbo, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class Invoicing extends StatelessWidget {
  const Invoicing({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text(
              "Invoice",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 63, 63, 63)),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: const Color.fromRGBO(189, 189, 189, 1)),
                borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("Original Price"), Text("₹100")]),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("Delivery"), Text("+20")]),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("GST"), Text("+18")]),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("Discount"), Text("-20")]),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                                fontSize: 25,
                                color: rgbo,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "₹138",
                            style: TextStyle(
                                fontSize: 25,
                                color: rgbo,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ShippingDetails extends StatefulWidget {
  ShippingDetails({super.key});

  @override
  State<ShippingDetails> createState() => _ShippingDetailsState();
}

class _ShippingDetailsState extends State<ShippingDetails> {
  // String dropValue = list.first;
  List<String> _dropdownItems = ['Home', 'Work', 'Other'];
  // Initial value for the dropdown
  var _selectedItem = 'Home';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Shipping Details"), Text("Edit")],
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: const Color.fromRGBO(189, 189, 189, 1)),
                borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Matthew McConaughey'),
                      Container(
                        width: 80,
                        child: DropdownButton<String>(
                          isExpanded: true,
                          hint: Text('Select an item'),
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: rgbo,
                          ),
                          style: TextStyle(
                              color: rgbo,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                          value: _selectedItem,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedItem = newValue.toString();
                            });
                          },
                          items: _dropdownItems
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          underline: SizedBox(),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
