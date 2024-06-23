// ignore_for_file: unused_import
import 'package:film/pages/records_page.dart';
import 'package:flutter/material.dart';
import 'package:film/widgets/CustomNavbar.dart';
import 'package:film/database_helper.dart';
import 'package:film/pages/RecordsPage.dart';

class AdminPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _saveRecord() async {
    final String name = _nameController.text;
    final String surname = _surnameController.text;
    final String email = _emailController.text;
    final String password = _passwordController.text;

    final Map<String, dynamic> record = {
      'name': name,
      'surname': surname,
      'email': email,
      'password': password,
    };

    try {
      await DatabaseHelper().insertRecord(record);
      print('Record saved: $record');
    } catch (e) {
      print('Error saving record: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'İsim',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            TextFormField(
              controller: _surnameController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Soyisim',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            TextFormField(
              controller: _emailController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'E-posta',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            TextFormField(
              controller: _passwordController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Şifre',
                labelStyle: TextStyle(color: Colors.white),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _saveRecord();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecordsPage()),
                );
              },
              child: Text('Kaydet'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavbar(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
