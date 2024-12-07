
 

class UserModel{
  
  final String userId;
   
  final String emailId;

  UserModel({required this.userId, required this.emailId});

  factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(
      userId: json['userId'], 
      emailId: json['emailId']
      );
  }

  Map<String , dynamic> toJson(){
    return {
      'userId' : userId,
      'emailId' : emailId
    };
  }
}