import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MovieAppHome(),
    );
  }
}

class MovieAppHome extends StatelessWidget {
  final List<Map<String, String>> movies = [
    {
      'image': 'assets/images/movie1.jpg',
      'description': 'Avatar, 2009 ABD yapımı destansı bilimkurgu filmi. Filmin senaryosunu James Cameron yazmış ve filmi yönetmiştir. Üç boyutlu (3D) sinema tekniği ile çekilmiştir. Aynı zamanda tüm zamanların en çok hasılat yapan film rekorunu elinde bulunduruyor.'
    },
    {
      'image': 'assets/images/movie2.jpg',
      'description': 'Norbourg, Maxime Giroux tarafından yönetilen ve 2022de vizyona giren Kanadalı bir drama filmidir. [1] 2005 yılındaki Norbourg skandalının dramatizasyonu olan filmde François Arnaud şirket başkanı Vincent Lacroix rolünde oynamıştır.'
    },
    {
      'image': 'assets/images/movie3.jpg',
      'description': 'Jurassic World, Jaffa ve Silverın bir hikayesinden Rick Jaffa, Amanda Silver ve Derek Connolly ile birlikte senaryoyu yazan Colin Trevorrow tarafından yönetilen 2015 Amerikan bilim kurgu aksiyon filmidir.'
    },
    {
      'image': 'assets/images/movie4.jpg',
      'description': 'Kirpi Sonic,Seganın aynı isimli video oyunu serisine dayanan,Paramount Pictures ve Sega yapımcılığında çekilen, 2020 Amerikan-Japon ortak yapımı bilimkurgu macera filmidir. Sonic serisine dayanan yeni bir film serisinin ilk ayağı olarak planlanan filmin yönetmenliğini Jeff Fowler üstlenmiştir.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2E1371),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.white54),
              prefixIcon: Icon(Icons.search, color: Colors.white54),
              filled: true,
              fillColor: Colors.deepPurple[700],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.mic, color: Colors.white54),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCategory('Çok Yakında'),
              buildMovieList(context),
              buildCategory('Editörün Seçimi'),
              buildMovieList(context),
              buildCategory('Kullanıcıların Seçimi'),
              buildMovieList(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
      ),
    );
  }

  Widget buildCategory(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget buildMovieList(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailPage(
                    movieImage: movies[index]['image']!,
                    description: movies[index]['description']!,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  movies[index]['image']!,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MovieDetailPage extends StatefulWidget {
  final String movieImage;
  final String description;

  MovieDetailPage({required this.movieImage, required this.description});

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  String selectedDate = 'Perşembe';
  String selectedTime = '16:00';

  List<String> availableDates = ['Perşembe', 'Cuma', 'Cumartesi', 'Pazar', 'Pazartesi'];
  List<String> availableTimes = ['16:00', '17:00', '18:00', '19:00', '20:00'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2E1371),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                widget.movieImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Film Açıklaması',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              widget.description,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Text(
              'Gün ve Saat Seç',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: selectedDate,
                  dropdownColor: Colors.deepPurple,
                  items: availableDates.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedDate = newValue!;
                    });
                  },
                ),
                DropdownButton<String>(
                  value: selectedTime,
                  dropdownColor: Colors.deepPurple,
                  items: availableTimes.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedTime = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SeatSelectionPage(
                      movieImage: widget.movieImage,
                      selectedDate: selectedDate,
                      selectedTime: selectedTime,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: Text('Koltuk Seçimi'),
            ),
          ),
        ],
      ),
    );
  }
}

class SeatSelectionPage extends StatefulWidget {
  final String movieImage;
  final String selectedDate;
  final String selectedTime;

  SeatSelectionPage({required this.movieImage, required this.selectedDate, required this.selectedTime});

  @override
  _SeatSelectionPageState createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  List<int> selectedSeats = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2E1371),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Koltuk Seçimi'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Koltuklar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: 64, // 8x8 grid için
              itemBuilder: (context, index) {
                bool isSelected = selectedSeats.contains(index);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedSeats.remove(index);
                      } else {
                        selectedSeats.add(index);
                      }
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue : Colors.white,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      '${index + 1}', // Koltuk numarası
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Seçilen Koltuklar: ${selectedSeats.map((e) => e + 1).join(', ')}',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderPage(
                          movieImage: widget.movieImage,
                          selectedDate: widget.selectedDate,
                          selectedTime: widget.selectedTime,
                          selectedSeats: selectedSeats,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Text('Devam Et'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class OrderPage extends StatelessWidget {
  final String movieImage;
  final String selectedDate;
  final String selectedTime;
  final List<int> selectedSeats;

  OrderPage({
    required this.movieImage,
    required this.selectedDate,
    required this.selectedTime,
    required this.selectedSeats,
  });

  @override
  Widget build(BuildContext context) {
    final int totalSeats = selectedSeats.length;
    final int totalPrice = totalSeats * 40;

    return Scaffold(
      backgroundColor: Color(0xFF1A103E),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade900,
        title: Text(
          'Sipariş Özeti',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      movieImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                movieImage.split('/').last.split('.').first,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 8),
              Divider(color: Colors.grey.shade600),
              SizedBox(height: 8),
              _buildDetailRow(Icons.calendar_today, 'Tarih:', selectedDate),
              _buildDetailRow(Icons.access_time, 'Saat:', selectedTime),
              _buildDetailRow(Icons.event_seat, 'Koltuklar:', selectedSeats.map((e) => e + 1).join(', ')),
              SizedBox(height: 16),
              Divider(color: Colors.grey.shade600),
              SizedBox(height: 16),
              _buildPriceRow('Bilet Ücreti:', '40 TL'),
              _buildPriceRow('Toplam Ücret:', '$totalPrice TL', isTotal: true),
              SizedBox(height: 24),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Ödeme işlemine geçmek için
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.pinkAccent,
                  ),
                  icon: Icon(Icons.payment),
                  label: Text(
                    'Ödemeyi Tamamla',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.pinkAccent),
          SizedBox(width: 12),
          Text(
            '$title ',
            style: TextStyle(color: Colors.grey.shade400, fontSize: 18),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String price, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isTotal ? Colors.white : Colors.grey.shade400,
              fontSize: isTotal ? 20 : 18,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            price,
            style: TextStyle(
              color: isTotal ? Colors.white : Colors.grey.shade400,
              fontSize: isTotal ? 20 : 18,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

