enum CarSort {
  newCreate,
  maxPrice,
  minPrice,
  minAge,
  minMileage,
  newUpdate,
}

class CarMap {
  static Map<CarSort, String> carSortString = {
    CarSort.newCreate: '最新创建',
    CarSort.maxPrice: '标价最高',
    CarSort.minPrice: '标价最低',
    CarSort.minAge: '车龄最低',
    CarSort.minMileage: '里程最短',
    CarSort.newUpdate: '最近更新',
  };

  static Map<String, List<int>> carAge = {
    '全部': [0, 0],
    '今年': [0, 1],
    '去年': [0, 2],
    '近3年': [0, 3],
    '近5年': [0, 5],
    '7年以上': [7, 0],
  };

  static Map<String, int> fuelType = {
    '汽油': 1,
    '柴油': 2,
    '电力': 3,
    '油电': 4,
    '油气': 5,
    '天然气': 6,
    '氢能源': 7,
  };
  static Map<String, int> gearType = {
    '手动': 1,
    '自动': 2,
  };
}
