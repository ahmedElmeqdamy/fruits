abstract class DatabaseServices {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });
  //if uid is null it will return all data
  //we put nullable because we will use it in getting all products
  Future <dynamic> getData({
    required String path,
     String? uid,
    Map<String, dynamic>? query,
  });

  Future<bool> isDataExit({required String path, required String uid});
}
