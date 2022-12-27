class User{
  String name="John";
  String city = "Paris";
  String image = "Image Url";

  User(this.name, this.city, this.image);

  User.fromJson(Map<String,dynamic> json){
    name=json['name'];
    city=json['city'];
    image=json['image'];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = Map<String,dynamic>();
    data['name']= this.name;
    data['city']= this.city;
    data['image']= this.image;

    return data;
  }
}