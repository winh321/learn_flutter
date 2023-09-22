class ApiService{
  static ApiService getApiServiceObject = ApiService._create();
  String? _dio;
  ApiService._(){
    print("Api service created");
  }

  String get dio => _dio ?? "empty";

  set dio(String value){
    _dio = value;
  }
  ApiService._create(){
    print("api created par");
  }


}

    ApiService api = ApiService.getApiServiceObject;
    api.dio = "Api Data is reached";
    print(api.dio);
    print(api.hashCode);
    ApiService api2 = ApiService.getApiServiceObject;
    print(api2.dio);
    print(api2.hashCode);

    // ApiService api = ApiService();
    // api.dio = "first data";
    // print(api.dio);
    // print(api.hashCode);
    // ApiService api2 = ApiService();
    // print(api2.dio);
    // print(api2.hashCode);
