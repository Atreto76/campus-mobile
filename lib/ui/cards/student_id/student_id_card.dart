import 'package:campus_mobile_experimental/core/constants/app_constants.dart';
import 'package:campus_mobile_experimental/core/data_providers/cards_data_provider.dart';
import 'package:campus_mobile_experimental/core/data_providers/user_data_provider.dart';
import 'package:campus_mobile_experimental/core/models/student_id_barcode_model.dart';
import 'package:campus_mobile_experimental/core/models/student_id_name_model.dart';
import 'package:campus_mobile_experimental/core/models/student_id_photo_model.dart';
import 'package:campus_mobile_experimental/core/models/student_id_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:campus_mobile_experimental/ui/reusable_widgets/card_container.dart';

import 'package:provider/provider.dart';
import 'package:campus_mobile_experimental/core/data_providers/student_id_data_provider.dart';



class StudentIdCard extends StatelessWidget {

  String cardId = "student_id";

  @override
  Widget build(BuildContext context) {
    print("start of build");
    return CardContainer(
      /// TODO: need to hook up hidden to state using provider
      active: Provider.of<CardsDataProvider>(context).cardStates[cardId],
      hide: () => Provider.of<CardsDataProvider>(context, listen: false)
          .toggleCard(cardId),
      reload: () => Provider.of<StudentIdDataProvider>(context, listen: false)
          .fetchData(),
      isLoading: Provider.of<StudentIdDataProvider>(context).isLoading,
      titleText: CardTitleConstants.titleMap[cardId],
      errorText: Provider.of<StudentIdDataProvider>(context).error,
      child: () => buildCardContent(
          Provider.of<StudentIdDataProvider>(context).studentIdBarcodeModel,
          Provider.of<StudentIdDataProvider>(context).studentIdNameModel,
          Provider.of<StudentIdDataProvider>(context).studentIdPhotoModel,
          Provider.of<StudentIdDataProvider>(context).studentIdProfileModel,
          context),
    );

  }

  Widget buildTitle() {
    return Text(
      "Student ID",
      textAlign: TextAlign.left,
    );
  }

  Widget buildCardContent(StudentIdBarcodeModel barcodeModel, StudentIdNameModel nameModel, StudentIdPhotoModel photoModel,
                            StudentIdProfileModel profileModel, BuildContext context) {
    return Row(children: <Widget>[
      Container(
        child: Column(
          children: <Widget>[
            Image.network(
              photoModel.photoUrl,
              fit: BoxFit.contain,
              height: 125,
            ),
            SizedBox(height: 10),
            Text(profileModel.classificationType),
          ],
        ),
        padding: EdgeInsets.only(
          left: 10,
          right: 20,
        ),
      ),
      Column(children: <Widget>[
          Text(
            nameModel.firstName + " " + nameModel.lastName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textAlign: TextAlign.left,
          ),
        SizedBox(height: 5),
        Text(
              profileModel.collegeCurrent,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
              textAlign: TextAlign.left,
        ),
        SizedBox(height: 5),
        Text(
            profileModel.ugPrimaryMajorCurrent,
            textAlign: TextAlign.left,
        )
      ]),
    ]);
  }

}
