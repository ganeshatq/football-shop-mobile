import 'package:flutter/material.dart';
import 'package:football_shop/screens/menu.dart';
import 'package:football_shop/screens/productlist_form.dart';
<<<<<<< HEAD
import 'package:football_shop/screens/products_entry_list.dart';
=======
>>>>>>> a46a031a41d7bf9128c6db5fb15add22733964eb

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
<<<<<<< HEAD
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
=======
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
>>>>>>> a46a031a41d7bf9128c6db5fb15add22733964eb
                Text(
                  'TokoOlahraga BeliYuk',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Temukan produk terbaik dengan harga bersahabat!",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            onTap: () {
              Navigator.push(
                context,
<<<<<<< HEAD
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
=======
                MaterialPageRoute(builder: (context) => MyHomePage()),
>>>>>>> a46a031a41d7bf9128c6db5fb15add22733964eb
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Tambah Produk'),
            onTap: () {
              Navigator.push(
                context,
<<<<<<< HEAD
                MaterialPageRoute(
                  builder: (context) => const ProductFormPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.list_alt_outlined),
            title: const Text('Daftar Produk'),
            onTap: () {
              // Navigasi ke halaman daftar products (products_entry_list)
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductsEntryListPage(),
                ),
=======
                MaterialPageRoute(builder: (context) => ProductFormPage()),
>>>>>>> a46a031a41d7bf9128c6db5fb15add22733964eb
              );
            },
          ),
        ],
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> a46a031a41d7bf9128c6db5fb15add22733964eb
