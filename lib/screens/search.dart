import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  static const title = 'Search';

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Map<String, dynamic>> decksData = [
    {'name': 'Chùa Tam Chúc', 'description': 'Ngôi chùa lớn nhất Đông Nam Á', 'image': 'https://ik.imagekit.io/tvlk/blog/2023/05/chua-tam-chuc-12.jpg?tr=dpr-2,w-675'},
    {'name': 'Quốc Tử Giám', 'description': 'Trường Đại học đầu tiên của Việt Nam', 'image': 'https://ik.imagekit.io/tvlk/blog/2022/08/van-mieu-quoc-tu-giam-1-1024x683.jpg?tr=dpr-2,w-675'},
    {'name': 'Thành Cổ Loa', 'description': 'Nơi thờ vua An Dương Vương', 'image': 'https://ik.imagekit.io/tvlk/blog/2022/09/thanh-co-loa-1.jpg?tr=dpr-2,w-675'},
  ];

  List<Map<String, dynamic>> cardsData = [
    {'name': 'Chùa Tam Chúc', 'description': 'Ngôi chùa lớn nhất Đông Nam Á', 'image': 'https://ik.imagekit.io/tvlk/blog/2023/05/chua-tam-chuc-12.jpg?tr=dpr-2,w-675'},
    {'name': 'Quốc Tử Giám', 'description': 'Trường Đại học đầu tiên của Việt Nam', 'image': 'https://ik.imagekit.io/tvlk/blog/2022/08/van-mieu-quoc-tu-giam-1-1024x683.jpg?tr=dpr-2,w-675'},
    {'name': 'Thành Cổ Loa', 'description': 'Nơi thờ vua An Dương Vương', 'image': 'https://ik.imagekit.io/tvlk/blog/2022/09/thanh-co-loa-1.jpg?tr=dpr-2,w-675'},
  ];

  TextEditingController deckSearchController = TextEditingController();
  TextEditingController cardSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Số lượng tab
      child: Scaffold(
        appBar: AppBar(
          title: Text(SearchPage.title),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Tìm kiếm bộ'),
              Tab(text: 'Tìm kiếm thẻ'),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Xử lý khi nhấn nút tìm kiếm
              },
            ),
          ],
        ),
        body: TabBarView(
          children: [
            // Nội dung cho tab "Tìm kiếm bộ"
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: deckSearchController,
                          onChanged: (value) {
                            setState(() {
                              // Cập nhật giá trị khi thay đổi
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Tìm kiếm bộ...',
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          // Xóa từ khóa tìm kiếm và làm mới danh sách
                          deckSearchController.clear();
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: decksData.length,
                    itemBuilder: (context, index) {
                      final deckName = decksData[index]['name'].toLowerCase();
                      final deckDescription = decksData[index]['description'].toLowerCase();
                      final searchKeyword = deckSearchController.text.toLowerCase();

                      if (deckName.contains(searchKeyword) ||
                          deckDescription.contains(searchKeyword) ||
                          searchKeyword.isEmpty) {
                        return Card(
                          child: ListTile(
                            leading: Image.network(
                              decksData[index]['image'],
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text(decksData[index]['name']),
                            subtitle: Text(decksData[index]['description']),
                            onTap: () {
                              // Xử lý khi bấm vào một bộ flashcard
                            },
                          ),
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ],
            ),
            // Nội dung cho tab "Tìm kiếm thẻ"
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: cardSearchController,
                          onChanged: (value) {
                            setState(() {
                              // Cập nhật giá trị khi thay đổi
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Tìm kiếm thẻ...',
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          // Xóa từ khóa tìm kiếm và làm mới danh sách
                          cardSearchController.clear();
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cardsData.length,
                    itemBuilder: (context, index) {
                      final cardName = cardsData[index]['name'].toLowerCase();
                      final cardDescription = cardsData[index]['description'].toLowerCase();
                      final searchKeyword = cardSearchController.text.toLowerCase();

                      if (cardName.contains(searchKeyword) ||
                          cardDescription.contains(searchKeyword) ||
                          searchKeyword.isEmpty) {
                        return Card(
                          child: ListTile(
                            leading: Image.network(
                              cardsData[index]['image'],
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text(cardsData[index]['name']),
                            subtitle: Text(cardsData[index]['description']),
                            onTap: () {
                              // Xử lý khi bấm vào một thẻ flashcard
                            },
                          ),
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
