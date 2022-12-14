import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toja_demo/features/authentication/presentation/pages/sign_in_home_screen.dart';
import 'package:toja_demo/generated/locale_keys.g.dart';

import '../../../../colors_util.dart';
import '../../../../core/util/validator.dart';

import '../bloc/authentication_bloc.dart';
import 'custom_textfield.dart';
import 'modal_bottom_sheet.dart';

class ConsumerForm extends StatefulWidget {
  const ConsumerForm({Key? key}) : super(key: key);

  @override
  State<ConsumerForm> createState() => _ConsumerFormState();
}

class _ConsumerFormState extends State<ConsumerForm> {



  final _formkey = GlobalKey<FormState>();
  Future<void> startAuthentication(BuildContext buildContext) async {
    bool? validity = _formkey.currentState?.validate();
    if (validity!) {
      _formkey.currentState?.save();
      print(fullname);
      buildContext.read<AuthenticationBloc>().add(RegisterUserEvent(email: email, password: password,userName:username,contact: contact,fullName: fullname,imageFile: imageFile!, userType: userType));

      //call api
    }
  }
  String email = '';
  String password = '';
  String fullname='';
  String username='';
  String contact='';
  File? imageFile;
  int userType=0;


  late bool _passwordVisible;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;

  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    Localizations.localeOf(context);
    super.didChangeDependencies();

  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 18,),
                Text(
                  LocaleKeys.Sign_up_with.tr(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: ColorUtil.kAuthTextColor),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      child: Image.asset(
                        'assets/images/google.png',
                        height: 50,
                      ),
                    ),
                    SizedBox(width: 15),
                    InkWell(
                      child: Image.asset('assets/images/fb.png',
                          height: 50),
                    ),
                    SizedBox(width: 15),
                    InkWell(
                      child: Image.asset('assets/images/apple.png',
                          height: 50),
                    ),
                    SizedBox(width: 15),
                    InkWell(
                      child: Image.asset('assets/images/email.png',
                          height: 50),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  LocaleKeys.Full_name.tr(),
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: ColorUtil.kAuthTextColor),
                ),
                CustomTextField(onChanged: (String value) {
                  fullname=value;
                }, validation: CustomValidator.emptyValidation, obscureText: false,),
                SizedBox(height: 20),
                Text(
                  LocaleKeys.Email.tr(),
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: ColorUtil.kAuthTextColor),
                ),
                CustomTextField(obscureText: false, onChanged: (value){email=value;}, validation: CustomValidator.emailValidator,keyboardType: TextInputType.emailAddress,),
                SizedBox(height: 20),
                Text(
                  LocaleKeys.Username.tr(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: ColorUtil.kAuthTextColor),
                ),
                CustomTextField(obscureText: false, onChanged: (value){username=value;}, validation: CustomValidator.emptyValidation),
              ]),
          SizedBox(height: 20),
          Text(
            LocaleKeys.Password.tr(),
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: ColorUtil.kAuthTextColor),
          ),
          TextFormField(
            obscureText: !_passwordVisible,
            style: TextStyle(
                fontSize: 16, color: Color(0xFF3A4667)),
            keyboardType: TextInputType.emailAddress,
            key: ValueKey('password'),
            validator: (value) {
              return CustomValidator.passwordValidator(value);
            },
            onSaved: (value) {
              password = value!;
            },
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                contentPadding:
                EdgeInsets.fromLTRB(0, 20, 0, 0),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                    icon: _passwordVisible != false
                        ? Icon(
                      Icons.visibility_outlined,
                      color: ColorUtil.kAuthColor,
                    )
                        : Icon(Icons.visibility_off_outlined,
                        color: ColorUtil.kAuthColor))),
          ),
          SizedBox(height: 20),
          Text(
            LocaleKeys.Contact.tr(),
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: ColorUtil.kAuthTextColor),
          ),
        CustomTextField(obscureText: false, onChanged: (value){contact=value;}, validation: CustomValidator.phoneValidator,keyboardType: TextInputType.number,),
          SizedBox(height: 20),
          Text(
            LocaleKeys.Upload_profile.tr(),
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: ColorUtil.kAuthTextColor),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: (){
              showModalBottomSheet(context: context, builder: (context)=>
                  Container(
                    height: 150,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: CustomModalBottomSheet(onChanged: (File? value) {
                      setState((){
                      imageFile=value!;
                      });
                    },),
                  )
              );
            },
            child: imageFile==null?Image.asset('assets/images/imagepicker_icon.png'):Image.file(imageFile!,fit: BoxFit.contain,),
          ),

          SizedBox(height: 18),
          BlocBuilder<AuthenticationBloc,
              AuthenticationState>(
            builder: (context, state) {
              return ElevatedButton(
                onPressed: state is AuthenticationLoading
                    ? null
                    : () async {
                  startAuthentication(context);
                  print(username);
                  // context.read<AuthenticationBloc>().add(RegisterUserEvent(email: email, password: password));
                },
                child: state is AuthenticationLoading
                    ? SizedBox(
                  child: CircularProgressIndicator(),
                  height: 10,
                  width: 10,
                )
                    : Text(LocaleKeys.Sign_up.tr()),
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorUtil.kAuthColor,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(10)),
                    padding: EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20)),
              );
            },
          ),
          SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.Already_have_account.tr(),
                style: TextStyle(
                    fontSize: 14,
                    color: ColorUtil.kAuthTextColor),
              ),
              SizedBox(width: 5),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
                },
                child: Text(
                  LocaleKeys.Sign_in.tr(),
                  style:
                  TextStyle(color: ColorUtil.kAuthColor),
                ),
              )
            ],
          ),
          SizedBox(height: 18),
        ],
      ),
    );
  }

}
