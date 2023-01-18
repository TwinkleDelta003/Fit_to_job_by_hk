import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import '../Constant/Colorpath.dart';

class Helper {
    Widget customCount(
      {String bName,
      double height,
      double width,
      FontWeight fweight,
      fColor,
      context}) {
    return Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            gradient: const LinearGradient(
              colors: [btnColor1, btnColor2],
            )),
        child: Center(
          child: Text(
            bName,
            style: TextStyle(
                color: Colors.white, fontSize: height, fontWeight: fweight),
          ),
        ));
  }
  Widget customText(
      {String text,
      double fontSize,
      Color color,
      TextOverflow overflow,
      TextAlign align,
      FontWeight fWeight}) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fWeight,
        overflow: overflow,
      ),
    );
  }

  Widget customText1(
      {String text,
      double fontSize,
      TextOverflow overflow,
      Color color,
      TextAlign align,
      FontWeight fWeight}) {
    return Text(
      text,
      softWrap: true,
      maxLines: 3,
      textAlign: align,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fWeight,
          overflow: overflow),
    );
  }
  
  Widget customMaterialButton(
      {String bName,
      double fSize,
      FontWeight fweight,
      fColor,
      context,
      VoidCallback press}) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [btnColor1, btnColor2],
          )),
      child: MaterialButton(
        elevation: 4,
        onPressed: press,
        child: Text(
          bName,
          style: TextStyle(
              color: Colors.white, fontSize: fSize, fontWeight: fweight),
        ),
      ),
    );
  }

  Widget customMaterialButton1(
      {String bName,
      double fSize,
      FontWeight fweight,
      fColor,
      context,
      VoidCallback press}) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffffffff)),
      child: MaterialButton(
        elevation: 4,
        onPressed: press,
        child: Text(
          bName,
          style: TextStyle(
              color: const Color(0xff008982),
              fontSize: fSize,
              fontWeight: fweight),
        ),
      ),
    );
  }

  Widget customTextField( {
    String hintText,
    List<TextInputFormatter> inputFormatter,
    TextEditingController controller,
    BuildContext context,
    int maxLines,
    bool obscureText,
    Widget suffix,
    bool isEnabled,
    TextInputType type,
    int mLength,
    Function(String) onChange,
    Widget prefix,
    String initText,
    String lText,
    
  }) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.3,
      child: TextFormField(
        initialValue: initText,
        textInputAction: TextInputAction.next,
        inputFormatters: inputFormatter,
        maxLength: mLength,
        
        enabled: isEnabled,
        onChanged: onChange,
        maxLines: maxLines,
        controller: controller,
        obscureText: obscureText,
        keyboardType: type,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          counterText: "",
          hintText: hintText,
          labelText: lText,
          prefixIcon: prefix,
          suffixIcon: suffix,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          border: const UnderlineInputBorder(),
        ),
      ),
    );
  }

//home page button
  Widget customMaterialButton2(
      {String bName,
      double fSize,
      FontWeight fweight,
      fColor,
      context,
      VoidCallback press}) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xff018F89)),
      child: MaterialButton(
        elevation: 4,
        onPressed: press,
        child: Text(
          bName,
          style: TextStyle(
              color: const Color(0xffffffff),
              fontSize: fSize,
              fontWeight: fweight),
        ),
      ),
    );
  }

//For Next Button
  Widget customMaterialButton3(
      {String bName,
      double fSize,
      FontWeight fweight,
      fColor,
      context,
      VoidCallback press}) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xff4E95FF)),
      child: MaterialButton(
        elevation: 4,
        onPressed: press,
        child: Text(
          bName,
          style: TextStyle(
              color: const Color(0xffFFFFFF),
              fontSize: fSize,
              fontWeight: fweight),
        ),
      ),
    );
  }

  //For Skip Button
  Widget customMaterialButton4(
      {String bName,
      double fSize,
      FontWeight fweight,
      fColor,
      context,
      VoidCallback press}) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffFE4A32)),
      child: MaterialButton(
        elevation: 4,
        onPressed: press,
        child: Text(
          bName,
          style: TextStyle(
              color: const Color(0xffFFFFFF),
              fontSize: fSize,
              fontWeight: fweight),
        ),
      ),
    );
  }
  
  // REsult Button
  Widget customMaterialButton5(
      {String bName,
      double fSize,
      FontWeight fweight,
      fColor,
      context,
      VoidCallback press}) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 92, 173, 150)),
      child: MaterialButton(
        elevation: 4,
        onPressed: press,
        child: Text(
          bName,
          style: TextStyle(
              color: const Color(0xffffffff),
              fontSize: fSize,
              fontWeight: fweight),
        ),
      ),
    );
  }
  Widget customPinPut(
      {TextEditingController controller, Function(String) onCompleted}) {
    return Pinput(
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
      length: 4,
      controller: controller,
      focusNode: FocusNode(),
      closeKeyboardWhenCompleted: true,
      hapticFeedbackType: HapticFeedbackType.mediumImpact,
      keyboardType: TextInputType.number,
      onCompleted: onCompleted,
      enabled: true,
      showCursor: true,
    );
  }

  void customSnackbar(
      {MaterialColor bgColor,
      Color msgColor,
      message,
      Icon icon,
      Duration duration,
      title}) {}
}

Widget customSnackbar(
    {String msg,
    String label,
    Color lColor,
    VoidCallback press,
    Color chooseColor,
    TextStyle style,
    Duration time}) {
  return SnackBar(
    backgroundColor: chooseColor,
    content: Text(msg, style: style),
    action: SnackBarAction(
      label: label,
      textColor: lColor,
      onPressed: press,
    ),
    duration: time,
  );
}


