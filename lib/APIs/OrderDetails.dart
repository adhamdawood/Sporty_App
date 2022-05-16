/// address : {"city":"Alex","street":"masr elgdeda","buildingNumber":7,"mobileNumber":"01090794168"}
/// creditCardNumber : "4003358989636833"
/// totalPrice : 409.98
/// date : "May 16, 2022"
/// productsDetails : [{"name":"UCL Champions League Pro Soccer Ball","imageUrl":"http://ahmedssaleem-001-site1.etempurl.com/Images/Products/Football/adidasUCLChampionsLeagueBall.jpg","productId":"ec043374-747d-4188-9f15-0c41a65258a9","amount":1,"totalItemPrice":164.99},{"name":"Predator Freak + FG Firm Ground Soccer Cleat","imageUrl":"http://ahmedssaleem-001-site1.etempurl.com/Images/Products/Football/AdidasPredatorFreakSoccerCleat.jpg","productId":"70431068-33cf-4e6e-b49b-499e553d34c1","amount":1,"totalItemPrice":234.99}]

class OrderDetails {
  OrderDetails({
    Address address,
    String creditCardNumber,
    double totalPrice,
    String date,
    List<ProductsDetails> productsDetails,}){
    _address = address;
    _creditCardNumber = creditCardNumber;
    _totalPrice = totalPrice;
    _date = date;
    _productsDetails = productsDetails;
  }

  OrderDetails.fromJson(dynamic json) {
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
    _creditCardNumber = json['creditCardNumber'];
    _totalPrice = json['totalPrice'];
    _date = json['date'];
    if (json['productsDetails'] != null) {
      _productsDetails = [];
      json['productsDetails'].forEach((v) {
        _productsDetails.add(ProductsDetails.fromJson(v));
      });
    }
  }
  Address _address;
  String _creditCardNumber;
  double _totalPrice;
  String _date;
  List<ProductsDetails> _productsDetails;
  OrderDetails copyWith({  Address address,
    String creditCardNumber,
    double totalPrice,
    String date,
    List<ProductsDetails> productsDetails,
  }) => OrderDetails(  address: address ?? _address,
    creditCardNumber: creditCardNumber ?? _creditCardNumber,
    totalPrice: totalPrice ?? _totalPrice,
    date: date ?? _date,
    productsDetails: productsDetails ?? _productsDetails,
  );
  Address get address => _address;
  String get creditCardNumber => _creditCardNumber;
  double get totalPrice => _totalPrice;
  String get date => _date;
  List<ProductsDetails> get productsDetails => _productsDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_address != null) {
      map['address'] = _address.toJson();
    }
    map['creditCardNumber'] = _creditCardNumber;
    map['totalPrice'] = _totalPrice;
    map['date'] = _date;
    if (_productsDetails != null) {
      map['productsDetails'] = _productsDetails.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "UCL Champions League Pro Soccer Ball"
/// imageUrl : "http://ahmedssaleem-001-site1.etempurl.com/Images/Products/Football/adidasUCLChampionsLeagueBall.jpg"
/// productId : "ec043374-747d-4188-9f15-0c41a65258a9"
/// amount : 1
/// totalItemPrice : 164.99

class ProductsDetails {
  ProductsDetails({
    String name,
    String imageUrl,
    String productId,
    int amount,
    double totalItemPrice,}){
    _name = name;
    _imageUrl = imageUrl;
    _productId = productId;
    _amount = amount;
    _totalItemPrice = totalItemPrice;
  }

  ProductsDetails.fromJson(dynamic json) {
    _name = json['name'];
    _imageUrl = json['imageUrl'];
    _productId = json['productId'];
    _amount = json['amount'];
    _totalItemPrice = json['totalItemPrice'];
  }
  String _name;
  String _imageUrl;
  String _productId;
  int _amount;
  double _totalItemPrice;
  ProductsDetails copyWith({  String name,
    String imageUrl,
    String productId,
    int amount,
    double totalItemPrice,
  }) => ProductsDetails(  name: name ?? _name,
    imageUrl: imageUrl ?? _imageUrl,
    productId: productId ?? _productId,
    amount: amount ?? _amount,
    totalItemPrice: totalItemPrice ?? _totalItemPrice,
  );
  String get name => _name;
  String get imageUrl => _imageUrl;
  String get productId => _productId;
  int get amount => _amount;
  double get totalItemPrice => _totalItemPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['imageUrl'] = _imageUrl;
    map['productId'] = _productId;
    map['amount'] = _amount;
    map['totalItemPrice'] = _totalItemPrice;
    return map;
  }

}

/// city : "Alex"
/// street : "masr elgdeda"
/// buildingNumber : 7
/// mobileNumber : "01090794168"

class Address {
  Address({
    String city,
    String street,
    int buildingNumber,
    String mobileNumber,}){
    _city = city;
    _street = street;
    _buildingNumber = buildingNumber;
    _mobileNumber = mobileNumber;
  }

  Address.fromJson(dynamic json) {
    _city = json['city'];
    _street = json['street'];
    _buildingNumber = json['buildingNumber'];
    _mobileNumber = json['mobileNumber'];
  }
  String _city;
  String _street;
  int _buildingNumber;
  String _mobileNumber;
  Address copyWith({  String city,
    String street,
    int buildingNumber,
    String mobileNumber,
  }) => Address(  city: city ?? _city,
    street: street ?? _street,
    buildingNumber: buildingNumber ?? _buildingNumber,
    mobileNumber: mobileNumber ?? _mobileNumber,
  );
  String get city => _city;
  String get street => _street;
  int get buildingNumber => _buildingNumber;
  String get mobileNumber => _mobileNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city'] = _city;
    map['street'] = _street;
    map['buildingNumber'] = _buildingNumber;
    map['mobileNumber'] = _mobileNumber;
    return map;
  }

}