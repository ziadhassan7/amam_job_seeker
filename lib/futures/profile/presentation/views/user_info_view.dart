import 'package:flutter/material.dart';
import '../../../app_common_widgets/text_view.dart';
import '../../data/model/profile_model_data.dart';

class UserInfoView extends StatelessWidget {
  const UserInfoView({super.key, required this.data});

  final ProfileModelData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [

        infoWidget("Name", getFullName()),
        infoWidget("Phone Number", "0${getPhone()}"),
        infoWidget("City", getCity()),

      ],
    );
  }


  Widget infoWidget(String title, String data){
    return Row(
      children: [
        TextView("$title:", weight: FontWeight.bold,),
        const SizedBox(width: 10,),
        TextView(data),
      ],
    );
  }

  String getFullName(){
    if(data.name != null) {
      return data.name!.fullName ?? "No data provided";
    }

    return "No data provided";
  }

  String getPhone(){
    if(data.phone != null) {
      return data.phone!.first.phone ?? "--";
    }

    return "--";
  }

  String getCity(){
    if(data.address != null) {
      return data.address!.city ?? "--";
    }

    return "--";
  }
}
