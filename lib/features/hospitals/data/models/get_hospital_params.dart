class GetHospitalParams {
  final int page;
  final int rows;
  final double? lat;
  final double? long;
  final String? stateCode;


  GetHospitalParams({this.page=1, this.rows=10, this.lat, this.long, this.stateCode});


  Map<String, dynamic> toJson(){
    return {
      "page": page,
      "rowsPerPage": rows,
      if(lat!=null) "lat": lat,
      if(long!=null) "long": long,
      if(stateCode!=null) "estadoCode": stateCode
    };
  }
}