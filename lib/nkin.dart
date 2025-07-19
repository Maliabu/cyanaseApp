import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NKinForm extends StatefulWidget {
  const NKinForm({super.key});

  @override
  State<NKinForm> createState() => _NKinFormState();
}

class _NKinFormState extends State<NKinForm> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;
  String? _infoMessage;

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _infoMessage = null;
    });

    const String apiUrl =
        'YOUR_API_URL'; // Example: https://api.example.com/user/nextofkin
    const String authToken =
        'YOUR_AUTH_TOKEN'; // Use secure storage in real app

    final uri = Uri.parse(apiUrl);
    final request =
        http.MultipartRequest('POST', uri)
          ..headers.addAll({
            'Content-Type': 'multipart/form-data',
            'Accept': 'application/json',
            'Authorization': 'Token $authToken',
          })
          ..fields['first_name'] = _firstNameController.text
          ..fields['last_name'] = _lastNameController.text
          ..fields['email'] = _emailController.text
          ..fields['phone'] = _phoneController.text;

    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      final body = json.decode(response.body);

      if (response.statusCode == 200 && body['success'] == true) {
        setState(() {
          _infoMessage = "You have successfully edited your next of kin.";
        });
        Navigator.of(context).pop(); // Close bottom sheet
      } else {
        setState(() {
          _errorMessage = body['message'] ?? "Something went wrong...";
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

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required TextInputType keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(labelText: label, hintText: hint),
        validator:
            (value) =>
                value == null || value.isEmpty
                    ? 'This field is required'
                    : null,
      ),
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
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey[100],
                child: Icon(
                  Icons.account_circle_outlined,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Add Your Next of Kin',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _firstNameController,
                label: 'First Name',
                hint: 'John',
                keyboardType: TextInputType.name,
              ),
              _buildTextField(
                controller: _lastNameController,
                label: 'Last Name',
                hint: 'Doe',
                keyboardType: TextInputType.name,
              ),
              _buildTextField(
                controller: _emailController,
                label: 'Email',
                hint: 'nextofkin@example.com',
                keyboardType: TextInputType.emailAddress,
              ),
              _buildTextField(
                controller: _phoneController,
                label: 'Phone',
                hint: '0700123456',
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _isLoading ? null : _submitForm,
                child:
                    _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text('Change'),
              ),
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              if (_infoMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    _infoMessage!,
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
