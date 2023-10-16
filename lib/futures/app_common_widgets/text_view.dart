import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum FontFamily {
  inriaSans,
  poppins,
}

class TextView extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final int? maxLine;
  final bool? softWrap;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final FontFamily? fontFamily;

  const TextView(
      this.text,
      {
        Key? key,
        this.size,
        this.weight,
        this.color,
        this.maxLine,
        this.softWrap,
        this.overflow = TextOverflow.ellipsis,
        this.textAlign,
        this.textDirection,
        this.fontFamily
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(textTheme: getTheme(context),),

      child: Text(
          text,

          textAlign: textAlign,
          maxLines: maxLine,
          softWrap: softWrap,
          textDirection: textDirection,

          style: TextStyle(
              fontSize: size,
              fontWeight: weight,
              overflow: overflow,
              color: color,
            ),

      ),
    );
  }

  TextTheme getTheme(BuildContext context, ){


    switch (fontFamily) {
      //InriaSans
      case FontFamily.inriaSans:
        return GoogleFonts.inriaSansTextTheme(Theme.of(context).textTheme,);
      //Poppins
      case FontFamily.poppins:
        return GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme,);

      //default - InriaSans
      case null:
        return GoogleFonts.inriaSansTextTheme(Theme.of(context).textTheme,);
    }

  }

}