import 'package:flutter/material.dart';

import '../../custom_widgets/error_dialog.dart';
import '../../custom_widgets/long_button.dart';
import '../../custom_widgets/password_field_toggle.dart';
import '../../custom_widgets/snackbar.dart';
import '../../helpers/api.dart';
import '../../helpers/loader_dialog.dart';

class ChangePasswordPage extends StatelessWidget {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đổi mật khẩu'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PasswordFieldWithToggle(
                  title: 'Mật khẩu cũ',
                  controller: _oldPasswordController,
                ),
                SizedBox(
                  height: 16,
                ),
                PasswordFieldWithToggle(
                  title: 'Mật khẩu mới',
                  controller: _newPasswordController,
                ),
                SizedBox(
                  height: 16,
                ),
                PasswordFieldWithToggle(
                  title: 'Xác nhận mật khẩu mới',
                  controller: _confirmNewPasswordController,
                ),
                // Add buttons or other UI elements as needed
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: LongButton(
              text: 'LƯU',
              outerBoxColor: Color(0xff1783d1),
              innerBoxColor: Color(0xff46a4e8),
              textColor: Colors.white,
              onTap: () {
                showLoaderDialog(context);
                APIHelper.submitUpdatePasswordUserRequest(
                        _oldPasswordController.text,
                        _newPasswordController.text)
                    .then((updateUserResponse) {
                  if (updateUserResponse.containsKey("error")) {
                    Navigator.pop(context);
                    ErrorDialog.show(context);
                  } else {
                    ShowSnackBar().showSnackBar(
                      context,
                      "Đã cập nhật mật khẩu thành công",
                      noAction: true,
                    );
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
