import 'package:toja_demo/features/select_country/domain/entities/country.dart';

class CountryModel extends Country{
  CountryModel({required super.code, required super.name, required super.key, required super.flag});

  factory CountryModel.fromJson(Map<String,dynamic> json){
    return CountryModel(code: json['code'], name: json['name'], key: json['key'], flag: json['flag']);
  }

  Map<String,dynamic> toJson(){
    return {'code':code,'name':name,'key':key,'flag':flag};
  }
}