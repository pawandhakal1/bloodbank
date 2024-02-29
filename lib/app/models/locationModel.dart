class LocationPicker {
    List<ProvinceList> provinceList;
    List<DistrictList> districtList;
    List<CityList> cityList;

  LocationPicker({
    required this.provinceList,
    required this.districtList,
    required this.cityList,
  });
}

class ProvinceList {
    int id;
    String name;
    List<DistrictList> districtList;

    ProvinceList({
        required this.id,
        required this.name,
        required this.districtList,
    });
}

class DistrictList {
    int id;
    String name;
    List<CityList> list;

    DistrictList({
        required this.id,
        required this.name,
        required this.list,
    });
}

class CityList {
    int id;
    String name;

    CityList({
        required this.id,
        required this.name,
    });
}