import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:snack_cart/core/constants/color.dart';
import 'package:snack_cart/core/constants/constants.dart';
import 'package:snack_cart/core/utils/data.dart';
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

class _HomePageState extends State<HomePage> {

  int _selectedCategory = 0;

  // Don't forget to dispose of it!
  @override
  void dispose() {
    //indexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: AppColor.appBgColor,
          pinned: true,
          snap: true,
          floating: true,
          title: _buildHeader(),
        ),
        SliverToBoxAdapter(child: _buildBody())
      ],
    );
  }

  _buildHeader() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hola!",
                  style: TextStyle(
                    color: AppColor.darker,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Alfredo Bringas",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            CustomImage(
              profile,
              width: 35,
              height: 35,
              trBackground: true,
              borderColor: AppColor.primary,
              radius: 10,
            ),
          ],
        ),
      ],
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPromoCard1(),
          // _sizedBox(15),
          // _buildSearch(),
          // _sizedBox(20),
          _buildCategories(),
          _sizedBox(20),
          _popular(),
          _sizedBox(20),
          _buildPopulars(),
          _sizedBox(20),
          _recommended(),
          _sizedBox(20),
          _buildRecommended(),
          _sizedBox(20),
          _recent(),
          _sizedBox(20),
          _buildRecent(),
          _sizedBox(100),
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

    final String title = "Bienvenido a ThaMi Eventos";
    final String description = "Tus snacks favoritos.";

    final Widget box01 = Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple, Colors.purpleAccent],
        ),
      ),
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(description, style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 16)),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.deepPurple),
            onPressed: () {
              _showToast();
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

    final Widget box02 = ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Banner(
        message: 'PROMO',
        location: BannerLocation.topEnd,
        color: Colors.redAccent,
        child: box01,
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(16.0), // Space outside the card
      child: box02,
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
            style: TextStyle(fontSize: 14, color: AppColor.darker),
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
            style: TextStyle(fontSize: 14, color: AppColor.darker),
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
            style: TextStyle(fontSize: 14, color: AppColor.darker),
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
            style: TextStyle(fontSize: 14, color: AppColor.darker),
          ),
        ],
      ),
    );
  }

  _sizedBox(double? height) {
    return SizedBox(
      height: height,
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: CustomTextBox(
              hint: "Buscar...",
              prefix: Icon(Icons.search, color: Colors.grey),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconBox(
            child: Icon(Icons.filter_list_rounded, color: Colors.white),
            bgColor: AppColor.secondary,
            radius: 10,
          )
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
        ),
      ),
    );
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

  _showToast() {
    Fluttertoast.showToast(
      msg: "Button Clicked! Success",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
