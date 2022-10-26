enum CarSort {
  newCreate,
  maxPrice,
  minPrice,
  minAge,
  minMileage,
  newUpdate,
}

class CarMap {
  static Map<String, String> carSortString = {
    'new_create': '最新创建',
    'max_price': '标价最高',
    'min_price': '标价最低',
    'min_age': '车龄最低',
    'min_mileage': '里程最短',
    'new_update': '最近更新',
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
    '油点混合': 3,
    '轻混系统': 4,
    '纯电动': 5,
    '插电混合': 6,
    '增程式': 7,
  };
  static Map<String, int> gearType = {
    '手自一体': 1,
    '自动': 2,
    '无级': 3,
    '双离合': 4,
    '手动': 5,
    '电子无级': 6,
    '机械式自动': 7,
    '序列': 8,
    'ISR': 9,
    '固定齿比': 10,
    'E-CVT+自动': 11,
    '国际档': 12,
  };
}
