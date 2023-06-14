import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../core/utils/webclient.dart';
import '../models/create_surgery_model.dart';
import '../models/surgery_rooms_details.dart';
import '../models/surgery_staff_model.dart';

class Repository {
  Future<List<SurgeryStaffModel>> getStaffDetails(
      {required String url}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
      final dynamic response = await WebClient.get(url);
      List<SurgeryStaffModel> surgeryStaffModel=[];
      for (int i=0;i<response.length;i++) {
        surgeryStaffModel.add(SurgeryStaffModel.fromJson(response[i]));
      }
      return surgeryStaffModel;
  }
  Future<SurgeryRoomModel> getSurgeryRooms({required String url}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.get(url);
    SurgeryRoomModel surgeryRoomModel = SurgeryRoomModel.fromJson(response);

    return surgeryRoomModel;
  }
   Future<CreateSurgeryModel> createSurgery({required String url,required dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.post(url,data);
    CreateSurgeryModel createSurgeryModel = CreateSurgeryModel.fromJson(response);

    return createSurgeryModel;
  }
}
