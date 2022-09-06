import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EachSlide extends StatelessWidget {
  final String image;
  final String title, description;
  const EachSlide(
      {Key? key,
      required this.image,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(
            image,
            width: MediaQuery.of(context).size.width * 0.70,
            height: MediaQuery.of(context).size.height * 0.60,
          ),
        ),
        const SizedBox(height: 30),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.70,
          child: Text(
            title,
            style: GoogleFonts.ptSans(
              color: const Color.fromRGBO(0, 0, 0, 1),
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.70,
          child: Text(
            description,
            style: GoogleFonts.ptSans(
              color: const Color.fromRGBO(0, 0, 0, 1),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
