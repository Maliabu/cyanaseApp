import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

class ChangePhotoForm extends StatefulWidget {
  const ChangePhotoForm({super.key});

  @override
  State<ChangePhotoForm> createState() => _ChangePhotoFormState();
}

class _ChangePhotoFormState extends State<ChangePhotoForm> {
  File? _image;
  bool _isLoading = false;
  String? _errorMessage;
  String? _infoMessage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 75,
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _errorMessage = null;
        _infoMessage = null;
      });
    }
  }

  Future<void> _submitPhoto() async {
    if (_image == null) {
      setState(() {
        _errorMessage = "Please select an image first.";
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _infoMessage = null;
    });

    const String apiUrl =
        'YOUR_API_URL'; // e.g. https://api.example.com/user/photo
    const String authToken = 'YOUR_AUTH_TOKEN'; // Replace or load securely

    final uri = Uri.parse(apiUrl);
    final request =
        http.MultipartRequest('POST', uri)
          ..headers.addAll({
            'Accept': 'application/json',
            'Authorization': 'Token $authToken',
          })
          ..files.add(await http.MultipartFile.fromPath('photo', _image!.path));

    try {
      final response = await request.send();
      final res = await http.Response.fromStream(response);
      final body = json.decode(res.body);

      if (res.statusCode == 200 && body['success'] == true) {
        setState(() {
          _infoMessage = "Successfully updated your profile photo.";
        });
        Navigator.of(context).pop(); // Close the bottom sheet
      } else {
        setState(() {
          _errorMessage = body['message'] ?? 'Something went wrong...';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = "Error: ${e.toString()}";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget _buildPhotoPreview() {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.grey[100],
      backgroundImage: _image != null ? FileImage(_image!) : null,
      child:
          _image == null
              ? const Icon(
                Icons.camera_alt_outlined,
                size: 30,
                color: Colors.black,
              )
              : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildPhotoPreview(),
            const SizedBox(height: 12),
            const Text(
              'Change Profile Photo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: _pickImage,
              icon: const Icon(Icons.photo_library_outlined),
              label: const Text("Choose Photo"),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _isLoading ? null : _submitPhoto,
              child:
                  _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Save Photo"),
            ),
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
            if (_infoMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  _infoMessage!,
                  style: const TextStyle(color: Colors.green),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
