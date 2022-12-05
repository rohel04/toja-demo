import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toja_demo/colors_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../injection_container.dart';
import '../../../../authentication/presentation/pages/sign_in_home_screen.dart';
import '../../../../splash_screen/presentation/wrapper.dart';
import '../bloc/myaccount_bloc.dart';

class MyAccountHomeScreen extends StatefulWidget {
  const MyAccountHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyAccountHomeScreen> createState() => _MyAccountHomeScreenState();
}

class _MyAccountHomeScreenState extends State<MyAccountHomeScreen> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: BlocProvider(
  create: (context) => MyaccountBloc(getUserDetails: sl())..add(GetUserDetailsEvent()),
  child: BlocBuilder<MyaccountBloc, MyaccountState>(
        builder: (context, state) {
          if(state is UserDetailsState){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
            color: ColorUtil.kAuthColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 30,
                      backgroundColor: Colors.white,
                      backgroundImage:  NetworkImage('${state.user!.profilePicture}'),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [Text('${state.user!.displayName}' ,style: TextStyle(color: Colors.white,fontSize: 18), ),SizedBox(width: 10),Text(state.user!.userType==0?'(Consumer)':'(Vendor)',style: TextStyle(color: Colors.white,fontSize: 18),)]),
                        Text('${state.user!.email}',style: TextStyle(color: Colors.white,fontSize: 12))
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(onPressed: (){}, child: Text('Edit Profile',style: TextStyle(color: ColorUtil.kAuthColor),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 40),
                  elevation: 0.0
                ),
                )
              ],
            ),
          ),
           ElevatedButton(onPressed: () async{
            await FirebaseAuth.instance.signOut();
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Wrapper()), (route) => false);
           },child: Text('Sign Out',style: TextStyle(color:ColorUtil.kAuthColor),),
           style: ElevatedButton.styleFrom(
             backgroundColor: Colors.white,
             maximumSize: Size(double.infinity, 50),
             elevation: 0.0
           ),
           )
        ],
      );
          }
          else if(state is UserDetailError){
            return Text('Server Error');
          }
          else if (state is UserDetailLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else{
            return Container();
          }
  },
),
),

    );
  }
}
