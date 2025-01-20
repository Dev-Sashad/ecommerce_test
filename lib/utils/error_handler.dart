import 'package:dio/dio.dart';
import 'package:ecommerce_test/services/dialog_service.dart';
import 'package:ecommerce_test/utils/enums.dart';
import 'package:ecommerce_test/utils/helpers.dart';

class DioErrorHandler {
  handleStringError(String errorMessage) {
    DialogService dialogService = DialogService();

     appPrint('errorMessage:: $errorMessage');

    dialogService.showSnackBar(errorMessage, appToastType: AppToastType.error);
  }

  handleError(DioException dioError) {
    DialogService dialogService = DialogService();

     appPrint('dioError.response!.data:: ${dioError.response?.data}');

    String errorMessage =
        errorMessageParser(dioError.response?.data,showSingleError: true) ?? 'An error occured';

     appPrint('errorMessage:: $errorMessage');

    dialogService.showSnackBar(errorMessage, appToastType: AppToastType.error);
  }

  String getErrorMessage(DioException? dioError) {
    return errorMessageParser(dioError?.response!= null?dioError?.response?.data: "ERROR",showSingleError: true) ?? 'An error occured';
  }

  String? errorMessageParser(Map errorJson,
      {showSingleError = false, showErrorKey = false}) {
    String? message;

    bool shouldShowMessageError = errorJson['message'] == null;

    if (errorJson['message'] is String && shouldShowMessageError) {
      return errorJson['message'];
    }

    if (errorJson['message'] is String) return errorJson['message'];

    //errorJson = errorJson['message'] != null ? errorJson['message'] : errorJson;

    List<String>? errorKeys = errorJson.keys.cast<String>().toList();

    formartErrorKey(String value) {
      String v = value.replaceAll('_', ' ');
      String res = v[0].toUpperCase() + v.substring(1);
      return res;
    }

    if (errorKeys.isNotEmpty) {
      if (showSingleError) {
        message = errorJson[errorKeys[0]][0];
      } else {
        String message0 = '';
        for (var errorKey in errorKeys) {
          String separator = message0.isEmpty ? '' : '\n';
          var err = errorJson[errorKey];
          message0 += showErrorKey
              ? "$separator${formartErrorKey(errorKey)}: ${err is String ? err : err[0]}"
              : "$separator${err is String ? err : err}";
        }
        message = message0;
      }
    }

    return message;
  }
}
