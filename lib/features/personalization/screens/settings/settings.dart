import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/app_bar/app_bar.dart';
import 'package:t_store/common/widgets/common_section_heading.dart';
import 'package:t_store/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:t_store/common/widgets/list_tile/user_profile_tile.dart';
import 'package:t_store/common/widgets/primary_header_container.dart';
import 'package:t_store/features/personalization/screens/address/address.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildHeader(context),
    );
  }

  Widget buildHeader(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PrimaryHeaderContainer(
            child: Column(
              children: [
                BaseAppBar(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: TColors.white),
                  ),
                ),
                const UserProfileTitle(),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            ),
          ),
          buildBodyPart(),
        ],
      ),
    );
  }

  Widget buildBodyPart() {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          const SectionHeading(
            title: 'Account Settings',
            showActionButton: false,
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
           SettingsMenuTile(
            icon: Iconsax.safe_home,
            title: 'My Addresses',
            subtitle: 'Set shopping delivery address',
            onTap: () {
              Get.to(const UserAddressScreen());
            },
          ),
          const SettingsMenuTile(
            icon: Iconsax.shopping_cart,
            title: 'My Cart',
            subtitle: 'Set shopping delivery address',
          ),
          const SettingsMenuTile(
            icon: Iconsax.bag_tick,
            title: 'My Orders',
            subtitle: 'Set shopping delivery address',
          ),
          const SettingsMenuTile(
            icon: Iconsax.bank,
            title: 'Bank Account',
            subtitle: 'Set shopping delivery address',
          ),
          const SettingsMenuTile(
            icon: Iconsax.discount_shape,
            title: 'My Coupons',
            subtitle: 'Set shopping delivery address',
          ),
          const SettingsMenuTile(
            icon: Iconsax.notification,
            title: 'Notifications',
            subtitle: 'Set shopping delivery address',
          ),
          const SettingsMenuTile(
            icon: Iconsax.security_card,
            title: 'Account Privacy',
            subtitle: 'Set shopping delivery address',
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          const SectionHeading(
            title: 'App Settings',
            showActionButton: false,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          const SettingsMenuTile(
            icon: Iconsax.document_upload,
            title: 'Load Data',
            subtitle: 'Set shopping delivery address',
          ),
          SettingsMenuTile(
            icon: Iconsax.location,
            title: 'Geolocation',
            subtitle: 'Set shopping delivery address',
            trailing: Switch(
              value: false,
              onChanged: (value) {},
            ),
          ),
          SettingsMenuTile(
            icon: Iconsax.security_user,
            title: 'Safe Mode',
            subtitle: 'Set shopping delivery address',
            trailing: Switch(
              value: false,
              onChanged: (value) {},
            ),
          ),
          SettingsMenuTile(
            icon: Iconsax.image,
            title: 'HD Image Quality',
            subtitle: 'Set shopping delivery address',
            trailing: Switch(
              value: true,
              onChanged: (value) {},
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child:
                OutlinedButton(onPressed: () {}, child: const Text('Logout')),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
        ],
      ),
    );
  }
}
