import 'package:flutter/material.dart';
import 'package:tread256/app.dart';
import 'package:tread256/features/subscriptions/services/stripe_service.dart';

void main() async {
  await StripeServicePayment.setup();
  runApp(const Tread256());
}

      // Get.to(YourEverydayTreeScreen());