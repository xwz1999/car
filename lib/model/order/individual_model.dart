import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'individual_model.g.dart';


@JsonSerializable()
class IndividualModel extends Equatable{
    final int id;
    final int status;
    final Car car;
    final String contractSn;
    final int contractSignAt;
    final String saleAmount;
    final int saleAt;
    final String paymentAmount;
    final String paymentProof;
    final int paymentCreatedAt;
    final Customer customer;
    factory IndividualModel.fromJson(Map<String, dynamic> json) =>_$IndividualModelFromJson(json);


    const IndividualModel({
    required this.id,
    required this.status,
    required this.car,
    required this.contractSn,
    required this.contractSignAt,
    required this.saleAmount,
    required this.saleAt,
    required this.paymentAmount,
    required this.paymentProof,
    required this.paymentCreatedAt,
    required this.customer,
  });
    @override



    List<Object?> get props => [
        id,
        status,
        car,
        contractSn,
        contractSignAt,
        saleAmount,
        saleAt,
        paymentAmount,
        paymentProof,
        paymentCreatedAt,
        customer
    ];

}
@JsonSerializable()
class Car extends Equatable {
    final int id;
    final String mainPhoto;
    final String modelName;
    final int licensingDate;
    final String mileage;
    final String price;
    factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);

    const Car({
        required this.id,
        required this.mainPhoto,
        required this.modelName,
        required this.licensingDate,
        required this.mileage,
        required this.price,
    });
    @override
    List<Object?> get props =>
        [id, mainPhoto, modelName, licensingDate, mileage, price];
}

@JsonSerializable()
class Customer extends Equatable {
    final int id;
    final String nickname;
    final String mobile;
    factory Customer.fromJson(Map<String, dynamic> json) =>
        _$CustomerFromJson(json);

    const Customer({
        required this.id,
        required this.nickname,
        required this.mobile,
    });
    @override
    List<Object?> get props => [id, nickname, mobile];
}

