import 'package:flutter/material.dart';
import 'package:playandpizza/screens/isi_saldo_3.dart';
import 'package:playandpizza/widgets/appbar_isisaldo_widget.dart';
import 'package:playandpizza/utils/color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playandpizza/widgets/text20500.dart';

class IsiSaldo2 extends StatefulWidget {
  const IsiSaldo2({super.key});

  @override
  State<IsiSaldo2> createState() => _IsiSaldo2State();
}

class _IsiSaldo2State extends State<IsiSaldo2> {
  int _selectedOption = 0;
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
                  "Pilih jumlah yang ingin Anda masukkan",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Radio(
                    value: 0,
                    groupValue: _selectedOption,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedOption = value!;
                      });
                    },
                  ),
                  const Text20500(
                    text: '1 koin (Rp. 5,000)',
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 1,
                    groupValue: _selectedOption,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedOption = value!;
                      });
                    },
                  ),
                  const Text20500(
                    text: '5 koin (Rp. 20,000)',
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 2,
                    groupValue: _selectedOption,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedOption = value!;
                      });
                    },
                  ),
                  const Text20500(
                    text: '15 koin (Rp. 50,000)',
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 3,
                    groupValue: _selectedOption,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedOption = value!;
                      });
                    },
                  ),
                  const Text20500(
                    text: '50 koin (Rp. 150,000)',
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 4,
                    groupValue: _selectedOption,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedOption = value!;
                      });
                    },
                  ),
                  const Text20500(
                    text: '100 koin (Rp. 250,000)',
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 140,
                height: 45,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => IsiSaldo3(
                                selectedOption: _selectedOption,
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
                    'Lanjut',
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
