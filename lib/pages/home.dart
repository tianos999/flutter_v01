import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:snack_cart/core/constants/app_color.dart';
import 'package:snack_cart/core/constants/constants.dart';
import 'package:snack_cart/core/utils/data.dart';
import 'package:snack_cart/core/utils/utils_mixin.dart';
import 'package:snack_cart/presentation/widgets/category_item.dart';
import 'package:snack_cart/presentation/widgets/custom_image.dart';
import 'package:snack_cart/presentation/widgets/custom_textbox.dart';
import 'package:snack_cart/presentation/widgets/icon_box.dart';
import 'package:snack_cart/presentation/widgets/property_item.dart';
import 'package:snack_cart/presentation/widgets/recent_item.dart';
import 'package:snack_cart/presentation/widgets/recommend_item.dart';

class HomePage extends StatefulWidget {

  final Function(int) onIndexChanged;
  const HomePage({Key? key, required this.onIndexChanged}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with UtilsMixin {

  int _selectedCategory = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
        SliverToBoxAdapter(child: _buildBody())
      ],
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPromoCard1(),
          _buildCategories(),
          SizedBox(height: 20),
          _popular(),
          SizedBox(height: 20),
          _buildPopulars(),
          SizedBox(height: 20),
          _recommended(),
          SizedBox(height: 20),
          _buildRecommended(),
          SizedBox(height: 20),
          _recent(),
          SizedBox(height: 20),
          _buildRecent(),
          SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildPromoCard2() {
    return Center(
      child: ClipRect(
        child: Banner(
          message: '30% OFF',
          location: BannerLocation.topStart,
          color: Colors.orange.shade800,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.white,
          ),
          child: Container(
            width: 300,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.orange.shade200, width: 3),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.local_offer,
                  size: 80,
                  color: Colors.orange,
                ),
                SizedBox(height: 20),
                Text(
                  'Special Event!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPromoCard1() {

    final Widget box01 = Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColor.secondaryJewelBlue,
            AppColor.secondaryJewelBlue
          ],
          //stops: [0.9, 0.1], // Controls distribution
          //tileMode: TileMode.repeated,
        ),
      ),
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Bienvenido a ThaMi Eventos', style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text('Tus snacks favoritos.', style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 16)),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: AppColor.secondaryCodGray),
            onPressed: () {
              showToast("Button Clicked! Success");
              widget.onIndexChanged(Constants.SNACK_CART_CREATE_PAGE);
            },
          child: const Row(
              mainAxisSize: MainAxisSize.min, // Shrinks row to fit content snugly
              children: [
                Text("Arma tu carrito"),
                SizedBox(width: 8), // Adds a clean gap between text and icon
                Icon(Icons.arrow_forward),
              ],
            ),
          ),
        ],
      ),
    );

    final Widget _clipRRect = ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Banner(
        message: 'PROMO',
        location: BannerLocation.topEnd,
        color: AppColor.secondaryMySin,
        child: box01,
        textStyle: const TextStyle(
          color: AppColor.secondarySpanishRed,
          fontSize: 10.0,
          fontWeight: FontWeight.normal,
        ),
      ),
    );

    return Container(
      margin: const EdgeInsets.only(
        left: 16.0,
        top: 16.0,
        right: 16.0,
        bottom: 20.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: AppColor.secondarySoftCharcoal.withAlpha(100),
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: const Offset(0, 9), // Changes position of shadow
          ),
        ],
      ),
      child: _clipRRect,
    );
  }

  Widget _buildPromoCard() {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.orange[800],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text(
            "Recientes",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text(
            "Ver todo",
            style: TextStyle(fontSize: 14, color: AppColor.secondarySoftCharcoal),
          ),
        ],
      ),
    );
  }

  _recent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Recientes",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text(
            "Ver todo",
            style: TextStyle(fontSize: 14, color: AppColor.secondarySoftCharcoal),
          ),
        ],
      ),
    );
  }

  _recommended() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Recomendado",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text(
            "Ver todo",
            style: TextStyle(fontSize: 14, color: AppColor.secondarySoftCharcoal),
          ),
        ],
      ),
    );
  }

  _popular() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "Popular",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text(
            "Ver todo",
            style: TextStyle(fontSize: 14, color: AppColor.secondarySoftCharcoal),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    List<Widget> lists = List.generate(
      categories.length,
      (index) => CategoryItem(
        data: categories[index],
        selected: index == _selectedCategory,
        onTap: () {
          setState(() {
            _selectedCategory = index;
          });
        },
      ),
    );
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }

  Widget _buildPopulars() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 240,
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: .8,
      ),
      items: List.generate(
        populars.length,
        (index) => PropertyItem(
          data: populars[index],
          onIndexChanged: _updateIndex
        ),
      ),
    );
  }

  void _updateIndex(int newIndex) {
    setState(() {
      widget.onIndexChanged(newIndex);
    });
  }

  Widget _buildRecommended() {
    List<Widget> lists = List.generate(
      recommended.length,
      (index) => RecommendItem(
        data: recommended[index],
      ),
    );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }

  Widget _buildRecent() {
    List<Widget> lists = List.generate(
      recents.length,
      (index) => RecentItem(
        data: recents[index],
      ),
    );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }

}
