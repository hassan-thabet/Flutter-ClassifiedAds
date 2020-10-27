

class ResourcesNotFound implements Exception{

  String Message;

  ResourcesNotFound(this.Message);

  @override
  String toString() {
    return "${this.Message} Not Found" ;
  }
}

class MissingFields implements Exception{
  @override
  String toString() {
    return"Missing Fields" ;
  }
}

class LoginField implements Exception{
  String Message;

  LoginField(this.Message);

  @override
  String toString() {
    return"${this.Message}" ;
  }
}