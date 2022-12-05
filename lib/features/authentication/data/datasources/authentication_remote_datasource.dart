import 'dart:io';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:toja_demo/core/errors/exceptions.dart';
import 'package:toja_demo/core/errors/failures.dart';
import '../models/user_model.dart';

abstract class RemoteDataSource{
  Future<UserModel?> getAuthentication(String email,String password);
  Future<UserModel?> registerUser(String email, String password, String? fullName, String contact, int userType, File imageFile, String? vendorName, String? city, String? streetAddress,String? username);
}

class RemoteDataSourceImpl implements RemoteDataSource{
  
  final FirebaseAuth firebaseAuth;

  RemoteDataSourceImpl({required this.firebaseAuth});
  
  UserModel? _userFromFirebase(User? user){
    if(user==null){
      return null;
    }
    else{
      return UserModel(email: user.email, uid:user.uid);
    }
  }
  
  @override
  Future<UserModel?> getAuthentication(String email, String password) async{
    try{
      final authResult=await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return _userFromFirebase(authResult.user);
    }on FirebaseAuthException catch(e){
      switch(e.code){
        case 'user-not-found':
          {
            throw UserNotFoundException();
          }
        case 'wrong-password':
          {
            throw InvalidCredentialsException();
          }
        default:{
          throw ServerException();
        }
      }
    }
  }

  @override
  Future<UserModel?> registerUser(String email, String password, String? fullName, String contact, int userType, File imageFile, String? vendorName, String? city, String? streetAddress,String? username) async{
    try {
      var imgUrl;
      final authResult = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      String? uid = authResult.user?.uid;
      final ref=await FirebaseStorage.instance.ref().child('user/').child(basename(imageFile.path));
      await ref.putFile(imageFile);
      imgUrl=await ref.getDownloadURL();
       await FirebaseFirestore.instance.collection('users').doc(uid).set(
      {'fullname': fullName, 'username':username,'contact': contact, 'usertype': userType,'vendorname':vendorName,'city':city,'streetAddress':streetAddress,'image':imgUrl});
       if(userType==0){
         await firebaseAuth.currentUser?.updateDisplayName(fullName);
       }
       else{
         await firebaseAuth.currentUser?.updateDisplayName(vendorName);
       }
      await firebaseAuth.currentUser?.reload();
      return _userFromFirebase(authResult.user);
    }on FirebaseAuthException catch(e){
      switch(e.code){
      case 'email-already-in-use':
        throw UserAlreadyExistsException();
        default:{
          throw ServerException();
        }
      }
    }
  }



}