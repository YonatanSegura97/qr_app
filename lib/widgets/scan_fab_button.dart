import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/providers/scan_list_provider.dart';

class ScanFab extends StatelessWidget {
  const ScanFab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //     "#ff6666", "Cancel", true, ScanMode.QR);
        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);
        final String geo = 'get:0.0,0.0';
        scanListProvider.newScan(geo);
      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}
