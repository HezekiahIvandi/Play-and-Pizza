import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playandpizza/main.dart';
import 'package:playandpizza/utils/color.dart';

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
  late int newSlices;

  @override
  void initState() {
    super.initState();
    newSlices = slices - pizzaPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        toolbarHeight: 60,
        backgroundColor: backgroundColor,
        scrolledUnderElevation: 0,
        title: Container(
          margin: const EdgeInsets.fromLTRB(4, 0, 0, 0),
          child: Image.asset(
            'assets/Logo_PNP_Light.png',
            width: 100,
            height: 100,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // Redirect Ke Top UP
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
              width: 150,
              height: 45,
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '$coins',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: backgroundColor),
                  ),
                  Container(
                    height: 32,
                    width: 32,
                    decoration: const BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: Image.asset(
                      'assets/coin.png',
                      width: 32,
                      height: 32,
                    ),
                  ),
                  Text(
                    '$slices',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: backgroundColor),
                  ),
                  Container(
                    height: 32,
                    width: 32,
                    decoration: const BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: Image.asset(
                      'assets/slices.png',
                      width: 16,
                      height: 16,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
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
                                      '$slices slice',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      textAlign: TextAlign.end,
                                    );
                                  }
                                  return Text(
                                    '$slices slices',
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
                                  if (slices == 1) {
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
          onPressed: () {},
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
