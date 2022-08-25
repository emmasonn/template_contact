import 'package:flutter/material.dart';
import 'package:flutter_app/core/widgets/custom_page.dart';
import 'package:flutter_app/core/widgets/custom_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/contact.dart';

class PageAddContact extends ConsumerStatefulWidget {
  const PageAddContact({Key? key}) : super(key: key);

  static Page page({
    LocalKey? key,
    Contact? contact,
  }) {
    // return MaterialPage(key: key, child: const PageAddContact());
    return CustomPage(
      key: key,
      animationStyle: PageAnimationStyle.slideRight,
      child: const PageAddContact(),
    );
  }

  @override
  ConsumerState<PageAddContact> createState() => _PageAddContactState();
}

class _PageAddContactState extends ConsumerState<PageAddContact> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: const Icon(Icons.arrow_back),
        ),
        title:
            Text('Add Contact', style: Theme.of(context).textTheme.headline6),
        elevation: 0.0,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: SingleChildScrollView(
            child: Column(
          children: const [
            CustomTextField(hintText: 'Name'),
            SizedBox(height: 35,),
            CustomTextField(hintText: 'Address',
            displayHint: DisplayHint.inside,),

          ],
        )),
      ),
    );
  }
}
