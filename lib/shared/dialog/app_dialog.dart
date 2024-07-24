// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../main.dart';
// import '../../ui/screen/upgrade_page/cubit/iap_cubit.dart';
// import 'fake_loading_dialog.dart';
// import 'no_internet_dialog.dart';
// import 'premium_dialog.dart';
// import 'un_download_dialog.dart';

// class AppDialog {
//   static void showNoInternetDialog() {
//     showDialog(
//       context: navKey.currentContext!,
//       builder: (context) {
//         return const NoInternetDialog();
//       },
//     );
//   }

//   static Future<void> showPremiumDialog(BuildContext context,
//       {required void Function() onPressed, void Function()? onCancel}) async {
//     await showDialog(
//       context: context,
//       builder: (context) {
//         return Center(
//           child: PremiumPopup(
//             onPressed: onPressed,
//             onCancel: onCancel,
//           ),
//         );
//       },
//     );
//   }

//   static void showUnDownloadDialog() {
//     showDialog(
//       context: navKey.currentContext!,
//       builder: (context) {
//         return const UnDownloadDialog();
//       },
//     );
//   }

//   static void showFakeLoadingDialog({required GlobalKey key}) {
//     showDialog(
//       barrierDismissible: false,
//       context: navKey.currentContext!,
//       builder: (context) {
//         return FakeLoadingDialog(
//           dialogKey: key,
//         );
//       },
//     );
//   }
// }
