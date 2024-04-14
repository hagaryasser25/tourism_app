import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourism_app/screens/user/book_ticket.dart';
import 'package:tourism_app/screens/user/place_history.dart';
import 'package:tourism_app/screens/user/place_location.dart';
import 'package:tourism_app/screens/user/user_transportations.dart';

class PlaceDetails extends StatefulWidget {
  String name;
  String price;
  String foreginPrice;
  String governorate;
  String address;
  String history;
  String latitude;
  String longitude;
  String imageUrl;
  PlaceDetails(
      {required this.name,
      required this.price,
      required this.foreginPrice,
      required this.governorate,
      required this.address,
      required this.history,
      required this.latitude,
      required this.longitude,
      required this.imageUrl});

  @override
  State<PlaceDetails> createState() => _PlaceDetailsState();
}

class _PlaceDetailsState extends State<PlaceDetails> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text('${widget.name}'),
          ),
          body: Column(children: [
            Card(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 15, bottom: 15),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 15.w),
                          child: Image.network('${widget.imageUrl}'),
                        ),
                      ],
                    )),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'اسم المكان : ${widget.name}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'سعرالتذكرة للمصرى : ${widget.price} جنيه',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'سعر التذكرة للسائح : ${widget.foreginPrice}دولار',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'العنوان : ${widget.address}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'المحافظة : ${widget.governorate}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 10.w,
                left: 10.w,
              ),
              child: Row(
                children: [
                  ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: 170.w, height: 50.h),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(25), // <-- Radius
                          ),
                        ),
                        child: Text(
                          'حجز تذكرة',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontFamily: 'Cairo',
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return BookTicket(
                              place: widget.name,
                            );
                          }));
                        },
                      )),
                  SizedBox(
                    width: 10.w,
                  ),
                  ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: 172.w, height: 50.h),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(25), // <-- Radius
                          ),
                        ),
                        child: Text(
                          'عرض الأحداث التاريخية',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontFamily: 'Cairo',
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return PlaceHistory(
                              name: widget.name,
                              imageUrl: widget.imageUrl,
                              history: widget.history,
                            );
                          }));
                        },
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 10.w,
                left: 10.w,
              ),
              child: Row(
                children: [
                  ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: 170.w, height: 50.h),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.amber,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(25), // <-- Radius
                          ),
                        ),
                        child: Text(
                          "وسائل الوصول",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontFamily: 'Cairo',
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return UserTransportations(
                              place: widget.name,
                            );
                          }));
                        },
                      )),
                  SizedBox(
                    width: 10.w,
                  ),
                  ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: 170.w, height: 50.h),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(25), // <-- Radius
                          ),
                        ),
                        child: Text(
                          'الموقع',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontFamily: 'Cairo',
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return PlaceLocation(
                              latitude: widget.latitude,
                              longitude: widget.longitude,
                            );
                          }));
                        },
                      )),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
