import 'package:flutter/material.dart';
import 'package:film/widgets/CustomNavbar.dart';
import 'package:film/pages/PlatformlarPage.dart'; // Platformlar sayfasını import et

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        // To go back to the previous page
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Kategoriler",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  children: [
                    buildCategoryItem(context, "Platformlar"),
                    buildCategoryItem(context, "Haberler"),
                    buildCategoryItem(context, "Yakında"),
                    buildCategoryItem(context, "Tüm Sanatçılar"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavbar(),
    );
  }

  Widget buildCategoryItem(BuildContext context, String categoryName) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          // İlgili kategoriye tıklandığında PlatformlarPage'e geçiş yap
          if (categoryName == "Platformlar") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PlatformlarPage()),
            );
          }
          // Diğer kategorilere yönlendirmek için gerekirse buraya ekle
        },
        child: Row(
          children: [
            Text(
              categoryName,
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 23,
            ),
          ],
        ),
      ),
    );
  }
}
