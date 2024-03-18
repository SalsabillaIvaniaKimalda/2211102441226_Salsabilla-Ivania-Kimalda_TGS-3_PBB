// ignore_for_file: unused_import

import 'dart:ffi';

import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Commerce'),
      ),
      body: Center(child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Expanded(
            child: IntrinsicHeight(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: viewportConstraints.maxWidth,
                    child: const Image(
                        image: NetworkImage('https://i.pinimg.com/564x/cb/e6/21/cbe621ccbd90dfb8cae07aeab720a27d.jpg')),
                  ),
                ),
                const ListProducts(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: viewportConstraints.maxWidth,
                    child: const Image(
                        image: NetworkImage('https://i.pinimg.com/564x/fa/1f/23/fa1f23d7a9ab5c961b47f68a751083b1.jpg')),
                  ),
                ),
              ]),
            ),
          ),
        );
      })),
    );
  }
}

class ListProducts extends StatelessWidget {
  const ListProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          ProductImage(),
          ProductImage(
            rndSeed: 2,
            nama: "Bunga",
            harga: 120000,
          ),
          ProductImage(
            rndSeed: 3,
          )
        ]),
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  final int rndSeed;
  final String nama;
  final double harga;
  const ProductImage(
      {super.key,
      this.rndSeed = 1,
      this.nama = "Bunga",
      this.harga = 150000});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Image(
              image:
                  NetworkImage('https://picsum.photos/200/?random=$rndSeed')),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(nama), Text("Rp. $harga")])
        ],
      ),
    );
  }
}