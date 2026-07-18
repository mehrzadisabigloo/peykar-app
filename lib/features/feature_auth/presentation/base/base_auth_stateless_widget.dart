import 'package:flutter/material.dart';
import '../../../../core/base/base_stateless_widget.dart';

abstract class BaseAuthStatelessWidget extends BaseStatelessWidget {
  const BaseAuthStatelessWidget({super.key});

  @override
  Widget build(BuildContext context);
  
  // You can add auth specific localizations or helpers here
}
