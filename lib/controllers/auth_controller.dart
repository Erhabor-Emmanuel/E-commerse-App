import 'dart:js';
import 'dart:typed_data';
import 'package:ecommerce_app/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  //Function to add image to storage
  _uploadImageToStorage(Uint8List? image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePic')
        .child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putData(image!);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  //Function to enable users pick image
  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    // Pick an image
    XFile? _file = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (_file != null) {
      return await _file.readAsBytes();
    } else {
      print('No Image selected');
    }
  }

  //Function to SignUp users
  Future<String> sigupUsers(String full_name, String username, String password,
      String email, Uint8List? image) async {
    String res = 'some error occurred';
    try {
      if (full_name.isNotEmpty &&
          password.isNotEmpty &&
          email.isNotEmpty &&
          image != null) {
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.email);

        String downloadImage = _uploadImageToStorage(image);

        await firebaseStore.collection('users').doc(cred.user!.uid).set({
          'fullName': full_name,
          'userName': username,
          'email': email,
          'image': downloadImage,
        });
        res = 'success';
      } else {
        res = 'please fields must not be empty';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //Function to log in users
  loginUsers(String email, String password) async {
    String res = 'some error occured';
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
        print('you are now logged in');
      } else {
        res = 'please fields must not be empty';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //Function to retrive password
  forgotPasswoord(String email) async {
    String res = 'some error occured';
    try {
      if (email.isNotEmpty) {
        await firebaseAuth.sendPasswordResetEmail(email: email);
        res = 'success';
      } else {
        res = 'Please enter your email';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}
