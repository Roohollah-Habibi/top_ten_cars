class CarObject {
  String _carName;
  int _carId;
  String _carDetails;
  String _carImage;
  Map<String,dynamic>? carFeature;

  CarObject(this._carId,this._carName,this._carDetails,this._carImage,{this.carFeature});


  String get carName => _carName;

  set carName(String value) {
    _carName = value;
  }

  int get carId => _carId;

  String get carImage => _carImage;

  set carImage(String value) {
    _carImage = value;
  }

  String get carDetails => _carDetails;

  set carDetails(String value) {
    _carDetails = value;
  }

  set carId(int value) {
    _carId = value;
  }
}