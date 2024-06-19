import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playandpizza/main.dart';
import 'package:playandpizza/model/user.dart' as model;
import 'package:playandpizza/provider/user_provider.dart';
import 'package:playandpizza/screens/order_pizza_page_complete.dart';
import 'package:playandpizza/utils/color.dart';
import 'package:playandpizza/widgets/appbar_isisaldo_widget.dart';
import 'package:provider/provider.dart';

class OrderPizzaPageScreen extends StatefulWidget {
  final String pizzaImage;
  final String pizzaName;
  final int pizzaPrice;
  const OrderPizzaPageScreen({
    super.key,
    required this.pizzaImage,
    required this.pizzaName,
    required this.pizzaPrice,
  });

  @override
  State<OrderPizzaPageScreen> createState() => _OrderPizzaPageScreenState();
}

class _OrderPizzaPageScreenState extends State<OrderPizzaPageScreen> {
  String get pizzaImage => widget.pizzaImage;
  String get pizzaName => widget.pizzaName;
  int get pizzaPrice => widget.pizzaPrice;
  int _slices = 0;
  late int newSlices;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<UserProvider>(context, listen: false).refreshUser();
    model.User? user = Provider.of<UserProvider>(context).getUser;
    if (user?.username != null) {
      _slices = user!.slices;
      newSlices = _slices - pizzaPrice;
    }

    return Scaffold(
      appBar: const AppBarIsiSaldo(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lokasi Pengiriman',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    'Alamat pengirimian', // placeholder alamat
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: backgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(
                      color: primaryColor,
                    ),
                  ),
                ),
                child: Text(
                  'Pilih lokasi di peta',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: primaryColor),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 16),
              height: 1,
              width: double.infinity,
              decoration: const BoxDecoration(
                  border: BorderDirectional(top: BorderSide(width: 1))),
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.black,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: -4,
                      blurRadius: 7,
                      offset: Offset(0, 6), // changes position of shadow
                    ),
                  ],
                ),
                child: Container(
                  margin: const EdgeInsets.all(1.25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  child: SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, top: 8.0, bottom: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              pizzaImage,
                              width: 130,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  pizzaName,
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(child: Builder(builder: (context) {
                                  if (pizzaPrice == 1) {
                                    return Text(
                                      '$pizzaPrice slice',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      textAlign: TextAlign.end,
                                    );
                                  }
                                  return Text(
                                    '$pizzaPrice slices',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.end,
                                  );
                                })),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 16),
              height: 1,
              width: double.infinity,
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.black,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: -4,
                      blurRadius: 7,
                      offset: Offset(0, 6), // changes position of shadow
                    ),
                  ],
                ),
                child: Container(
                  margin: const EdgeInsets.all(1.25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  child: SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 6.0, left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ringkasan Pembayaran',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, left: 1.0, right: 9.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Balance',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Builder(builder: (context) {
                                  if (slices == 1) {
                                    return Text(
                                      '$_slices slice',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      textAlign: TextAlign.end,
                                    );
                                  }
                                  return Text(
                                    '$_slices slices',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.end,
                                  );
                                })
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, left: 1.0, right: 9.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Harga',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Builder(builder: (context) {
                                  if (pizzaPrice == 1) {
                                    return Text(
                                      '$pizzaPrice slice',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      textAlign: TextAlign.end,
                                    );
                                  }
                                  return Text(
                                    '$pizzaPrice slices',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.end,
                                  );
                                })
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 8, bottom: 8, right: 9),
                            height: 1,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                border: BorderDirectional(
                                    top: BorderSide(width: 1))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, left: 1.0, right: 9.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sisa Balance',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Builder(builder: (context) {
                                  if (_slices == 1) {
                                    return Text(
                                      '$newSlices slice',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      textAlign: TextAlign.end,
                                    );
                                  }
                                  return Text(
                                    '$newSlices slices',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.end,
                                  );
                                })
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ]),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 50,
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        OrderPizzaPageComplete(newSlices: newSlices)));
          },
          child: Center(
            child: Text(
              'Lakukan pemesanan',
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: backgroundColor),
            ),
          ),
        ),
      ),
    );
  }
}
