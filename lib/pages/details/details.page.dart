import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../assets.dart';
import '../../constants.dart';
import '../../models/models.dart';
import '../../widgets/color_dot.dart';
import '../../widgets/int_counter.dart';

class DetailsPage extends StatefulWidget {
  final Product product;

  const DetailsPage({Key key, this.product}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Product product;
  int colorValue;
  Color color;
  int count = 1;
  Color invertedColor;
  bool favorited = false;

  @override
  void initState() {
    product = widget.product;
    setColorValue(product.colors.first);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      // each product have a color
      backgroundColor: color,
      appBar: AppBar(
        backgroundColor: color,
        elevation: 0,
        leading: BackButton(
          color: invertedColor,
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(Assets.svg('search')),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(Assets.svg('cart')),
            onPressed: () {},
          ),
          SizedBox(width: kDefaultPadding / 2)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  _buildDetails(context),
                  _buildProductTitleWithImage(context),
                  Positioned(
                    top: 60,
                    right: 10,
                    child: Hero(
                      tag: "${product.id}",
                      child: Image.asset(
                        product.image,
                        fit: BoxFit.fill,
                        width: size.width * (2 / 3),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(
                        favorited ? Icons.favorite : Icons.favorite_border_rounded,
                        color: invertedColor,
                      ),
                      onPressed: () => setState(() => favorited = !favorited),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDetails(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: size.height * 0.3),
      padding: EdgeInsets.only(
        top: size.height * 0.08,
        left: kDefaultPadding,
        right: kDefaultPadding,
      ),
      // height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          _buildColorAndSize(context),
          SizedBox(height: kDefaultPadding / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IntCounter(
                value: count,
                onChange: (value) => setState(() => count = value),
              ),
            ],
          ),
          SizedBox(height: kDefaultPadding / 2),
          _buildAddToCart(context),
          SizedBox(height: kDefaultPadding / 2),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: Text(
              product.description,
              style: TextStyle(height: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorAndSize(BuildContext context) {
    final _color = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Color"),
        Row(
          children: product.colors.map((clr) {
            return ColorDot(
              isSelected: colorValue == clr,
              color: Color(clr),
              onTap: () {
                setColorValue(clr);
                setState(() {});
              },
            );
          }).toList(),
        ),
      ],
    );

    final _size = RichText(
      text: TextSpan(
        style: TextStyle(color: kTextColor),
        children: [
          TextSpan(text: "Size\n"),
          TextSpan(
            text: "${product.size} cm",
            style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _size,
        SizedBox(height: 20),
        _color,
      ],
    );
  }

  Widget _buildAddToCart(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: kDefaultPadding),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: color),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                Assets.svg('add_to_cart'),
                color: color,
              ),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                color: color,
                child: Text(
                  "BUY NOW",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: invertedColor),
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductTitleWithImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Aristocratic Hand Bag",
            style: TextStyle(color: invertedColor),
          ),
          SizedBox(height: kDefaultPadding / 2),
          Text(
            product.title,
            style: Theme.of(context).textTheme.headline5.copyWith(color: invertedColor, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: kDefaultPadding),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: "Price\n", style: TextStyle(color: invertedColor)),
                TextSpan(
                  text: "\$${product.price.toStringAsFixed(2)}",
                  style: Theme.of(context).textTheme.headline5.copyWith(color: invertedColor, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void setColorValue(int clr) {
    colorValue = clr;
    color = Color(colorValue);
    invertedColor = blackOrWhite(color);
  }
}
