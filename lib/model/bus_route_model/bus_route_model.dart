

class BusRouteModel{
  
  final String routeId;
  final String routeFrom;
  final String routeTo;
  final String price;
  final String duration;
   

  BusRouteModel({required this.routeId, required this.duration , required this.routeFrom, required this.routeTo, required this.price });


  factory BusRouteModel.fromJson({required Map<String , dynamic> json}){
    return BusRouteModel(
      routeId: json['routeId'],
      routeFrom: json['routeFrom'], 
      routeTo: json['routeTo'], 
      price: json['price'],
      duration : json['duration'], 
      );
  }

  
}



