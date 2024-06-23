import 'package:flutter/material.dart';

class PlatformlarPage extends StatelessWidget {
  final List<Map<String, dynamic>> platformlar = [
    {
      'name': 'Netflix',
      'movies': [
        {
          'title': 'The Irishman',
          'imdb': '7.8',
          'image':
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1QF8M4PpnMSBqIndu-vN5N3Lyi_vz96qhyiH5Yj9zBg&s'
        },
        {
          'title': 'The Mandalorian',
          'imdb': '8.7',
          'image':
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRypuRhsZT-cPKcZ_ZJGTWJV3LJPl5ZnX-WDm5C3GxGGQ&s'
        },
        {
          'title': 'The Mandalorian',
          'imdb': '8.7',
          'image':
              'https://marketplace.canva.com/EAD0T8wNpY0/1/0/1131w/canva-g%C3%B6steri%C5%9Fli-boks%C3%A7u-film-afi%C5%9F-gaaXxR624I0.jpg'
        },
        {
          'title': 'Stranger Things',
          'imdb': '8.7',
          'image':
              'https://i.pinimg.com/236x/dd/63/e1/dd63e1b3f06f5cfccef1a671cd134b48.jpg'
        },
      ],
    },
    {
      'name': 'Paramount +',
      'movies': [
        {
          'title': 'The Irishman',
          'imdb': '7.8',
          'image':
              'https://filmhafizasi.com/wp-content/uploads/2014/12/4-Enemy.jpg'
        },
        {
          'title': 'The Mandalorian',
          'imdb': '8.7',
          'image':
              'https://cdn.wannart.com/production/post/2019/03/4XnwUqmKxUqQK16C16ffnw.jpg'
        },
        {
          'title': 'The Mandalorian',
          'imdb': '8.7',
          'image':
              'https://www.arttablo.com/upload/U-due-dat-film-afisi-sinema-kanvas-tablo1527596162-800.jpg'
        },
        {
          'title': 'Stranger Things',
          'imdb': '8.7',
          'image':
              'https://www.avsarfilm.com.tr/wp-content/uploads/2017/11/oteki-taraf-film-afis-poster-2.jpg'
        },
      ],
    },
    {
      'name': 'Disney +',
      'movies': [
        {
          'title': 'The Mandalorian',
          'imdb': '8.7',
          'image':
              'https://www.technopat.net/sosyal/eklenti/passengers-afis-jpg.231719/'
        },
        {
          'title': 'The Mandalorian',
          'imdb': '8.7',
          'image':
              'https://cdn1.ntv.com.tr/gorsel/PBuTq-Y0z0akpj--MRNxSg.jpg?width=674&height=1000&mode=crop&scale=both&v=20181231102430930'
        },
        {
          'title': 'Stranger Things',
          'imdb': '8.7',
          'image':
              'https://www.arthipo.com/image/cache/catalog/design/category/poster/movie-film-poster-print-arthipo-300x300.webp'
        },
        {
          'title': 'Soul',
          'imdb': '8.1',
          'image':
              'https://tr.web.img4.acsta.net/r_1280_720/pictures/23/10/11/20/52/3821042.jpg'
        },
      ],
    },
    // Diğer platformlar buraya eklenebilir
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // App bar arka plan rengi
        elevation: 0, // App bar gölge efekti sıfır yapıldı
        leading: IconButton(
          // Geri butonu
          icon: Icon(Icons.arrow_back, color: Colors.white), // Geri buton rengi
          onPressed: () {
            Navigator.of(context)
                .pop(); // Geri butonuna basıldığında sayfayı kapatır
          },
        ),
      ),
      body: ListView.builder(
        itemCount: platformlar.length,
        itemBuilder: (context, index) {
          final platform = platformlar[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  platform['name'],
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: platform['movies'].length,
                  itemBuilder: (context, movieIndex) {
                    final movie = platform['movies'][movieIndex];
                    return Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            movie['image'],
                            width: 120,
                            height: 140,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 0),
                          Text(
                            movie['title'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'IMDb: ${movie['imdb']}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
