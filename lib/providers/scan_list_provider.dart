import 'package:flutter/material.dart';
import 'package:qr_app/model/scan_model.dart';
import 'package:qr_app/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String typeSelected = 'http';

  newScan(String value) async {
    final newScan = ScanModel(value: value);
    final id = await DBProvider.db.insertScanRecord(newScan);
    newScan.id = id;
    if (typeSelected == newScan.type) {
      scans.add(newScan);
      notifyListeners();
    }
  }

  loadScans() async {
    final scans = await DBProvider.db.getAllRecords();
    this.scans = [...scans];
    notifyListeners();
  }

  loadScansByType(String type) async {
    final scans = await DBProvider.db.getScanByType(type);
    this.scans = [...scans];
    typeSelected = type;
    notifyListeners();
  }

  deleteAllRecords() async {
    await DBProvider.db.deleteAll();
    scans = [];
    notifyListeners();
  }

  deleteScanById(int id) async {
    await DBProvider.db.deleteScan(id);
    loadScansByType(typeSelected);
  }
}
