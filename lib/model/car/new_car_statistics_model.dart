import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'new_car_statistics_model.g.dart';

@JsonSerializable()
class NewCarStatisticsModel extends Equatable {
  final BusinessCount businessCount;
  final StoreCount storeCount;
  final OwnCount ownCount;

  @override
  List<Object?> get props => [
    businessCount,
    storeCount,
    ownCount,
  ];
  factory NewCarStatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$NewCarStatisticsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewCarStatisticsModelToJson(this);

  static NewCarStatisticsModel get init =>  NewCarStatisticsModel(
    businessCount: BusinessCount.init,
    storeCount: StoreCount.init,
    ownCount: OwnCount.init,
    );

  const NewCarStatisticsModel({
    required this.businessCount,
    required this.storeCount,
    required this.ownCount,
  });
}

@JsonSerializable()
class BusinessCount extends Equatable{

  final int sellCount;
  final int reserveCount;
  final int soldCount;
  final int backOutCount;
  final int signingCount;
  // final int signedCount;

  factory BusinessCount.fromJson(Map<String, dynamic> json) =>_$BusinessCountFromJson(json);
  @override
  List<Object?> get props => [
    sellCount,
    reserveCount,
    soldCount,
    backOutCount,
    signingCount,
    // signedCount,
  ];
  const BusinessCount({
    required this.sellCount,
    required this.reserveCount,
    required this.soldCount,
    required this.backOutCount,
    required this.signingCount,
    // required this.signedCount
  });

  Map<String, dynamic> toJson() => _$BusinessCountToJson(this);
  static BusinessCount get init => const  BusinessCount(
    sellCount: 0,
    reserveCount: 0,
    soldCount: 0,
    backOutCount: 0,
  // signedCount: 0,
    signingCount: 0,

  );
}

@JsonSerializable()
class StoreCount extends Equatable{

  factory StoreCount.fromJson(Map<String, dynamic> json) =>_$StoreCountFromJson(json);
  final int sellCount;
  final int reserveCount;
  final int soldCount;
  final int backOutCount;
  final int signingCount;
  // final int signedCount;

  @override
  List<Object?> get props => [
    sellCount,
    reserveCount,
    soldCount,
    backOutCount,
    signingCount,
    // signedCount,
  ];

  Map<String, dynamic> toJson() => _$StoreCountToJson(this);
  const StoreCount({
    required this.sellCount,
    required this.reserveCount,
    required this.soldCount,
    required this.backOutCount,
    // required this.signedCount,
    required this.signingCount,

  });

  static StoreCount get init => const StoreCount(
    sellCount: 0,
    reserveCount: 0,
    soldCount: 0,
    backOutCount: 0,
  signingCount: 0,
    // signedCount: 0,
  );
}

@JsonSerializable()
class OwnCount extends Equatable{
  factory OwnCount.fromJson(Map<String, dynamic> json) =>_$OwnCountFromJson(json);
  final int sellCount;
  final int reserveCount;
  final int soldCount;
  final int backOutCount;
  final int signingCount;
  // final int signedCount;

  @override
  List<Object?> get props => [
    sellCount,
    reserveCount,
    soldCount,
    backOutCount,
    signingCount,
    // signedCount,
  ];

  Map<String, dynamic> toJson() => _$OwnCountToJson(this);
  const OwnCount({
    required this.sellCount,
    required this.reserveCount,
    required this.soldCount,
    required this.backOutCount,
    // required this.signedCount,
    required this.signingCount,
  });

  static OwnCount get init => const OwnCount(
    sellCount: 0,
    reserveCount: 0,
    soldCount: 0,
    backOutCount: 0,
   // signedCount: 0,
    signingCount: 0,
  );
}
