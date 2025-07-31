import 'package:flutter/material.dart';
import '../widget/details_container.dart';
import '../widget/payment_detail_widget.dart';

class Paynow extends StatelessWidget {
  const Paynow({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: DetailsContainer(),
            ),
            SliverToBoxAdapter(
              child: PaymentDetailWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
