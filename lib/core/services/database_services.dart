abstract class DatabaseServices {
  //same......................................................
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });

  Future<dynamic> getData({
    required String path,
    required String uid,
  });

  Future<bool> isDataExit({required String path, required String uid});
}
