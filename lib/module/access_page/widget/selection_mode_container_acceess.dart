import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/data/enum/user_type_enum.dart';
import 'package:food_app/module/access_page/widget/selection_mode_button.dart';
import 'package:food_app/module/customer/sign_in/view/sign_in_page.dart';
import 'package:food_app/widgets/wavy_animated_text.dart';
import 'package:food_app/provider/credential_provider/typeof_user.dart';

class SelectionModeContainer extends StatelessWidget {
  const SelectionModeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return FittedBox(
      child: Container(
        width: screenWidth * 0.9,
        height: screenHeight * 0.7,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.4),
            borderRadius: BorderRadius.circular(50)),
        child: Column(
          children: [
            SizedBox(height:  screenHeight * 0.05,),
            const WaveyAnimatedText(text: "Select the mode"),
    
            SizedBox(height:  screenHeight * 0.1,),
            SelectModeButton(
              text: "Manager",
              event: () {},
            ),
            SizedBox(
              height: screenHeight * 0.1,
            ),
            SelectModeButton(
              text: "Supplier",
              event: () {},
            ),
            SizedBox(
              height: screenHeight * 0.1,
            ),
            Consumer(
              builder: (context, ref, child) => 
               SelectModeButton(
                text: "Customer",
                event: () {
                  ref.read(typeOfUser.notifier).state = UserTypeEnum.customer;
                  Navigator.of(context).pushNamed(SignInPage.pageName);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}