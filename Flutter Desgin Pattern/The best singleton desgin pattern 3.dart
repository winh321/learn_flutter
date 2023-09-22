class ApiService{
  static ApiService? _buildApiServiceObject ;
  String? _dio;
  factory ApiService(){
    if(_buildApiServiceObject == null){
      _buildApiServiceObject = ApiService._create();
    }
    return _buildApiServiceObject!;
  }

  String get dio => _dio ?? "empty";

  set dio(String value){
    _dio = value;
  }
  ApiService._create(){
    print("api created par");
  }


}

    ApiService api = ApiService();
    api.dio = "This is api data ";
    print(api.dio);
    ApiService api2 = ApiService();
    print(api2.dio);
