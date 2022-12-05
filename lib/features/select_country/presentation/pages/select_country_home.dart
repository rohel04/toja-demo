import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toja_demo/colors_util.dart';
import 'package:toja_demo/core/util/custom_statusbar.dart';
import 'package:toja_demo/features/authentication/presentation/pages/sign_in_home_screen.dart';
import 'package:toja_demo/features/select_country/presentation/bloc/country_bloc.dart';
import '../../domain/entities/country.dart';

class SelectCountryScreen extends StatefulWidget {
  const SelectCountryScreen({Key? key}) : super(key: key);

  @override
  State<SelectCountryScreen> createState() => _SelectCountryScreenState();
}

class _SelectCountryScreenState extends State<SelectCountryScreen> {
  int card_value = 1;

  List<Country> countries = [
    Country(code: 01, name: 'China', key: 'ch', flag: 'china.png'),
    Country(code: 02, name: 'Israel', key: 'is', flag: 'israel.png'),
    Country(code: 03, name: 'United Kingdom', key: 'uk', flag: 'uk.png'),
    Country(
        code: 04, name: 'United State of America', key: 'usa', flag: 'usa.png'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CountryBloc>().add(LoadSelectedCountryEvent());
  }

  @override
  Widget build(BuildContext context) {
    StatusBar.CustomStatusBar();
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: ColorUtil.kAuthColor,
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.fill)),
          ),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: card_value == 1
                  ? SimpleDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      title: Text('Country'),
                      children: [
                        BlocBuilder<CountryBloc, CountryState>(
                          builder: (context, state) {
                            return SimpleDialogOption(
                                child: state is CountryDefault
                                    ? ListTile(
                                        title: Text(
                                          '${state.defaultcountry.name}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xFF3A4667)),
                                        ),
                                        leading: Image.asset(
                                          'assets/images/country/${state.defaultcountry.flag}',
                                          height: 30,
                                          width: 30,
                                        ),
                                        trailing: Icon(
                                          Icons.check,
                                          color: ColorUtil.kAuthColor,
                                          size: 30,
                                        ),
                                        onTap: () {
                                          context.read<CountryBloc>().add(
                                              StoreSelectedCountryEvent(
                                                  code:
                                                      state.defaultcountry.code,
                                                  key: state.defaultcountry.key,
                                                  flag:
                                                      state.defaultcountry.flag,
                                                  name: state
                                                      .defaultcountry.name));

                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignInScreen()));
                                        },
                                      )
                                    : Text('No country Selected'));
                          },
                        ),
                        Container(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Divider(
                              height: 5,
                              color: ColorUtil.kAuthTextColor,
                            )),
                        SimpleDialogOption(
                          onPressed: () {},
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                card_value = 2;
                              });
                            },
                            title: Text(
                              'Select other country',
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xFF3A4667)),
                            ),
                            trailing:
                                Icon(Icons.arrow_forward_ios_sharp, size: 20),
                          ),
                        )
                      ],
                    )
                  : BlocConsumer<CountryBloc, CountryState>(
                      listener: (context, state) {
                        if (state is CountryLoaded) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInScreen()));
                        }
                      },
                      builder: (context, state) {
                        return SimpleDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          title: Text('Select your country'),
                          children: countries.map((element) {
                            return ListTile(
                              onTap: () {
                                context.read<CountryBloc>().add(
                                    StoreSelectedCountryEvent(
                                        code: element.code,
                                        key: element.key,
                                        flag: element.flag,
                                        name: element.name));
                              },
                              title: Text('${element.name}',
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xFF3A4667))),
                              leading: Image.asset(
                                'assets/images/country/${element.flag}',
                                height: 25,
                                width: 25,
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ))
        ],
      )),
    );
  }
}
