import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    List products = [1];
    return products.isEmpty ? EmptyCartPage() : FullCartPage();
  }
}

class FullCartPage extends StatefulWidget {
  const FullCartPage({Key? key}) : super(key: key);

  @override
  _FullCartPageState createState() => _FullCartPageState();
}

class _FullCartPageState extends State<FullCartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart(6)'),
        actions: [
          SmallIconButton(
            icon: Feather.trash,
            onPressed: () {},
            color: Colors.black,
            size: 40.0,
          ),
        ],
      ),
      bottomSheet: BottomSheetWidget(size: size),
      body: Container(
        margin: EdgeInsets.only(
          bottom: 50.0,
        ),
        child: ListView.builder(
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return CartListTile(
                index: 0,
                imagePath: 'assets/images/look_61.png',
                title: 'Title of the product',
                price: 123.4,
              );
            }),
      ),
    );
  }
}

class BottomSheetWidget extends StatelessWidget {
  final Size size;
  const BottomSheetWidget({
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: size.width * 0.4,
            height: 40.0,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
            ),
            child: Center(
              child: Text(
                'Total: \$1234.5',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          MaterialButton(
            minWidth: size.width * 0.4,
            height: 40.0,
            child: Text(
              'Checkout',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
            ),
            color: Colors.deepOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32.0),
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class CartListTile extends StatelessWidget {
  final int index;
  final String imagePath;
  final String title;
  final double price;
  CartListTile({
    required this.index,
    required this.imagePath,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 2.0,
        top: 2.0,
        bottom: 2.0,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(4.0),
            bottomRight: Radius.circular(4.0),
          )),
      height: 100.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: Colors.grey.shade100,
            height: 100.0,
            width: 100.0,
            child: Image.asset(
              imagePath, // the path to the asset iamge
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          title, // the title of the product
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14.0,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SmallIconButton(
                        icon: AntDesign.close,
                        onPressed: () {},
                        color: Colors.red,
                        size: 32.0,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '\$$price', // the price of the product
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          SmallIconButton(
                            icon: Feather.minus,
                            onPressed: () {},
                            color: Colors.deepOrange,
                            size: 32.0,
                          ),
                          Text(
                            '01',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SmallIconButton(
                            icon: Feather.plus,
                            onPressed: () {},
                            color: Colors.deepOrange,
                            size: 32.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SmallIconButton extends StatelessWidget {
  final IconData icon;
  final onPressed;
  final Color color;
  final double size;
  SmallIconButton({
    required this.icon,
    required this.color,
    required this.onPressed,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.5,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
        color: color,
        iconSize: size,
      ),
    );
  }
}

class EmptyCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/empty-cart.png'),
            Text(
              'Your Cart Is Empty',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
              ),
            ),
            Container(
              padding: EdgeInsets.all(32.0),
              child: Text(
                "Looks like you haven't add any item to your cart yet!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20.0,
                ),
              ),
            ),
            MaterialButton(
              minWidth: 300.0,
              height: 50.0,
              child: Text(
                'Shop Now',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),
              ),
              color: Colors.deepOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(32.0),
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
