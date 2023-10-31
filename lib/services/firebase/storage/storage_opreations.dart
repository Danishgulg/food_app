import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageOperations {
  final Reference refStorage = FirebaseStorage.instance.ref();

  // get the data from firebaseStorage

  Future<List<String>> getDataInUrl({required String bucketRef, required exerciselevel}) async {
    ListResult listResult;

    List<String> imageStringAddress = [];
    listResult = await refStorage.child(bucketRef).child(exerciselevel).listAll();

    for (final data in listResult.items) {
      String address = await data.getDownloadURL();
      imageStringAddress.add(address);
    }
      return imageStringAddress;
  }

  Future<void> putFile({required File file}) async {
    await refStorage.putFile(file);
  }
}
