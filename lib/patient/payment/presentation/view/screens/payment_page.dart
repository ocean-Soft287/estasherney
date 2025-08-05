import 'dart:developer';
import 'dart:io';
import 'package:consult_me/patient/booking/data/models/confrim_payment.dart';
import 'package:consult_me/patient/booking/presentation/cubit/booking_cubit.dart';
import 'package:consult_me/patient/payment/presentation/view/screens/pament_failure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';
import 'package:consult_me/patient/booking/data/models/booking_response.dart';
import 'package:consult_me/core/constants/app_colors.dart';


class PaymentPage extends StatefulWidget {
  final BookingResponse response;

  const PaymentPage({required this.response, super.key});

  @override
  PaymentPageState createState() => PaymentPageState();
}

class PaymentPageState extends State<PaymentPage>
    with SingleTickerProviderStateMixin {
  
  /// Define available payment methods with icons
  final Map<int, Map<String, dynamic>> _paymentMethods = {
    1: {"name": "الدفع بواسطة KNET", "icon": Icons.credit_card, "color": Colors.blue},
    2: {"name": "فيزا / ماستركارد", "icon": Icons.payment, "color": Colors.green},
    5: {"name": "أومان نت", "icon": Icons.account_balance, "color": Colors.orange},
  };

  int? _selectedPaymentMethodId;
  bool _isLoading = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    
    initiatePayment();
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void initiatePayment() async {
    if (Platform.isIOS) {
      _paymentMethods.addAll({
        24: {"name": "آبل باي", "icon": Icons.phone_iphone, "color": Colors.black}
      });
    }
    
    MFSDK.init(
      // 3ofo2OpYbO56IxABXt_KtmGBOyCpCyupgPwZCAeHRh0qPtZhGZIBDw_4hPgkA7hbC0gqe1gra8X4wtJ8wBMAzdy5YmCrexczQme3LQgdo7PupxNAbdZ-7TNGZO2UbBxLVvULdmFSVdoExW0Gqg1eE1LWZe6thP1MtVth-V8LCAm4Dhx4ujwgshllE4CwTZJYRJeNdZ7hqMuNoctnpBsLAAf-hGxPeo5iigKgbaXX0CttgYWUKj9YiHniskvtjMZyXl-sVWDotMbaVYCojjr9u4lXTW8IieALw9ZA0Qlg6G8dCeCi9swyXC3rgAQL-5aap-3Gd2VSYTnpQrwJ9jFEAD3U6r42ix_lJtUN-8AQXiyoJelxWoZWwsUj5DkEACjFuFwhHB8rUi2eQTq3srrBPIRWSMDypv6EAJICVT5dUVO2HmPmJ1ySwxqz49vH08CcaeVLOJp9O6PUSXEonNZfm6PaFNg6S6_yqO2wkYG4MI-oEizyTWWAL2g32l8iBR7_plY7I-XKxEmFSn6sQr6870MNbfrioyyouTr7_tsLO6Skz-rXGIXfuxKP3do5daRPtOTTeQAtFlIr3NwjI9BrzreUmfXgtzE8gB37egpnSoPCcSQAukCuubtJsWwUp0jHJs9uJbaD-jN5VIcwwRPmCF4VUVncYiLOuK-aAoLpK8jgtvUA7PP3-y6q7yV3OV037j2QyQ
      'rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL',
      MFCountry.EGYPT,
      MFEnvironment.TEST
    );
    
    final request = MFInitiatePaymentRequest(
      invoiceAmount: widget.response.finalConsultationPrice,
      currencyIso: 'EGP',
    );

    await MFSDK.initiatePayment(request, MFLanguage.ARABIC)
        .then((result) => log(result.toString()))
        .catchError((error) => debugPrint(error.message));
  }

  void executePayment() async {
    if (_selectedPaymentMethodId == null) {
      _showSnackBar("يرجى اختيار وسيلة الدفع", isError: true);
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final request = MFExecutePaymentRequest(
      paymentMethodId: _selectedPaymentMethodId,
      invoiceValue: widget.response.finalConsultationPrice,
    );

    try {
      await MFSDK.executePayment(request, MFLanguage.ARABIC, (invoiceId) {
        debugPrint("Invoice ID: $invoiceId");
      }).then((result) {
        context.read<BookingCubit>().confirmPayment(
            appointment: ConfrimPayment(
                appointmentId: widget.response.appointmentId.toString(),
                isPaid: 'true'));
        _showSnackBar("تم الدفع بنجاح", isError: false);
      }).catchError((error) {
        log(error);
        _navigateToErrorPage();
      });
    } catch (error) {
      _navigateToErrorPage();
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _navigateToErrorPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const PaymentErrorPage(),
      ),
    );
  }

  void _showSnackBar(String message, {required bool isError}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(fontFamily: 'Monadi'),
        ),
        backgroundColor: isError ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "إتمام عملية الدفع",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'Monadi',
          ),
        ),
        centerTitle: true,
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Payment Summary Card
              _buildPaymentSummaryCard(),
              
              SizedBox(height: 24.h),
              
              // Payment Methods Section
              _buildPaymentMethodsSection(),
              
              SizedBox(height: 32.h),
              
              // Security Note
              _buildSecurityNote(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomActionBar(),
    );
  }

  Widget _buildPaymentSummaryCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.mainColor, AppColors.mainColor.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.mainColor.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            Icons.receipt_long,
            color: Colors.white,
            size: 32.sp,
          ),
          SizedBox(height: 12.h),
          Text(
            "إجمالي المبلغ المطلوب",
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 14.sp,
              fontFamily: 'Monadi',
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${widget.response.finalConsultationPrice}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Monadi',
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                "جنيه مصري",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 16.sp,
                  fontFamily: 'Monadi',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "اختر وسيلة الدفع المفضلة",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontFamily: 'Monadi',
          ),
        ),
        SizedBox(height: 16.h),
        ..._paymentMethods.entries.map((entry) => _buildPaymentMethodCard(entry)),
      ],
    );
  }

  Widget _buildPaymentMethodCard(MapEntry<int, Map<String, dynamic>> entry) {
    final isSelected = _selectedPaymentMethodId == entry.key;
    
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedPaymentMethodId = entry.key;
          });
        },
        borderRadius: BorderRadius.circular(12.r),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: isSelected ? AppColors.mainColor : Colors.grey.shade300,
              width: isSelected ? 2 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: isSelected 
                    ? AppColors.mainColor.withOpacity(0.1)
                    : Colors.black.withOpacity(0.05),
                blurRadius: isSelected ? 8 : 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 50.w,
                height: 50.w,
                decoration: BoxDecoration(
                  color: isSelected 
                      ? entry.value["color"].withOpacity(0.1)
                      : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  entry.value["icon"],
                  color: isSelected ? entry.value["color"] : Colors.grey.shade600,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  entry.value["name"],
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    color: isSelected ? AppColors.mainColor : Colors.black87,
                    fontFamily: 'Monadi',
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 20.w,
                height: 20.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? AppColors.mainColor : Colors.grey.shade400,
                    width: 2,
                  ),
                  color: isSelected ? AppColors.mainColor : Colors.transparent,
                ),
                child: isSelected
                    ? Icon(
                        Icons.check,
                        size: 12.sp,
                        color: Colors.white,
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSecurityNote() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Row(
        children: [
          Icon(
            Icons.security,
            color: Colors.green.shade600,
            size: 24.sp,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "دفع آمن ومحمي",
                  style: TextStyle(
                    color: Colors.green.shade700,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Monadi',
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "جميع المعاملات محمية بأعلى معايير الأمان",
                  style: TextStyle(
                    color: Colors.green.shade600,
                    fontSize: 12.sp,
                    fontFamily: 'Monadi',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActionBar() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: InkWell(
          onTap: _isLoading ? null : executePayment,
          borderRadius: BorderRadius.circular(12.r),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 54.h,
            decoration: BoxDecoration(
              gradient: _isLoading
                  ? LinearGradient(colors: [Colors.grey.shade400, Colors.grey.shade500])
                  : LinearGradient(
                      colors: [AppColors.mainColor, AppColors.mainColor.withOpacity(0.8)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.mainColor.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: _isLoading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20.w,
                          height: 20.w,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          "جاري المعالجة...",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Monadi',
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.payment,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          "ادفع الآن",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Monadi',
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}