import 'package:flutter/material.dart';
import 'package:flutter_app/features/contact/domain/entities/contact.dart';

class PageContactDetail extends StatefulWidget {
  const PageContactDetail({Key? key}) : super(key: key);

  static Page page({
    LocalKey? key,
    Contact? contact,
  }) {
    return MaterialPage(
      key: key,
      child: const PageContactDetail(),
    );
  }

  @override
  State<PageContactDetail> createState() => _PageContactDetailState();
}

class _PageContactDetailState extends State<PageContactDetail> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
