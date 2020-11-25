import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:convert';

class TimKiem extends StatefulWidget {
  @override
  _TimKiemState createState() => _TimKiemState();
}

class _TimKiemState extends State<TimKiem> {
  var controlerSeacrch = TextEditingController();

  //thử
  TextEditingController _nameController = TextEditingController();
  var result;
  predictGender(String name) async {
    var url = "https://api.genderize.io/?name=$name";
    var res = await http.get(url);
    var body = jsonDecode(res.body);

    result = "Gender: ${body['gender']}, Probability: ${body['probability']}";
    setState(() {});
  }

//appbar
  AppBar buildAppbar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Container(
        // padding: EdgeInsets.symmetric(horizontal: 4.0),
        width: 230,
        height: 40,
        // margin: EdgeInsets.symmetric(vertical: 7.0),
        decoration: BoxDecoration(
          color: Colors.grey[600],
          border: Border.all(width: 1, color: Colors.grey[600]),
          borderRadius: BorderRadius.circular(60),
        ),
        child: (TextField(
            controller: controlerSeacrch,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
            decoration: const InputDecoration(
              filled: true,
              // prefixIcon: Icon(Icons.search, color: Colors.white),
              hintText: 'Tìm môn học',
              // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
              // contentPadding: EdgeInsets.all(10.0),
              hintStyle: TextStyle(color: Colors.white),
            ))),
      ),
      actions: [
        IconButton(
          onPressed: () => predictGender(controlerSeacrch.text),
          icon: Icon(
            Icons.search,
            color: Colors.black,
            size: 35.0,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return filter();
            }));
          },
          icon: Icon(
            Icons.filter_alt_outlined,
            color: Colors.black,
            size: 35.0,
          ),
        ),
      ],
    );
  }

  // giao diện tìm kiếm khi mở lên
  Widget boxSearch() {
    return Column(
      children: [
        ContentSearch(),
        TaiLieu(),
      ],
    );
  }

// giao diên tiemf kiếm khi tìm kiếm nội dung
  Widget contentSearch() {
    return Column(
      children: [
        ContentSearch(),
        TaiLieu(),
      ],
    );
  }

// Widget chính
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: controlerSeacrch.text.isNotEmpty ? contentSearch() : boxSearch(),
    );
  }
}

//fillter
class filter extends StatefulWidget {
  @override
  _filter createState() => _filter();
}

class _filter extends State<filter> {
  //dropDown
  Widget searchForClass() {
    String dropdownValue = 'Tất cả';
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>[
        'Lớp 1',
        'Lớp 2',
        'Lớp 3',
        'Lớp 4',
        'Lớp 5',
        'Lớp 6',
        'Lớp 7',
        'Lớp 8',
        'Lớp 9',
        'Lớp 10',
        'Lớp 11',
        'Lớp 12'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

// tìm kiếm theo ôn học
  Widget searchForSubjects() {
    return GridView.builder(
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
          child: InkResponse(
            splashColor: Colors.red,
            enableFeedback: true,
            child: Text('Ngữ Văn'),
            onTap: () {},
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white70,
          title: Text(
            'Tiềm kiếm theo:',
            style: TextStyle(
              fontSize: 26.0,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.cancel,
                color: Colors.grey,
                // size: 35.0,
              ),
            ),
          ]),
      body: Container(
        child: Column(
          children: [
            Text(
              '_Lớp',
              style: TextStyle(
                color: Colors.deepOrange,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: searchForClass(),
            ),
            Text(
              '_Môn',
              style: TextStyle(
                color: Colors.deepOrange,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: searchForSubjects(),
            ),
            Center(
              child: OutlineButton(
                textColor: Color(0xFF6200EE),
                highlightedBorderColor: Colors.black.withOpacity(0.12),
                onPressed: () {
                  // Respond to button press
                },
                child: Text("Xác nhận"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// giao diện lịch sử tìm kiếm + Hotkey
class boxHistoryAndHotkey extends StatefulWidget {
  _boxHistoryAndHotkey createState() => _boxHistoryAndHotkey();
}

class _boxHistoryAndHotkey extends State<boxHistoryAndHotkey> {
  List<String> todosHistory = List();
  List<String> todosHotkey = List();
  void initState() {
    super.initState();
    // Add code after super
    todosHistory.add('Ngữ văn');
    todosHistory.add('Toán 8');
    todosHistory.add('Lịch sử 7');
    todosHistory.add('Địa lý 8');
    todosHistory.add('Tiếng anh 10');

    todosHotkey.add('Ngữ văn');
    todosHotkey.add('Tiếng anh');
    todosHotkey.add('Hóa học');
    todosHotkey.add('Toán');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          listHotkeyOrHistory('Lịch sử tìm kiếm', todosHistory),
          listHotkeyOrHistory('Hotkey', todosHotkey),
        ],
      ),
    );
  }

  Widget listHotkeyOrHistory(String theme, List<String> history) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        children: [
          Container(
            child: Text(
              theme,
              style: TextStyle(
                color: Colors.deepOrange,
              ),
            ),
          ),
          itemHotkeyOrHistory('văn'),
          itemHotkeyOrHistory('văn'),
          itemHotkeyOrHistory('văn'),
          itemHotkeyOrHistory('văn'),
        ],
      ),
    );
  }

  Widget itemHotkeyOrHistory(String text) {
    return InputChip(
      avatar: Icon(Icons.remove),
      label: Text(text),
      onSelected: (bool value) {},
    );
  }
}

// taps
class ContentSearch extends StatefulWidget {
  @override
  _ContentSearch createState() => _ContentSearch();
}

class _ContentSearch extends State<ContentSearch> {
  List<String> contentSearch = ['Tất cả', 'Tài liệu', 'Video', 'Thi online'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: contentSearch.length,
                itemBuilder: (context, index) {
                  return BuildSearch(index);
                },
              )),
        ),
      ],
    );
  }

  Widget BuildSearch(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                contentSearch[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedIndex == index ? Colors.amber : Colors.black,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 2),
                height: 2,
                width: 30,
                color:
                    selectedIndex == index ? Colors.amber : Colors.transparent,
              ),
            ],
          )),
    );
  }
}

//khung danh sách tài liệu
class TaiLieu extends StatefulWidget {
  @override
  _TaiLieuState createState() => _TaiLieuState();
}

class _TaiLieuState extends State<TaiLieu> {
  List<String> _reSault = [
    'Bài 8 nhiễm sắc thể',
    'Bài 9 ADN',
    'Bài 10 Ôn tập chương 10'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KindDocument('Tài liệu', _reSault, _reSault.length),
        KindDocument('Video', _reSault, _reSault.length),
        KindDocument('Thi Online', _reSault, _reSault.length),
      ],
    );
  }

  Widget KindDocument(String kindDocument, List<String> _reSault, int length) {
    return Container(
      child: Column(
        children: [
          Text(
            kindDocument,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: length,
                itemBuilder: (context, index) {
                  return BuildDocument(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget BuildDocument(var resault) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailDocument(),
            settings: RouteSettings(
              arguments: resault,
            ),
          ),
        );
      },
      child: ListTile(
        title: Text(resault),
        // subtitle: Text('Secondary text'),
        leading: Icon(
          Icons.assignment_outlined,
          color: Colors.amber,
          size: 30.0,
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
    final _resault = ModalRoute.of(context).settings.arguments;
    return Container(
      child: Text(_resault),
    );
  }
}
