import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toja_demo/features/home/myprofile/data/models/user_model.dart';


abstract class MyAccountRemoteDataSource{
  Future<UserModel?> getUserDetails();

}

class MyAccountRemoteDataSourceImpl implements MyAccountRemoteDataSource{

  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseStore;
  MyAccountRemoteDataSourceImpl({required this.firebaseAuth,required this.firebaseStore});

  @override
  Future<UserModel?> getUserDetails() async{

    var uid=firebaseAuth.currentUser?.uid;
    var displayName=firebaseAuth.currentUser?.displayName;
    var email=firebaseAuth.currentUser?.email;
    var storeResult=await firebaseStore.collection('users').doc(uid).get();
    var profileImage=storeResult['image'];
    var userType=storeResult['usertype'];
    return UserModel(uid: uid,displayName: displayName,email: email,profilePicture: profileImage,userType: userType);

  }

}