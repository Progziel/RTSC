import 'package:boxing/screens/authentication/widgets/textfieldwidget.dart';
import 'package:flutter/material.dart';

screenIndexText(String titlr) {
  return Padding(
    padding: const EdgeInsets.only(left: 16, top: 5),
    child: Row(
      children: [
        Text(
          titlr,
          style: const TextStyle(color: Color(0xff746F6F)),
        )
      ],
    ),
  );
}

mainheading(String title) {
  return Padding(
    padding: const EdgeInsets.only(left: 15),
    child: Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: Color(0xff2F2E2E),
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
        ),
      ],
    ),
  );
}

submainheading(String title) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, top: 5),
    child: Text(
      title,
      style: const TextStyle(
        color: Color(0xff746F6F),
        fontFamily: "Montserrat",
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
    ),
  );
}

sizedBoxwidget(double height, double width) {
  return SizedBox(
    height: height,
    width: width,
  );
}

texttilewidget(String title, hinttext, double paddingtop) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Padding(
        padding: EdgeInsets.only(left: 15, top: paddingtop),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color(0xff746F6F),
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      customtextfieldwidget(hinttext),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

containertextfield(String title) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 15, top: 40, right: 15),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xff746F6F),
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xff746F6F),
              )),
        ),
      )
    ],
  );
}
