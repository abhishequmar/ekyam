class AdminModel {
  List? adminList;
  Map? adminDetails;

  AdminModel({this.adminList, this.adminDetails});

  factory AdminModel.fromMap(map) {
    return AdminModel(
      adminList: map['admins'],
      adminDetails: map['details'],
    );
  }
}
