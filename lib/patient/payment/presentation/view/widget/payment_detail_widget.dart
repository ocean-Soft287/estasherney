import 'package:consult_me/patient/payment/presentation/view/widget/confirmation_widget.dart';
import 'package:consult_me/patient/payment/presentation/view/widget/paymentinfo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widget/defualt_botton.dart';

class PaymentDetailWidget extends StatelessWidget {
  const PaymentDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        PaymentinfoWidget(title: "التاريخ / الساعة", info: "15/2 / 10:00 صباحًا"),
        PaymentinfoWidget(title: "مدة", info: "30 دقيقه"),
        PaymentinfoWidget(title: "الحجز ل", info: "محمد فتحي"),
        30.verticalSpace,
        Divider(),
        10.verticalSpace,
        PaymentinfoWidget(title: "المبلغ", info: "\$100.00"),
        PaymentinfoWidget(title: "مدة", info: "30 دقيقه"),
        PaymentinfoWidget(title: "المبلغ الكلي", info: "\$100"),
        30.verticalSpace,
        Divider(),
        10.verticalSpace,
        PaymentinfoWidget(title: "المبلغ", info: "\$100.00"),
        10.verticalSpace,
        DefaultButton(
          text: "ادفع الان",
          function: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ConfirmationWidget()));
          },
          width: .9 * MediaQuery.of(context).size.width,
          heightButton: 45,
        ),
        20.verticalSpace,
      ],
    );
  }
}
