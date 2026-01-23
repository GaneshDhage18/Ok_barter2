import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:okbarter2/core/extensions/app_imports.dart';

class CustomSnackbar {
  static success(message) {
    final snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Success!',
        message: message,

        contentType: ContentType.success,
      ),
    );

    ScaffoldMessenger.of(rootNavigator.currentContext!)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static failure(message) {
    final snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Ooh No!',
        message: message,

        contentType: ContentType.failure,
      ),
    );

    ScaffoldMessenger.of(rootNavigator.currentContext!)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
