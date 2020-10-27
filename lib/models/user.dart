
class User{
  int id;
  String first_name;
  String last_name;
  String email;
  String mobile;
  String photo_url;
  String api_token;


  User(
      this.id,
      this.first_name,
      this.last_name,
      this.email,
      this.mobile,
      this.photo_url,
      this.api_token
      );


  User.fromJson( Map <String , dynamic > jsonObject){

    this.id = jsonObject['id'];
    this.first_name = jsonObject['first_name'];
    this.last_name = jsonObject['last_name'];
    this.email = jsonObject['email'];
    this.mobile = jsonObject['mobile'];
    this.photo_url = jsonObject['photo_url'];
    this.api_token = jsonObject['api_token'];
  }
}