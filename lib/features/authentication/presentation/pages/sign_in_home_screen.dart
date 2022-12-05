import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toja_demo/colors_util.dart';
import 'package:toja_demo/core/util/validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toja_demo/generated/locale_keys.g.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:toja_demo/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:toja_demo/common/widgets/top_stack.dart';
import 'package:toja_demo/features/authentication/presentation/pages/sign_up_home_screen.dart';
import '../../../../injection_container.dart';
import '../../../onboarding/presentation/pages/select_categories.dart';
import '../widgets/custom_textfield.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late bool _passwordVisible;
  final _formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  Future<void> startAuthentication(BuildContext buildContext) async {
    bool? validity = _formkey.currentState?.validate();
    if (validity!) {
      _formkey.currentState?.save();
      print('Inside function');
      print(email);
      buildContext.read<AuthenticationBloc>().add(GetAuthenticationEvent(email: email, password: password));
      //call api
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;

  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Localizations.localeOf(context);
  }



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> sl<AuthenticationBloc>(),
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                children: [
                  TopStack(title: LocaleKeys.Sign_in.tr(),),
                  SizedBox(height: 20),
                  Form(
                      key: _formkey,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    LocaleKeys.Email.tr(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: ColorUtil.kAuthTextColor),
                                  ),
                                  CustomTextField(onChanged: (String value) {
                                    email=value;
                                  },
                                  validation: CustomValidator.emailValidator,
                                    obscureText: false,
                                    keyboardType: TextInputType.emailAddress,
                                  )
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
                            SizedBox(height: 18),
                            Text(
                              LocaleKeys.Forget_password.tr(),
                              style: TextStyle(color: ColorUtil.kAuthColor),
                            ),
                            SizedBox(height: 18),
                            BlocConsumer<AuthenticationBloc,AuthenticationState>(
                              listener: (context,state){
                                if(state is AuthenticationLoaded){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signed in Successfully'),backgroundColor: Colors.green,));
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SelectCategoriesScreen()));
                                }
                                if(state is AuthenticationError){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${state.message}'),backgroundColor: Colors.red,));

                                }
                              },
                              builder: (context, state) {
                                return ElevatedButton(
                                  onPressed:state is AuthenticationLoading?null: () async {
                                    startAuthentication(context);
                                    // context.read<AuthenticationBloc>().add(GetAuthenticationEvent(email: email, password: password));
                                  },
                                  child: state is AuthenticationLoading?SizedBox(child: CircularProgressIndicator(),height: 10,width: 10,):Text(LocaleKeys.Sign_in.tr()),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: ColorUtil.kAuthColor,
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)),
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
                                  LocaleKeys.Dont_have_account.tr(),
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: ColorUtil.kAuthTextColor),
                                ),
                                SizedBox(width: 5),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                                  },
                                  child: Text(
                                    LocaleKeys.Sign_up.tr(),
                                    style: TextStyle(color: ColorUtil.kAuthColor),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 18),
                            Row(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Divider(
                                      color: Color(0xFFCED1D9),
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                      child: Text(
                                        LocaleKeys.Or_continue_with.tr(),
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: ColorUtil.kAuthTextColor),
                                      )),
                                  Expanded(
                                    child: Divider(
                                      color: Color(0xFFCED1D9),
                                    ),
                                  ),
                                ]),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                              ],
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}



class Language {
  String title;
  String logo;
  String key;

  Language({required this.title, required this.logo, required this.key});
}
