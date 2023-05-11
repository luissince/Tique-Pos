import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/app_provider.dart';

class ProductsPage extends StatefulWidget {
  static String id = "products_page";
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff00a46a),
        title: const Text(
          "Lista de Productos",
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
            alignment: Alignment.center,
            children: [
              _viewWidget(),
              _searchWidget(size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _viewWidget() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: 150,
        ),
        child: Column(
          children: [],
        ),
      ),
    );
  }

  Widget _searchWidget(Size size) {
    return Positioned(
      bottom: 0,
      left: 0,
      width: size.width,
      height: 160,
      child: Container(
        padding: const EdgeInsets.all(20.0),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 0,
                    ),
                    width: size.width,
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: const Color(0xffe0e0e0),
                      ),
                    ),
                    child: TextFormField(
                      // controller: busquedaController,
                      onChanged: (String value) {
                        // if (value.isEmpty) return;

                        // if (loading) return;

                        // setState(() {
                        //   paginacion = 1;
                        // });

                        // _onLoadVentas(1, value);

                        // setState(() {
                        //   opcion = 1;
                        // });
                      },
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.search,
                          size: 20,
                          color: Color(0xff868d96),
                        ),
                        hintText: "Escribe para filtrar",
                        hintStyle: TextStyle(
                          color: Color(0xff868d96),
                          fontWeight: FontWeight.normal,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Mostrando 0 página de 0"),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color(0xff00a46a),
                          // primary: const Color(0xff00a46a),
                          foregroundColor: const Color(0xffffffff),
                          // onPrimary: const Color(0xffffffff),
                          disabledBackgroundColor: Colors.transparent,
                          // onSurface: Colors.transparent,
                          shadowColor: Colors.transparent,
                          minimumSize: const Size(0, 0),
                          padding: const EdgeInsets.all(2.0),
                        ),
                        child: const Icon(
                          Icons.arrow_left,
                          color: Colors.white,
                          size: 45,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color(0xff00a46a),
                          // primary: const Color(0xff00a46a),
                          foregroundColor: const Color(0xffffffff),
                          // onPrimary: const Color(0xffffffff),
                          disabledBackgroundColor: Colors.transparent,
                          // onSurface: Colors.transparent,
                          shadowColor: Colors.transparent,
                          minimumSize: const Size(0, 0),
                          padding: const EdgeInsets.all(2.0),
                        ),
                        child: const Icon(
                          Icons.arrow_right,
                          color: Colors.white,
                          size: 45,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
