import 'package:sha_bank/shared/theme.dart';
import 'package:sha_bank/ui/widgets/buttons.dart';
import 'package:sha_bank/ui/widgets/forms.dart';
import 'package:sha_bank/ui/widgets/transfer_recent_user_item.dart';
import 'package:sha_bank/ui/widgets/transfer_result_user_item.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transfer',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Search',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const CustomFormField(
            title: 'by username',
            isShowTitle: false,
          ),
          buildRecentUsers(),
          // buildResultUsers(),
          const SizedBox(
            height: 274,
          ),
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.all(24),
        child: CustomFilledButton(
          title: 'Continue',
          onPressed: () {
            Navigator.pushNamed(context, '/transfer-amount');
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget buildRecentUsers() {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Resent Users',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const TransferRecentUserItem(
            imageUrl: 'assets/img_friend1.png',
            name: 'Yonna Jie',
            username: 'yoenna',
            isVerified: true,
          ),
          const TransferRecentUserItem(
            imageUrl: 'assets/img_friend3.png',
            name: 'John Hi',
            username: 'jhi',
          ),
          const TransferRecentUserItem(
            imageUrl: 'assets/img_friend4.png',
            name: 'Masayoshi',
            username: 'form',
          ),
        ],
      ),
    );
  }

  Widget buildResultUsers() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Result',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const Wrap(
            spacing: 17,
            runSpacing: 17,
            children: [
              TransferResultUserItem(
                imageUrl: 'assets/img_friend1.png',
                name: 'Yonna Jie',
                username: 'yoenna',
                isVerified: true,
              ),
              TransferResultUserItem(
                imageUrl: 'assets/img_friend2.png',
                name: 'Yonne Ka',
                username: 'yoenyu',
                isVerified: true,
                isSelected: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
