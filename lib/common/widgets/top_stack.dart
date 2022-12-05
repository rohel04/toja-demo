import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../colors_util.dart';
import '../../core/util/custom_clip_path.dart';

class TopStack extends StatefulWidget {
  String title;
   TopStack({Key? key,required this.title}) : super(key: key);

  @override
  State<TopStack> createState() => _TopStackState();
}

class _TopStackState extends State<TopStack> {


  int ready=0;

  var items = [
    Language(title: 'English', logo: 'assets/images/eng.png', key: 'en'),
    Language(title: 'Hebrew', logo: 'assets/images/heb.png', key: 'he'),
  ];



  String dropdownvalue='en';

  @override
  Widget build(BuildContext context) {

    String? value=context.locale.toString()=='en'?'en':'he';

    return Stack(children: [
      ClipPath(
        child: Container(
          height: 180,
          color: ColorUtil.kAuthColor,
        ),
        clipper: context.locale.toString()=='en'?CustomClipPath():CustomClipPathHeb(),
      ),
      Positioned(
          bottom: 0,
          child: Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text('${widget.title}',
                  style: TextStyle(
                      fontSize: 26, color: Color(0xFF050E26))))),
      Positioned(
        height: 60,
        top: 50,
        left: 0,
        right: 0,
        child: Container(
            height: 20,
            width: 20,
            child:
            Image.asset('assets/images/logo.png',)),
      ),
      Positioned(
          right: 0,
          top: 0,
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF6144F3),
            ),
            height: 40,
            padding: EdgeInsets.all(10),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                value: value,
                icon: Icon(Icons.arrow_drop_down_sharp,
                    color: Colors.white, size: 20),
                items: items.map((e){
                  return DropdownMenuItem(value:e.key, child: Image.asset('${e.logo}',height: 15,width: 15));
    } ).toList(),
                onChanged: (value) async{
                    await context.setLocale(Locale(value!));
                    setState(() {
                     dropdownvalue=value;
                    });
                  print(dropdownvalue);
                },
              ),
            ),
          ))
    ]);
  }
}


class Language {
  String title;
  String logo;
  String key;

  Language({required this.title, required this.logo, required this.key});
}