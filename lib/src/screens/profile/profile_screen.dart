import 'package:first_project01/src/common/constants/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.white,
        border: Border(),
        middle: Text('Профиль'),
      ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 32,),
              Center(child: SvgPicture.asset('images/svg/profile.svg')),
              SizedBox(height: 15,),
              Text('Duman Kairzhanov', style: TextStyle(
                  fontSize: 24,
                  color: AppColors.black,
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 12,),
              Text('kairzhanovduman@gmail.com', style: TextStyle(
                  fontSize: 16,
                  color: AppColors.grey,
                  fontWeight: FontWeight.normal
              ),
              ),
              SizedBox(height: 27,),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                      onPressed: () {},
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Выйти', style: TextStyle(
                          color: AppColors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.normal
                          ),                       
                        ),
                      ),
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.white
                  ),
                  ),
              )
            ],
          ),
        )
    );
  }
}
