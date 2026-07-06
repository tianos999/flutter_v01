import 'package:flutter/material.dart';
import 'package:snack_cart/core/constants/app_color.dart';
import 'package:snack_cart/core/utils/utils_mixin.dart';

class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({Key? key}) : super(key: key);

  @override
  _EventDetailsPageState createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> with UtilsMixin {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        tianosSliverAppBar(
            data01: 'SPONSORED CONTENT',
            data02: 'Event details Page',
            icon: Icons.shopping_cart,
            onPressed: () {}
        ),
        SliverToBoxAdapter(child: _buildBody())
      ],
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 338,
                decoration: BoxDecoration(
                  color: AppColor.red,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 334,
                      decoration: BoxDecoration(
                        color: AppColor.blue,
                      ),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.asset(
                                'assets/images/2-Storey-Modern-Minimalist-House-Design-Indonesia-1024x762.jpg',
                                width:
                                MediaQuery.sizeOf(context).width,
                                height:
                                MediaQuery.sizeOf(context).height,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20, 30, 20, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0x47878383),
                                            Color(0xA0D8D4D4)
                                          ],
                                          stops: [0, 1],
                                          begin: AlignmentDirectional(
                                              0, -1),
                                          end: AlignmentDirectional(
                                              0, 1),
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(10),
                                      ),
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        color: AppColor.primaryMagenta,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0x47878383),
                                            Color(0xA0D8D4D4)
                                          ],
                                          stops: [0, 1],
                                          begin: AlignmentDirectional(
                                              0, -1),
                                          end: AlignmentDirectional(
                                              0, 1),
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(10),
                                      ),
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: AppColor.primaryMagenta,
                                        size: 22,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0, 1),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 550,
                  decoration: BoxDecoration(
                    color: AppColor.primaryMagenta,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding:
                    EdgeInsetsDirectional.fromSTEB(20, 30, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 70,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Pear House'
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 30,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '\$1150'
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Solo, Central Java'
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0, 15, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 5, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional
                                          .fromSTEB(0, 0, 5, 0),
                                      child: Container(
                                        width: 105,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                          borderRadius:
                                          BorderRadius.circular(
                                              6),
                                          border: Border.all(
                                            color: Color(0xFF7F8788),
                                            width: 2,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize:
                                          MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding:
                                              EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  3, 0, 3, 0),
                                              child: Icon(
                                                Icons.home_work,
                                                color: Colors.black,
                                                size: 18,
                                              ),
                                            ),
                                            Text(
                                              '2 habitaciones'
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 5, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional
                                          .fromSTEB(0, 0, 5, 0),
                                      child: Container(
                                        width: 75,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                          borderRadius:
                                          BorderRadius.circular(
                                              6),
                                          border: Border.all(
                                            color: Color(0xFF7F8788),
                                            width: 2,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize:
                                          MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding:
                                              EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  3, 0, 3, 0),
                                              child: Icon(
                                                Icons.wifi,
                                                color: Colors.black,
                                                size: 18,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  5, 0, 0, 0),
                                              child: Text(
                                                'Wifi'
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 5, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional
                                          .fromSTEB(0, 0, 5, 0),
                                      child: Container(
                                        width: 75,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                          borderRadius:
                                          BorderRadius.circular(
                                              6),
                                          border: Border.all(
                                            color: Color(0xFF7F8788),
                                            width: 2,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize:
                                          MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding:
                                              EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  3, 0, 3, 0),
                                              child: Icon(
                                                Icons.directions_car,
                                                color: Colors.black,
                                                size: 18,
                                              ),
                                            ),
                                            Text(
                                              'Garage'
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0, 30, 0, 0),
                          child: Text(
                            'Descripcion'
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                  EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 20, 0),
                                  child: Text(
                                    'Minimalist and clean house with modern interior in the Central of Java. Take a virtual tour and discover it from the inside '
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0, 30, 0, 0),
                          child: Text(
                            'Galeria'
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0, 15, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 20, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/images/images-3.jpg',
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 20, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/images/images.jpg',
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 20, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/images/minimalist-house-1.jpg',
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0, 40, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 56,
                                    height: 56,
                                    decoration: BoxDecoration(
                                      color: AppColor.secondaryMySin,
                                      borderRadius:
                                      BorderRadius.circular(15),
                                      border: Border.all(
                                        color: Color(0x64000000),
                                        width: 1,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.phone,
                                      color: Color(0x64000000),
                                      size: 24,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional
                                        .fromSTEB(20, 0, 0, 0),
                                    child: Container(
                                      width: 270,
                                      height: 56,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFF9A577E),
                                            Color(0xFF574977)
                                          ],
                                          stops: [0, 1],
                                          begin: AlignmentDirectional(
                                              -0.34, 1),
                                          end: AlignmentDirectional(
                                              0.34, -1),
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(15),
                                      ),
                                      child: Align(
                                        alignment:
                                        AlignmentDirectional(
                                            0, 0),
                                        child: Text(
                                          'Book Now'
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
