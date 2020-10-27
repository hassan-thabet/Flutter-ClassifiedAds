
class ProductUser{
  String first_name , last_name , photo_url , phone_number , email ;

  ProductUser(this.first_name, this.last_name, this.photo_url,
      this.phone_number, this.email);

  ProductUser.fromJson(Map < String , dynamic > jsonObject){
    this.first_name = jsonObject['first_name'];
    this.last_name = jsonObject['last_name'];
    this.photo_url = jsonObject['photo_url'];
    this.phone_number = jsonObject['phone_number'];
    this.email = jsonObject['email'];
  }
}