import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:convert';
import 'API.dart';
import 'document.dart';

class TimKiem extends StatefulWidget {
  @override
  _TimKiemState createState() => _TimKiemState();
}

class _TimKiemState extends State<TimKiem> {
  var controlerSeacrch = TextEditingController();
  var isShowFilter = false;

  // thử
  // var result;
  // predictGender(String name) async {
  //   var url = "https://api.genderize.io/?name=$name";
  //   var res = await http.get(url);
  //   var body = jsonDecode(res.body);
  //
  //   result = "Gender: ${body['gender']}, Probability: ${body['probability']}";
  //   setState(() {});
  // }
  Future<QuerySnapshot> getSubject() async {
    // this will return a future then value will be a user contain email, id, name, class: value.docs[0][item]
    return await FirebaseFirestore.instance
        .collection("Class_Subject")
        .where("nameSubject", arrayContains: 'Toán')
        .get();
  }

  @override
  void innitState() {
    super.initState();
    controlerSeacrch.addListener(_onSearchChange());
  }

  @override
  void dispose() {
    controlerSeacrch.removeListener(_onSearchChange());
    controlerSeacrch.dispose();
    super.dispose();
  }

  _onSearchChange() {
    print(controlerSeacrch.text);
  }

  final tabs = ['Tất cả', 'Tài liệu', 'Video', 'Thi online'];
  String text = '';
  // search
  List listSearch = [];
  search() {
    List tam = [];
    for (int i = 0; i <= document.length; i++) {
      if (controlerSeacrch.text == document[i].mon ||
          controlerSeacrch.text == document[i].lop) {
        tam.add(document[i]);
      }
    }
    setState() {
      listSearch = tam;
    }
  }

//appbar
  AppBar buildAppbar() {
    return AppBar(
      backgroundColor: Colors.green,
      elevation: 0,
      title: Container(
        // padding: EdgeInsets.symmetric(horizontal: 4.0),
        width: 230,
        height: 40,
        // margin: EdgeInsets.symmetric(vertical: 7.0),
        decoration: BoxDecoration(
          color: Colors.grey[350],
          border: Border.all(width: 1, color: Colors.grey[350]),
          borderRadius: BorderRadius.circular(60),
        ),
        child: (TextField(
            // onChanged: (text) {
            //   text = text.toLowerCase();
            // },
            controller: controlerSeacrch,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
            decoration: const InputDecoration(
              filled: true,
              prefixIcon: Icon(Icons.search, color: Colors.white),
              hintText: 'Tìm môn học',
              hintStyle: TextStyle(color: Colors.white),
            ))),
      ),
      actions: [
        IconButton(
          onPressed: () {
            text = controlerSeacrch.text;
            setState(() {});
          },
          icon: Icon(
            Icons.search,
            color: Colors.white,
            size: 35.0,
          ),
        ),
        IconButton(
          onPressed: () {
            setState() {
              isShowFilter = true;
              if (isShowFilter) {
                // return filter();
              }
            }
          },
          icon: Icon(
            Icons.filter_alt_outlined,
            color: Colors.white,
            size: 35.0,
          ),
        ),
      ],
      bottom: TabBar(
        isScrollable: true,
        indicatorColor: Colors.greenAccent[400],
        tabs: [
          for (final tab in tabs) Tab(text: tab),
        ],
      ),
    );
  }
// chuyển màn hình chi tiet video
  Widget BuildVideo(String video, String lop) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => DetailVideo(),
        //     settings: RouteSettings(
        //       arguments: video,
        //     ),
        //   ),
        // );
      },
      child: Column(
        children: [
          ListTile(
            title: Text(video),
            subtitle: Text('Lớp $lop'),
            leading: Icon(
              Icons.airplay_outlined,
              color: Colors.amber,
              size: 30.0,
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
// chuyển màn hình chi tiết thionline
  Widget BuildThionline(String thionline, String lop) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => DetailThionline(),
        //     settings: RouteSettings(
        //       arguments: thionline,
        //     ),
        //   ),
        // );
      },
      child: Column(
        children: [
          ListTile(
            title: Text(thionline),
            subtitle: Text('Lớp $lop'),
            leading: Icon(
              Icons.access_time_outlined,
              color: Colors.amber,
              size: 30.0,
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
  // chuyển màn hình chi tiết tài liệu
  Widget BuildDocument(String tailieu, String lop) {
    return GestureDetector(
      onTap: () {
        // navigator.pushbackreplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => DetailDocument(),
        //     settings: RouteSettings(
        //       arguments: tailieu,
        //     ),
        //   ),
        // );

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => DetailDocument()),
        // );
      },
      child: Column(
        children: [
          ListTile(
            title: Text(tailieu),
            subtitle: Text('Lớp $lop'),
            leading: Icon(
              Icons.assignment_outlined,
              color: Colors.amber,
              size: 30.0,
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

  Title(String title) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.deepOrange,
          fontSize: 20.0,
        ),
      ),
    );
  }

  page() {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Text(
          'Xem tiếp',
          style: TextStyle(color: Colors.amber, fontSize: 19.0),
        ),
      ),
    );
  }

  Widget AllDocment() {
    return ListView(
      children: <Widget>[
        Title('Tài liệu'),
        SizedBox(
          height: 300,
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return BuildDocument(
                  document[index].tailieu, document[index].lop);
            },
          ),
        ),
        page(),
        Title('Video'),
        SizedBox(
          height: 300,
          // child: ListDocument(_reSault),
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return BuildVideo(document[index].video, document[index].lop);
            },
          ),
        ),
        page(),
        Title('Thi online'),
        SizedBox(
          height: 300,
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return BuildThionline(
                  document[index].thionline, document[index].lop);
            },
          ),
        ),
        page(),
      ],
    );
  }

  Widget Video() {
    return ListView(
      children: [
        Title('Tài liêu được tìm thấy'),
        SizedBox(
          height: 500,
          child: ListView.builder(
            itemCount: document.length,
            itemBuilder: (context, index) {
              return BuildVideo(document[index].video, document[index].lop);
            },
          ),
        ),
      ],
    );
  }

  Widget Document() {
    return ListView(
      children: [
        Title('Tài liêu được tìm thấy'),
        SizedBox(
          height: 500,
          child: ListView.builder(
            itemCount: document.length,
            itemBuilder: (context, index) {
              return BuildDocument(
                  document[index].tailieu, document[index].lop);
            },
          ),
        ),
      ],
    );
  }

  Widget ThiOnline() {
    return ListView(
      children: [
        Title('Tài liêu được tìm thấy'),
        SizedBox(
          height: 500,
          child: ListView.builder(
            itemCount: document.length,
            itemBuilder: (context, index) {
              return BuildThionline(
                  document[index].thionline, document[index].lop);
            },
          ),
        ),
      ],
    );
  }

  notValue(String e) {
    return Container(
      child: Center(
        child: Text(
          e,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

// Widget chính
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppbar(),
        // drawer: filter(),
        // body: controlerSeacrch.text!=null ? contentSearch() : boxSearch(),
        body: TabBarView(
          children: [
            controlerSeacrch.text != ''
                ? AllDocment()
                : notValue('Không có môn nào được tìm thấy'),
            controlerSeacrch.text != ''
                ? Document()
                : notValue('Không có môn nào được tìm thấy'),
            controlerSeacrch.text != ''
                ? Video()
                : notValue('Không có môn nào được tìm thấy'),
            controlerSeacrch.text != ''
                ? ThiOnline()
                : notValue('Không có môn nào được tìm thấy'),
          ],
        ),
      ),
    );
  }
}

// giao diện nội dung chi tiết.
class DetailDocument extends StatefulWidget {
  @override
  _DetailDocument createState() => _DetailDocument();
}

class _DetailDocument extends State<DetailDocument> {
  @override
  Widget build(BuildContext context) {
    // final _resault = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'text',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      // body: Text('heno'),
      body: ContentDetail(),
    );
  }

  Widget ContentDetail() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                Text('Tập hợp các số tự nhiên',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    )),
              ],
            ),
            Text(
              'Bài 8 (trang 8 SGK Toán 6 Tập 1)',
              style: TextStyle(color: Colors.black, fontSize: 18.0),
            ),
            Text(
                'Viết tập hợp các số tự nhiên không vượt quá 5 bằng hai cách. Biểu diễn trên tia số các phần tử của tập hợp'),
            Text(
              'Lời giải',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
            Text(
                '- Các số tự nhiên không vượt quá 5 gồm các phần tử 0,1,2,3,4,5.'),
          ],
        ),
      ),
    );
  }
}

// giao dien video
class DetailVideo extends StatefulWidget {
  @override
  _DetailDocument createState() => _DetailDocument();
}

class _DetailVideo extends State<DetailVideo> {
  @override
  Widget build(BuildContext context) {
    final _resault = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: Text(
          _resault,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      // body: ContentVideo('heno'),
      body: ContentVideo('video'),
    );
  }

  Widget ContentVideo(String titel) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text('video'),
              ),
              Text(
                'Video liên quan',
                style: TextStyle(color: Colors.deepOrange, fontSize: 20.0),
              ),
              Container(
                child: ListView.builder(
                  itemCount: document.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailDocument(),
                            settings: RouteSettings(
                              arguments: document[index].video,
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(document[index].video),
                            subtitle: Text(document[index].lop),
                            leading: Icon(
                              Icons.access_time_outlined,
                              color: Colors.amber,
                              size: 30.0,
                            ),
                          ),
                          Divider(),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Text(
                'Các bài thi liên quan',
                style: TextStyle(color: Colors.deepOrange, fontSize: 20.0),
              ),
              Container(
                child: ListView.builder(
                  itemCount: document.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailDocument(),
                            settings: RouteSettings(
                              arguments: document[index].video,
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(document[index].video),
                            subtitle: Text(document[index].lop),
                            leading: Icon(
                              Icons.access_time_outlined,
                              color: Colors.amber,
                              size: 30.0,
                            ),
                          ),
                          Divider(),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// giao diên chi tiết thi online
class DetailThionline extends StatefulWidget {
  @override
  _DetailtThionline createState() => _DetailtThionline();
}

class _DetailtThionline extends State<DetailThionline> {
  @override
  Widget build(BuildContext context) {
    final _resault = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: Text(
          _resault,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      // body: ContentVideo('heno'),
      body: ContentThionline('Tập hộp phần tử có chọn lọc'),
    );
  }

  Widget ContentThionline(String titel) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tâp hợp. Phần tử của tập hợp chọn lọc có đáp án',
              style: TextStyle(color: Colors.deepOrange, fontSize: 20.0),
            ),
            Row(
              children: [
                Column(
                  children: [
                    ListTile(
                      title: Text(
                        '12',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Text('Câu hỏi'),
                      leading: Icon(
                        Icons.wb_incandescent,
                        color: Colors.amber,
                        size: 30.0,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ListTile(
                      title: Text(
                        '30',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Text('Phút'),
                      leading: Icon(
                        Icons.wb_incandescent,
                        color: Colors.amber,
                        size: 30.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              'Hướng dẫn',
              style: TextStyle(
                fontSize: 23.0,
                color: Colors.black,
              ),
            ),
            Container(
              child: Text(
                'Vói những câu trả lời đúng bạn giành được 1 điểm, 0 điểm với những câu trả lời sai.'
                ' Chọn câu trả lời bằng cách Click vào nó. Bỏ qua câu hỏi nếu chưa có đáp án sau đớ quay lại để là lại ',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Center(
              child: RaisedButton(
                child: Text(
                  'Thi ngay',
                  style: TextStyle(color: Colors.white, fontSize: 30.0),
                ),
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
