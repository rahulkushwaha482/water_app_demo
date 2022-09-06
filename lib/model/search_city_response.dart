import 'dart:convert';

SearchCityModel searchCityResponseFromJson(String str) =>
    SearchCityModel.fromJson(json.decode(str));


String searchCityResponseToJson(SearchCityModel data) =>
    json.encode(data.toJson());

class SearchCityModel {
  int? status;
  String? message;
  Data? data;

  SearchCityModel({this.status, this.message, this.data});

  SearchCityModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Record>? record;
  int? pageToken;
  int? totalPages;
  int? currentPage;
  Null? previousPage;

  Data(
      {this.record,
        this.pageToken,
        this.totalPages,
        this.currentPage,
        this.previousPage});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['Record'] != null) {
      record = <Record>[];
      json['Record'].forEach((v) {
        record!.add(new Record.fromJson(v));
      });
    }
    pageToken = json['pageToken'];
    totalPages = json['totalPages'];
    currentPage = json['currentPage'];
    previousPage = json['previousPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.record != null) {
      data['Record'] = this.record!.map((v) => v.toJson()).toList();
    }
    data['pageToken'] = this.pageToken;
    data['totalPages'] = this.totalPages;
    data['currentPage'] = this.currentPage;
    data['previousPage'] = this.previousPage;
    return data;
  }
}

class Record {
  String? sId;
  int? id;
  String? name;
  String? state;
  String? country;
  Coord? coord;

  Record({this.sId, this.id, this.name, this.state, this.country, this.coord});

  Record.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    name = json['name'];
    state = json['state'];
    country = json['country'];
    coord = json['coord'] != null ? new Coord.fromJson(json['coord']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['state'] = this.state;
    data['country'] = this.country;
    if (this.coord != null) {
      data['coord'] = this.coord!.toJson();
    }
    return data;
  }
}

class Coord {
  double? lon;
  double? lat;

  Coord({this.lon, this.lat});

  Coord.fromJson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lon'] = this.lon;
    data['lat'] = this.lat;
    return data;
  }
}