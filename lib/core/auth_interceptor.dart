import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../locator_service.dart';

class AuthInterceptor extends QueuedInterceptor{

  getValue(String accessToken) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String? stringValue = prefs.getString(accessToken);
  return stringValue;
}
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    /*final accesToken = sl.get<AuthCubit>().state.whenOrNull(
      succes: (userEntity) => userEntity.accesToken,
    );*/
   /* final st = sl.get<AuthCubit>().state; 
    if(st is SuccesState){
      st.token;
    }else{
      super.onRequest(options, handler);

    }*/
    final accessToken = await getValue('accessToken');
    //final accessToken = SharedPreferencesUtil.getData("accessToken");
    /*if(sl.get<AuthCubit>().state is succes ){
        final accesToken = sl.get<AuthCubit>().state;
    }*/

    if(accessToken == null){
      super.onRequest(options, handler);
    }
    else{
      final headers = options.headers;
      headers['Authorization'] = 'Bearer $accessToken';
      super.onRequest(options.copyWith(headers: headers), handler);
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }
}