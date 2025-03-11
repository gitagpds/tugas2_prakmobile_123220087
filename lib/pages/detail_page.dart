import 'package:flutter/material.dart';
import 'package:tugas2/data/cats.dart';

class DetailPage extends StatefulWidget {
  final int index;
  const DetailPage({super.key, required this.index});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final cat = catList[widget.index];
    String formattedBirthday = "${cat.birthday.day}-${cat.birthday.month}-${cat.birthday.year}";
    int age = DateTime.now().year - cat.birthday.year;

    return Scaffold(
      appBar: AppBar(
        title: Text(cat.name, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(cat.pictureUrl, width: double.infinity, height: 250, fit: BoxFit.cover),
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cat.name,
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.cake, color: Colors.pinkAccent),
                      const SizedBox(width: 8),
                      Text("Born: $formattedBirthday", style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.timelapse, color: Colors.blue),
                      const SizedBox(width: 8),
                      Text("Age : $age years", style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.pets, color: Colors.orange),
                      const SizedBox(width: 8),
                      Text("Breed : ${cat.breed}", style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.color_lens, color: Colors.green),
                      const SizedBox(width: 8),
                      Text("Color : ${cat.color}", style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.wc, color: Colors.purple),
                      const SizedBox(width: 8),
                      Text("Sex : ${cat.sex == 'M' ? 'Male' : 'Female'}", style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Divider(),
                  if (cat.vaccines.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    const Text("Vaccines", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Wrap(
                      spacing: 8,
                      children: cat.vaccines.map((vaccine) => Chip(label: Text(vaccine))).toList(),
                    ),
                  ],
                  const SizedBox(height: 12),
                  const Text("Characteristics", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 8,
                    children: cat.characteristics.map((char) => Chip(label: Text(char))).toList(),
                  ),
                  const SizedBox(height: 12),
                  const Text("Background", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(cat.background, textAlign: TextAlign.justify),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
