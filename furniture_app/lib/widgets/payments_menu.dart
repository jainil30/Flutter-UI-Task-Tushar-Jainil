import 'package:flutter/material.dart';
import 'package:furniture_app/widgets/payments_widget.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/checkout_controller.dart';

class PaymentMenu extends GetView<CheckoutController> {
  const PaymentMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Payment Method",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20),
        ),
        Gap(10),
        Expanded(
          child: ListView.builder(
            itemCount: controller.payments.length,
            itemBuilder: (context, index) {
              print("PAYMENT------->");
              return PaymentWdiget(
                index: index,
              );
            },
          ),
        ),
      ],
    );
  }
}