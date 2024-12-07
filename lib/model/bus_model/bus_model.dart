
 

class BusModel {
  
  final String routeId;
  final String busName;
  final String price;
  final String departure;
  final String arrival;
  final String duration;

  BusModel({required this.routeId, required this.busName, required this.price, required this.departure , required this.arrival, required this.duration,});


  factory BusModel.fromJson({required Map<String, dynamic> json}){
    return BusModel(
      routeId: json["routeId"], 
      busName: json["busName"], 
      price: json["price"],
      departure: json["departure"],
      arrival: json["arrival"],
      duration: json["duration"]
      
      );
  }
}