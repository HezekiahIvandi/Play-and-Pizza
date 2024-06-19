import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:playandpizza/screens/isi_saldo_4.dart';
import 'package:playandpizza/widgets/appbar_isisaldo_widget.dart';
import 'package:playandpizza/utils/color.dart';
import 'package:google_fonts/google_fonts.dart';

class IsiSaldo3 extends StatefulWidget {
  final int selectedOption;
  const IsiSaldo3({
    super.key,
    required this.selectedOption,
  });

  @override
  State<IsiSaldo3> createState() => _IsiSaldo3State();
}

class _IsiSaldo3State extends State<IsiSaldo3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const AppBarIsiSaldo(),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 18),
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              //TITLE
              const Center(
                child: Text(
                  "Isi Saldo",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  "Masukkan PIN akun Anda",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "PIN",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(153, 158, 158, 158),
                          width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(153, 158, 158, 158),
                          width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                ),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 140,
                height: 45,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => IsiSaldo4(
                                selectedOption: widget.selectedOption,
                              )),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  child: Text(
                    'Kirim',
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: backgroundColor),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
