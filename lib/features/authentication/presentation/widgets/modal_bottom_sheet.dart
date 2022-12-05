import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../colors_util.dart';

class CustomModalBottomSheet extends StatefulWidget {

  ValueChanged<File?> onChanged;

  CustomModalBottomSheet({Key? key,required this.onChanged}) : super(key: key);

  @override
  State<CustomModalBottomSheet> createState() => _CustomModalBottomSheetState();
}

class _CustomModalBottomSheetState extends State<CustomModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
          Text('Upload',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: ColorUtil.kAuthTextColor)),
          Row(
            children: [
              Expanded(
                  child: Column(
                      children:[ IconButton(
                        onPressed: () {
                          _getFromCamera();
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.camera,size: 40,color: ColorUtil.kAuthColor),),
                        const SizedBox(height: 5),
                        Text('Camera',style: TextStyle(color: ColorUtil.kAuthTextColor),)
                      ]
                  )),
              const SizedBox(width: 5),
              Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              _getFromGallery();
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.photo_library,size: 40,color: ColorUtil.kAuthColor)),
                        const SizedBox(height: 5),
                        Text('Photo library',style: TextStyle(color: ColorUtil.kAuthTextColor))
                      ]
                  )),
            ],
          ),
        ]
    );
  }
  Future<void> _getFromCamera() async {
    XFile? xFile = await ImagePicker()
        .pickImage(source: ImageSource.camera, maxHeight: 1800, maxWidth: 1800);
    if (xFile != null) {

        widget.onChanged(File(xFile.path));

    }
  }

  Future<void> _getFromGallery() async {
    XFile? xFile = await ImagePicker().pickImage(
        source: ImageSource.gallery, maxWidth: 1800, maxHeight: 1800);
    if (xFile != null) {

        widget.onChanged(File(xFile.path));

    }
  }
}
