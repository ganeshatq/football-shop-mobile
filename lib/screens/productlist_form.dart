import 'package:flutter/material.dart';
import 'package:football_shop/screens/menu.dart';
import 'package:football_shop/widgets/left_drawer.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";
  String _thumbnail = "";
  String _category = "shoes";
  bool _isFeatured = false;
  int _stock = 0;
  String _brand = "";

  final List<String> _categories = [
    'shoes',
    'jersey',
    'socks',
    'shin guard',
    'cleat',
    'ball',
    'heand gloves',
    'cleats',
    'racket',
    'net',
    'whistle',
    'helmet',
    'bat',
    'skateboard',
    'goggles',
    'swimsuit',
    'surfboard'
  ];

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add Product Form')),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Product Name ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Ketik nama produkmu disini...",
                    labelText: "Nama Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Nama produk tidak boleh kosong!";
                    }
                    if (value.length < 3) {
                      return "Nama produk minimal 3 karakter!";
                    }
                    if (value.length > 50) {
                      return "Nama produk maksimal 50 karakter!";
                    }
                    return null;
                  },
                ),
              ),

              // === Price ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Ketik harga produkmu disini...",
                    labelText: "Harga Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _price = int.tryParse(value!) ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Harga tidak boleh kosong!";
                    }
                    final price = int.tryParse(value);
                    if (price == null) {
                      return "Masukkan angka yang valid!";
                    }
                    if (price <= 0) {
                      return "Harga harus lebih dari 0!";
                    }
                    return null;
                  },
                ),
              ),

              // === Thumbnail URL ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Ketik thumbnail produkmu disini...",
                    labelText: "URL Thumbnail (Optional)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _thumbnail = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Thumbnail URL tidak boleh kosong!";
                    }
                    if (value.isNotEmpty && !Uri.parse(value).isAbsolute) {
                      return "Masukkan URL yang valid!";
                    }
                    return null;
                  },
                ),
              ),

              // === Category ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Kategori",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                  ),
                  value: _category,
                  items: _categories
                      .map(
                        (cat) => DropdownMenuItem(
                          value: cat,
                          child: Text(cat[0].toUpperCase() + cat.substring(1)),
                        ),
                      )
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _category = newValue!;
                    });
                  },
                ),
              ),

              // === Stock ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Ketik jumlah stok produkmu...",
                    labelText: "Stok Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _stock = int.tryParse(value!) ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Stok tidak boleh kosong!";
                    }
                    final stock = int.tryParse(value);
                    if (stock == null) {
                      return "Masukkan angka yang valid!";
                    }
                    if (stock < 0) {
                      return "Stok tidak boleh negatif!";
                    }
                    return null;
                  },
                ),
              ),

              // === Brand ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Ketik brand produkmu disini...",
                    labelText: "Merek Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _brand = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Merek tidak boleh kosong!";
                    }
                    if (value.length > 30) {
                      return "Merek maksimal berisi 30 karakter!";
                    }
                    return null;
                  },
                ),
              ),

              // === Description ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Deskripsi Produk",
                    labelText: "Deskripsi Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }
                    if (value.length < 10) {
                      return "Deskripsi minimal berisi 10 karakter!";
                    }
                    if (value.length > 500) {
                      return "Deskripsi maksimal berisi 500 karakter!";
                    }
                    return null;
                  },
                ),
              ),

              // === Is Featured ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SwitchListTile(
                  title: const Text("Tandai sebagai Produk Unggulan"),
                  value: _isFeatured,
                  onChanged: (bool value) {
                    setState(() {
                      _isFeatured = value;
                    });
                  },
                ),
              ),

              // === Save ===
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.primary,
                        ),
                      ),

                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // TODO: ganti URL dengan URL Django punyamu
                          final response = await request.postJson(
                            "http://localhost:8000/create-product-flutter/",
                            jsonEncode({
                              "name": _name,
                              "price": _price,
                              "thumbnail": _thumbnail,
                              "category": _category,
                              "is_featured": _isFeatured,
                              "stock": _stock,
                              "brand": _brand,
                              "description": _description,
                            }),
                          );

                          if (!context.mounted) return;

                          if (response['status'] == 'success') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text("Produk berhasil disimpan ke server!"),
                              ),
                            );

                            _formKey.currentState!.reset();

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyHomePage(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "Terjadi kesalahan, silakan coba lagi."),
                              ),
                            );
                          }
                        }
                      },
                      // =====================================================
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
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
