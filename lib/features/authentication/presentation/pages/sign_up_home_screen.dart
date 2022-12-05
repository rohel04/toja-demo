import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:toja_demo/colors_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toja_demo/common/widgets/top_stack.dart';
import 'package:toja_demo/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:toja_demo/generated/locale_keys.g.dart';
import '../../../../injection_container.dart';
import '../../../onboarding/presentation/pages/select_categories.dart';
import '../widgets/consumer_form.dart';
import '../widgets/vendor_form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String email = '';
  String password = '';
  String? fullname='';
  String? username='';
  String? vendor_name='';
  String? street_address='';
  String? city='';
  int selected_radio=1;
  String? contact;


  late bool _passwordVisible;


  final _formkey = GlobalKey<FormState>();
  Future<void> startAuthentication(BuildContext buildContext) async {
    bool? validity = _formkey.currentState?.validate();
    if (validity!) {
      _formkey.currentState?.save();
      buildContext.read<AuthenticationBloc>().add(GetAuthenticationEvent(email: email, password: password));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthenticationBloc>(),
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopStack(
                    title: LocaleKeys.Sign_up.tr()
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.Register_as.tr(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: ColorUtil.kAuthTextColor),
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:[
                                  Radio(
                                  // fillColor: MaterialStateColor.resolveWith((states) => ColorUtil.kAuthTextColor),
                                  activeColor: ColorUtil.kAuthColor,
                                  value: 1,
                                  groupValue: selected_radio,
                                  onChanged: (value) {
                                    setState(() {
                                      selected_radio = value!;
                                    });
                                    print(selected_radio);
                                  },
                                ),
                                  Text(LocaleKeys.Consumer.tr(),style:TextStyle(
                                      fontSize: 16,
                                      color:selected_radio==1? ColorUtil.kAuthColor:ColorUtil.kAuthTextColor),)
                                ]
                            ),
                            Row(
                                children:[ Radio(
                                  // fillColor: MaterialStateColor.resolveWith((states) => ColorUtil.kAuthColor),
                                  activeColor: ColorUtil.kAuthColor,
                                  value: 2,
                                  groupValue: selected_radio,
                                  onChanged: (value) {
                                    setState(() {
                                      selected_radio = value!;
                                    });
                                    print(selected_radio);
                                  },
                                ),
                                  Text(LocaleKeys.Vendor.tr(),style:TextStyle(
                                      fontSize: 16,
                                      color:selected_radio==2? ColorUtil.kAuthColor:ColorUtil.kAuthTextColor),)

                                ]
                            ),
                          ],
                        ),
                        BlocListener<AuthenticationBloc,AuthenticationState>(
                            listener:(context,state){
                          if (state is RegistrationSuccess) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                              content: Text(LocaleKeys.Signed_up_success.tr()),
                              backgroundColor: Colors.green,
                            ));
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SelectCategoriesScreen()));
                          }
                          if (state is RegistrationError) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                              content: Text('${state.message}'),
                              backgroundColor: Colors.red,
                            ));
                          }

                        },
                          child: selected_radio==1?ConsumerForm():VendorForm(),
                        ),


                      ]
                    ),
                  ),
                                  ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}

class PickedFile {
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height - 90);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class Language {
  String title;
  String logo;
  String key;

  Language({required this.title, required this.logo, required this.key});
}
