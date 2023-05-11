import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/app_provider.dart';

class NewSalePage extends StatefulWidget {
  static String id = "newsale_page";
  const NewSalePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewSalePageState();
}

class _NewSalePageState extends State<NewSalePage> {
  List<String> list = <String>[
    'One',
    'Forma de pago pago pago pago pago pago',
    'Three',
    'Four'
  ];
  String dropdownValue = "";

  @override
  void initState() {
    dropdownValue = list.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff00a46a),
        title: const Text(
          "Nueva venta",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.settings,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 20,
                    right: 20,
                    bottom: 150,
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        width: size.width,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            // primary: Colors.white,
                            elevation: 0,
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                color: Color(0xffe0e0e0),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 15,
                              ),
                              Icon(
                                Icons.expand_more,
                                size: 25,
                                color: Color(0xff868d96),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Text(
                                  "Tipo de comprobante",
                                  style: TextStyle(
                                    color: Color(0xff868d96),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      ),

                      /**
                       * 
                       */
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 2),
                        width: size.width,
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color: const Color(0xffe0e0e0),
                          ),
                        ),
                        child: TextFormField(
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: const InputDecoration(
                            icon: Icon(
                              Icons.people,
                              size: 20,
                              color: Color(0xff868d96),
                            ),
                            hintText: "Cliente",
                            hintStyle: TextStyle(
                              color: Color(
                                0xff868d96,
                              ),
                              fontWeight: FontWeight.normal,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      /**
                       * 
                       */
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 2),
                        width: size.width,
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color: const Color(0xffe0e0e0),
                          ),
                        ),
                        child: TextFormField(
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: const InputDecoration(
                            icon: Icon(
                              Icons.phone,
                              size: 20,
                              color: Color(0xff868d96),
                            ),
                            hintText: "Celular",
                            hintStyle: TextStyle(
                              color: Color(
                                0xff868d96,
                              ),
                              fontWeight: FontWeight.normal,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),

                      /**
                       * 
                       */
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            width: (size.width - 60) * 0.5,
                            height: 55,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                // primary: Colors.white,
                                elevation: 0,
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: Color(0xffe0e0e0),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              child: Row(
                                children: const [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(
                                    Icons.expand_more,
                                    size: 25,
                                    color: Color(0xff868d96),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Condición de pago",
                                      style: TextStyle(
                                        color: Color(0xff868d96),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            width: (size.width - 60) * 0.5,
                            height: 55,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                // primary: Colors.white,
                                elevation: 0,
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: Color(0xffe0e0e0),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              child: Row(
                                children: const [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(
                                    Icons.expand_more,
                                    size: 25,
                                    color: Color(0xff868d96),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Forma de pago",
                                      style: TextStyle(
                                        color: Color(0xff868d96),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      /**
                       * 
                       */
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 2),
                            width: (size.width - 60) * 0.5,
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                color: const Color(0xffe0e0e0),
                              ),
                            ),
                            child: TextFormField(
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.attach_money,
                                  size: 20,
                                  color: Color(0xff868d96),
                                ),
                                hintText: "S/ 0.00",
                                hintStyle: TextStyle(
                                  color: Color(
                                    0xff868d96,
                                  ),
                                  fontWeight: FontWeight.normal,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 2),
                            width: (size.width - 60) * 0.5,
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                color: const Color(0xffe0e0e0),
                              ),
                            ),
                            child: TextFormField(
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.attach_money,
                                  size: 20,
                                  color: Color(0xff868d96),
                                ),
                                hintText: "S/ 0.00",
                                hintStyle: TextStyle(
                                  color: Color(
                                    0xff868d96,
                                  ),
                                  fontWeight: FontWeight.normal,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                      /**
                       * 
                       */
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 2),
                        width: size.width,
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color: const Color(0xffe0e0e0),
                          ),
                        ),
                        child: TextFormField(
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlignVertical: TextAlignVertical.center,
                          maxLines: 6,
                          decoration: const InputDecoration(
                            icon: Icon(
                              Icons.assignment,
                              size: 20,
                              color: Color(0xff868d96),
                            ),
                            hintText: "Observación",
                            hintStyle: TextStyle(
                              color: Color(
                                0xff868d96,
                              ),
                              fontWeight: FontWeight.normal,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      /**
                       * 
                       */
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        width: size.width,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            // primary: Colors.white,
                            elevation: 0,
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                color: Color(0xffe0e0e0),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 15,
                              ),
                              Icon(
                                Icons.expand_more,
                                size: 25,
                                color: Color(0xff868d96),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Text(
                                  "Metodo de envío a SUNAT",
                                  style: TextStyle(
                                    color: Color(0xff868d96),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      /**
                       * 
                       */
                    ],
                  ),
                ),
              ),
              /**
               * 
               */
              Positioned(
                bottom: 0,
                left: 0,
                width: size.width,
                height: 140,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Total:",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "S/. 133.50",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20,
                        ),
                        width: size.width,
                        height: 55,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: const Color(0xff00a46a),
                              // primary: const Color(0xff00a46a),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                              ),
                            ),
                            child: const Text(
                              "Procesar",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
