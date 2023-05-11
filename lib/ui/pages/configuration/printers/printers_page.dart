// import 'package:esc_pos_bluetooth/esc_pos_bluetooth.dart';
// import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class PrintersPage extends StatefulWidget {
  static String id = "printers_page";

  const PrintersPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PrintersPageState();
}

class _PrintersPageState extends State<PrintersPage> {
  String _devicesMsg = "";

  // PrinterBluetoothManager printerManager = PrinterBluetoothManager();
  // List<PrinterBluetooth> _devices = [];

  List<BluetoothDevice> _devices = [];
  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => {initPlatformState()});
  }

  Future<void> initPlatformState() async {
    print("-----------------------------------------");
    print("Iniciando escaneo");
    List<BluetoothDevice> devices = [];
    try {
      devices = await bluetooth.getBondedDevices();
    } on PlatformException {
      print("Error en cargar");
    }

    print("-----------------------------------------");
    print(devices);
  }

  @override
  void dispose() {
    super.dispose();
    // printerManager.stopScan();
  }

  // Future<void> initPrinter() async {
  //   printerManager.startScan(Duration(seconds: 2));

  //   if (!mounted) return;

  //   printerManager.scanResults.listen(
  //     (val) {
  //       if (!mounted) return;
  //       print("-------------------------printerManager");
  //       print(val);
  //       setState(() => {_devices = val});
  //       if (_devices.isEmpty)
  //         setState(() {
  //           _devicesMsg = "No Devices";
  //         });
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Printer'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Text(_devicesMsg),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Select Printer'),
    //     backgroundColor: Colors.redAccent,
    //   ),
    //   body: _devices.isEmpty
    //       ? Center(
    //           child: Text(_devicesMsg),
    //         )
    //       : ListView.builder(
    //           itemCount: _devices.length,
    //           itemBuilder: (c, i) {
    //             return ListTile(
    //               leading: Icon(Icons.print),
    //               title: Text(_devices[i].name!),
    //               subtitle: Text(_devices[i].address!),
    //               onTap: () {
    //                 // print(_devices[i]);
    //                 _startPrint1(_devices[i]);
    //               },
    //             );
    //           },
    //         ),
    // );
  }

  // Future<void> _startPrint1(PrinterBluetooth device) async {
  //   try {
  //     printerManager.selectPrinter(device);

  //     const PaperSize paper = PaperSize.mm58;
  //     final profile = await CapabilityProfile.load();

  //     final PosPrintResult res =
  //         await printerManager.printTicket((await demoReceipt(paper, profile)));

  //     print("-------------------Print--------------");
  //     print("Print");
  //   } catch (error) {
  //     print("-------------------Error--------------");
  //     print(error);
  //   }
  // }

  // Future<List<int>> demoReceipt(
  //     PaperSize paper, CapabilityProfile profile) async {
  //   final Generator ticket = Generator(paper, profile);
  //   List<int> bytes = [];

  //   // Print image
  //   // final ByteData data = await rootBundle.load('assets/rabbit_black.jpg');
  //   // final Uint8List imageBytes = data.buffer.asUint8List();
  //   // final Image? image = decodeImage(imageBytes);
  //   // bytes += ticket.image(image);

  //   bytes += ticket.text('GROCERYLY',
  //       styles: PosStyles(
  //         align: PosAlign.center,
  //         height: PosTextSize.size2,
  //         width: PosTextSize.size2,
  //       ),
  //       linesAfter: 1);

  //   ticket.feed(2);
  //   ticket.cut();
  //   return bytes;
  // }
}
