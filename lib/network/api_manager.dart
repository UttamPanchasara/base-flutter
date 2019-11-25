import 'package:flutter_base/ui/base/base_view.dart';
import 'package:rxdart/rxdart.dart';
import 'api_response.dart';
import 'app_exception.dart';

class ApiManager<T> {
  Observable<ApiResponse> _callApi(Observable source) {
    return source.map((response) {
      return ApiResponse<T>.completed(response);
    }).onErrorReturnWith((error) {
      return ApiResponse<T>.error(error.toString(),
          error is NoInternetException ? Type.CONNECTION : Type.OTHER);
    }).startWith(ApiResponse<T>.loading());
  }

  void subscribeObserver(Observable observable, BaseView view) {
    _callApi(observable).listen(
      ((data) {
        if (data.status == Status.LOADING) {
          view?.showProgress();
        } else if (data.status == Status.COMPLETED) {
          view?.hideProgress();
          view?.onDataAvailable(data.data);
        } else {
          view?.hideProgress();
          view?.showError(data.message);
        }
      }),
    );
  }
}
