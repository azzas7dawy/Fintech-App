import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/features/payment/data/datasources/paymob_manger.dart';
import 'package:fintech_app/features/payment/presentation/widgets/build_card_chip.dart';
import 'package:fintech_app/features/payment/presentation/widgets/build_payment_row.dart';
import 'package:fintech_app/features/payment/presentation/widgets/colored_card.dart';
import 'package:fintech_app/features/payment/presentation/widgets/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

enum PaymentMethod { card, googlePay, mobileBanking }

class PaymentMethodScreen extends StatefulWidget {
  final double amount;

  const PaymentMethodScreen({super.key, required this.amount});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  PaymentMethod? _selectedMethod;
  bool _sendToEmail = false;

  // ألوان شبه اللي في الـ Figma
  final Color _background = const Color(0xFFF4F7FF);
  final Color _cardBackground = Colors.white;
  final Color _primaryDark = const Color(0xFF1F3C88);
  final Color _lightBox = const Color(0xFFF7F8FF);

  void _onSelectMethod(PaymentMethod method) {
    setState(() {
      _selectedMethod = method;
    });
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        final String methodText = switch (method) {
          PaymentMethod.googlePay => 'Google Pay',
          PaymentMethod.mobileBanking => 'Mobile Banking',
          PaymentMethod.card => 'Credit Card',
        };

        return CustomBottomSheet(
          methodText: methodText,
          widget: widget,
          primaryDark: _primaryDark,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _background,
      appBar: AppBar(
        backgroundColor: _background,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryDark,
            size: 18.sp,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "payment_method".tr(),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.primaryDark,
          ),
        ),
      ),

      // ====================== BODY ======================
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 8),

            // ======= Card Section (زي التصميم) =======
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _cardBackground,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // العنوان + سهم صغير
                  Row(
                    children: [
                      Text(
                        "credit_card".tr(),
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.primaryDark,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.keyboard_arrow_up,
                        color: AppColors.primaryDark,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // أزرار فيزا / ماستر كارد / كارد فاضي
                  Row(
                    children: [
                      buildCardTypeChip(
                        'VISA',
                        selected: true,
                        logoImage: Image.asset('assets/images/Maskgroup.png'),
                      ),
                      const SizedBox(width: 12),
                      buildCardTypeChip(
                        '',
                        logoImage: Image.asset(
                          'assets/images/MastercardLogo.png',
                        ),
                      ),
                      const SizedBox(width: 12),
                      buildCardTypeChip(
                        '',
                        logoImage: Image.asset('assets/images/apple.png'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  const CustomColoredCard(),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ======= Google Pay =======
            Container(
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  buildPaymentRow(
                    title: "google_pay".tr(),
                    onTap: () => _onSelectMethod(PaymentMethod.googlePay),
                  ),

                  buildPaymentRow(
                    title: "mobile_banking".tr(),
                    onTap: () => _onSelectMethod(PaymentMethod.mobileBanking),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ======= Send receipt to email + Switch =======
            Row(
              children: [
                Text(
                  "send_receipt".tr(),
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.primaryDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Switch(
                  value: _sendToEmail,
                  activeThumbColor: AppColors.primaryDark,
                  activeTrackColor: _primaryDark,
                  onChanged: (value) {
                    setState(() {
                      _sendToEmail = value;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 90), // مساحة فوق الزرار
          ],
        ),
      ),

      // ====================== BUY BUTTON ======================
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
          child: SizedBox(
            height: 52,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async => _pay(),

              style: ElevatedButton.styleFrom(
                backgroundColor: _primaryDark,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(26),
                ),
              ),
              child: Text(
                "buy".tr(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<dynamic> _pay() async {
  PaymobManager().getPaymentKey(10, 'EGP').then((String paymentKey) {
    launchUrl(
      Uri.parse(
        'https://accept.paymob.com/api/acceptance/iframes/982007?payment_token=$paymentKey',
      ),
    );
  });
}
