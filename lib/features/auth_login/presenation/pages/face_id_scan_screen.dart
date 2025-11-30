
import 'package:fintech_app/core/services/biometric_service.dart';
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/features/auth_login/presenation/pages/face_id_verified_screen.dart';
import 'package:fintech_app/features/auth_login/presenation/widget/home_indictor.dart';
import 'package:fintech_app/features/auth_login/presenation/widget/icon_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaceIdScanPage extends StatefulWidget {
  const FaceIdScanPage({super.key});

  @override
  State<FaceIdScanPage> createState() => _FaceIdScanPageState();
}

class _FaceIdScanPageState extends State<FaceIdScanPage> {
   bool _isProcessing = false;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _startAuth();
  }

  Future<void> _startAuth() async {
    setState(() {
      _isProcessing = true;
      _errorText = null;
    });

    final ok = await BiometricService.instance.authenticate(
      reason: 'Scan your face or fingerprint to continue',
    );

    if (!mounted) return;

    setState(() {
      _isProcessing = false;
    });

    if (ok) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const FaceIdVerifiedPage(),
        ),
      );
    } else {
      setState(() {
        _errorText = 'Authentication failed or cancelled';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: Stack(
        children: [
        const  Positioned.fill(
            child:  Image(image:AssetImage(
             'assets/images/imagefcae_id_scan.jpg',
             
            ),    
             fit: BoxFit.cover,
            )
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.55),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding:
                   EdgeInsets.symmetric(horizontal: 24.h, vertical: 16.w),
              child: Column(
                children: [
                 
                   Text(
                    'Face ID',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.inputBorder,
                    ),
                  ),
                  const Spacer(),

               
                  IconInfoCard(
                    size: 140.w,
                    icon: Container(
                      width: 66.w,
                      height: 56.h,
                    
                      child:const Image(image: AssetImage('assets/images/face id.png'))
                  
                    ),
                    title: 'Face ID',
                    
                  ),
                   SizedBox(height: 122.h),
 if (_isProcessing)
                    const CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  else
                     Text(
                      'Please wait until your scanning is complete',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                   SizedBox(height: 12.h),
                  if (_errorText != null) ...[
                    Text(
                      _errorText!,
                      style: const TextStyle(
                        color: Colors.redAccent,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    TextButton(
                      onPressed: _startAuth,
                      child: const Text(
                        'Try again',
                        style: TextStyle(color: AppColors.background),
                      ),
                    ),
                  ],
                // const    Text(
                //     'Please wait until your scanning is complete',
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //       fontSize: 14,
                //       color: AppColors.inputBorder,
                //     ),
                //   ),
                   SizedBox(height: 70.h),
                  // const Spacer(),

                  const HomeIndicator(color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}