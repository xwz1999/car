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
}
