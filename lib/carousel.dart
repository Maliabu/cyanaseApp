import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselScreen extends StatelessWidget {
  // List of image URLs or local image paths
  final List<String> imgList = [
    'https://via.placeholder.com/400x200?text=Image+1',
    'https://via.placeholder.com/400x200?text=Image+2',
    'https://via.placeholder.com/400x200?text=Image+3',
    'https://via.placeholder.com/400x200?text=Image+4',
  ];

  CarouselScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Carousel Example')),
      body: Center(
        child: CarouselSlider.builder(
          itemCount: imgList.length,
          itemBuilder: (context, index, realIndex) {
            return Image.network(
              imgList[index], // Load image from URL or local assets
              fit: BoxFit.cover,
              width: double.infinity,
            );
          },
          options: CarouselOptions(
            autoPlay: true, // Enable auto play
            enlargeCenterPage: true, // Scale up the center image
            aspectRatio: 2.0, // Aspect ratio for the carousel
            viewportFraction: 0.8, // Image view fraction in the center
            onPageChanged: (index, reason) {
              print('Current page: $index');
            },
          ),
        ),
      ),
    );
  }
}
