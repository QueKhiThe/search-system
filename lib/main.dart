import 'package:flutter/material.dart';
import 'package:search_system/models/movie_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static List<Movie> moviesList = [
    Movie(
        "Người Sắt",
        2008,
        "https://s3.cloud.cmctelecom.vn/tinhte2/2019/10/4799623_Cover_Ironman.jpg",
        8.9),
    Movie(
        "Người nhện",
        2018,
        "https://s3.cloud.cmctelecom.vn/tinhte2/2019/10/4799623_Cover_Ironman.jpg",
        8.3),
    Movie(
        "Thor",
        2022,
        "https://s3.cloud.cmctelecom.vn/tinhte2/2019/10/4799623_Cover_Ironman.jpg",
        8.4),
    Movie(
        "Phù thuỷ áo đen",
        2012,
        "https://s3.cloud.cmctelecom.vn/tinhte2/2019/10/4799623_Cover_Ironman.jpg",
        7.6),
    Movie(
        "Biệt đội siêu anh hùng",
        2011,
        "https://s3.cloud.cmctelecom.vn/tinhte2/2019/10/4799623_Cover_Ironman.jpg",
        5.6),
    Movie(
        "Nông dân",
        2012,
        "https://s3.cloud.cmctelecom.vn/tinhte2/2019/10/4799623_Cover_Ironman.jpg",
        7.3),
    Movie(
        "Chiến binh mùa đông",
        2008,
        "https://s3.cloud.cmctelecom.vn/tinhte2/2019/10/4799623_Cover_Ironman.jpg",
        8.9),
    Movie(
        "Siêu nhân gao",
        2008,
        "https://s3.cloud.cmctelecom.vn/tinhte2/2019/10/4799623_Cover_Ironman.jpg",
        8.9),
    Movie(
        "Cảnh sát vùng biển",
        2018,
        "https://s3.cloud.cmctelecom.vn/tinhte2/2019/10/4799623_Cover_Ironman.jpg",
        8.9),
    Movie(
        "Kho báu khổng lồ",
        2019,
        "https://s3.cloud.cmctelecom.vn/tinhte2/2019/10/4799623_Cover_Ironman.jpg",
        8.9),
    Movie(
        "Trở về quá khứ",
        2020,
        "https://s3.cloud.cmctelecom.vn/tinhte2/2019/10/4799623_Cover_Ironman.jpg",
        8.9),
    Movie(
        "Tập làm người lớn",
        2022,
        "https://s3.cloud.cmctelecom.vn/tinhte2/2019/10/4799623_Cover_Ironman.jpg",
        8.9),
    Movie(
        "Chiến binh mùa đông",
        2008,
        "https://s3.cloud.cmctelecom.vn/tinhte2/2019/10/4799623_Cover_Ironman.jpg",
        8.9),
    Movie(
        "Siêu nhân gao",
        2008,
        "https://s3.cloud.cmctelecom.vn/tinhte2/2019/10/4799623_Cover_Ironman.jpg",
        8.9),
  ];

  List<Movie> movies = List.from(moviesList);

  void search(String value) {
    setState(() {
      movies = moviesList
          .where((element) =>
              element.title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3295e9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF290baf),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Search for a movie",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => search(value),
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.white,
                  filled: true,
                  fillColor: const Color(0xff302360),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none),
                  hintText: "ex: The spider man"),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: movies.isEmpty
                    ? const Center(
                        child: Text(
                          "No result found!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : ListView.builder(
                        itemCount: movies.length,
                        itemBuilder: (context, index) => ListTile(
                              contentPadding: const EdgeInsets.all(8),
                              title: Text(
                                movies[index].title!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              subtitle: Text("${movies[index].releaseYear}"),
                              trailing: Text("${movies[index].rating}"),
                              leading: Image.network(movies[index].url!),
                            )))
          ],
        ),
      ),
    );
  }
}
