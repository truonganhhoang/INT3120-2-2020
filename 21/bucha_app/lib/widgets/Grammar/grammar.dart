import 'package:bucha_app/widgets/Grammar/Unit.dart';
import 'package:bucha_app/main.dart';
import 'package:bucha_app/widgets/Grammar/GrammarOption.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GrammarPage extends StatefulWidget {
  @override
  _GrammarPageState createState() => _GrammarPageState();
}

class PlayButton extends StatelessWidget {
  PlayButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      height: 50.0,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/PlayGameButton.png'),
              fit: BoxFit.fill)),
    );
  }
}

class BackButton extends StatelessWidget {
  BackButton();

  void _backToHomePage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return HomePage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      child: InkWell(
        onTap: () {
          _backToHomePage(context);
        },
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/back.png'), fit: BoxFit.fill)),
    );
  }
}

class _GrammarPageState extends State<GrammarPage> {
  static const _grammarOptions = <String>[
    '12 THÌ TRONG TIẾNG ANH',
    'CÂU BỊ ĐỘNG',
    'CÂU ƯỚC',
    'CÂU HỎI ĐUÔI',
    'CÂU ĐIỀU KIỆN',
    'CÂU SO SÁNH',
    'CÁC LOẠI CÂU KHÁC',
    'MỆNH ĐỀ QUAN HỆ',
    'CÁC THÀNH PHẦN CỦA CÂU',
    'TRỢ ĐỘNG TỪ',
    'MỘT SỐ NGỮ PHÁP KHÁC',
    'ĐỘNG TỪ',
  ];

  static const _optionColors = <ColorSwatch>[
    ColorSwatch(0xFFE8F5E9, {
      'highlight': Color(0xFF9E9E9E),
    }),
    ColorSwatch(0xFFFFFFFF, {
      'highlight': Color(0xFF9E9E9E),
    })
  ];

  static final _GrammarUnits = <Unit>[
    Unit(
      name: 'Hiện tại đơn',
      color: Colors.amber[300],
      set: '12 THÌ TRONG TIẾNG ANH',
    ),
    Unit(
      name: 'Hiện tại tiếp diễn',
      color: Colors.amber[200],
      set: '12 THÌ TRONG TIẾNG ANH',
    ),
    Unit(
      name: 'Hiện tại hoàn thành',
      color: Colors.amber[300],
      set: '12 THÌ TRONG TIẾNG ANH',
    ),
    Unit(
      name: 'Hiện tại hoàn thành tiếp diễn',
      color: Colors.amber[200],
      set: '12 THÌ TRONG TIẾNG ANH',
    ),
    Unit(
      name: 'Quá khứ đơn',
      color: Colors.amber[300],
      set: '12 THÌ TRONG TIẾNG ANH',
    ),
    Unit(
      name: 'Quá khứ tiếp diễn',
      color: Colors.amber[200],
      set: '12 THÌ TRONG TIẾNG ANH',
    ),
    Unit(
      name: 'Quá khứ hoàn thành',
      color: Colors.amber[300],
      set: '12 THÌ TRONG TIẾNG ANH',
    ),
    Unit(
      name: 'Quá khứ hoàn thành tiếp diễn',
      color: Colors.amber[200],
      set: '12 THÌ TRONG TIẾNG ANH',
    ),
    Unit(
      name: 'Tương lai đơn',
      color: Colors.amber[300],
      set: '12 THÌ TRONG TIẾNG ANH',
    ),
    Unit(
      name: 'Tương lai tiếp diễn',
      color: Colors.amber[200],
      set: '12 THÌ TRONG TIẾNG ANH',
    ),
    Unit(
      name: 'Tương lai hoàn thành',
      color: Colors.amber[300],
      set: '12 THÌ TRONG TIẾNG ANH',
    ),
    Unit(
      name: 'Tương lai hoàn thành tiếp diễn',
      color: Colors.amber[200],
      set: '12 THÌ TRONG TIẾNG ANH',
    ),
    Unit(
      name: 'Cấu trúc ngữ pháp câu bị động',
      color: Colors.amber[300],
      set: 'CÂU BỊ ĐỘNG',
    ),
    Unit(
      name: 'Các trường hợp đặc biệt câu bị động',
      color: Colors.amber[200],
      set: 'CÂU BỊ ĐỘNG',
    ),
    Unit(
      name: 'Câu ước loại 1 - Tương lai',
      color: Colors.amber[300],
      set: 'CÂU ƯỚC',
    ),
    Unit(
      name: 'Cấu ước loại 2 - Hiện tại',
      color: Colors.amber[200],
      set: 'CÂU ƯỚC',
    ),
    Unit(
      name: 'Cấu ước loại 3 - Quá khứ',
      color: Colors.amber[300],
      set: 'CÂU ƯỚC',
    ),
    Unit(
      name: 'Công thức câu hỏi đuôi',
      color: Colors.amber[300],
      set: 'CÂU HỎI ĐUÔI',
    ),
    Unit(
      name: 'Dạng đặc biệt của câu hỏi đuôi',
      color: Colors.amber[200],
      set: 'CÂU HỎI ĐUÔI',
    ),
    Unit(
      name: 'Cấu điều kiện loại 1',
      color: Colors.amber[300],
      set: 'CÂU ĐIỀU KIỆN',
    ),
    Unit(
      name: 'Cấu điều kiện loại 2',
      color: Colors.amber[200],
      set: 'CÂU ĐIỀU KIỆN',
    ),
    Unit(
      name: 'Cấu điều kiện loại 3',
      color: Colors.amber[300],
      set: 'CÂU ĐIỀU KIỆN',
    ),
    Unit(
      name: 'Đảo ngữ của câu điều kiện',
      color: Colors.amber[200],
      set: 'CÂU ĐIỀU KIỆN',
    ),
    Unit(
      name: 'Dạng đặc biệt của câu điều kiện',
      color: Colors.amber[300],
      set: 'CÂU ĐIỀU KIỆN',
    ),
    Unit(
      name: 'So sánh bằng',
      color: Colors.amber[300],
      set: 'CÂU SO SÁNH',
    ),
    Unit(
      name: 'So sánh hơn',
      color: Colors.amber[200],
      set: 'CÂU SO SÁNH',
    ),
    Unit(
      name: 'So sánh nhất',
      color: Colors.amber[300],
      set: 'CÂU SO SÁNH',
    ),
    Unit(
      name: 'So sánh kép',
      color: Colors.amber[200],
      set: 'CÂU SO SÁNH',
    ),
    Unit(
      name: 'So sánh gấp nhiều lần',
      color: Colors.amber[300],
      set: 'CÂU SO SÁNH',
    ),
    Unit(
      name: 'Bảng so sánh tính từ, trạng từ bất quy tắc',
      color: Colors.amber[200],
      set: 'CÂU SO SÁNH',
    ),
    Unit(
      name: 'Các dạng so sánh của tính từ và phó từ',
      color: Colors.amber[300],
      set: 'CÂU SO SÁNH',
    ),
    Unit(
      name: 'Câu gián tiếp',
      color: Colors.amber[300],
      set: 'CÁC LOẠI CÂU KHÁC',
    ),
    Unit(
      name: 'Câu chẻ',
      color: Colors.amber[200],
      set: 'CÁC LOẠI CÂU KHÁC',
    ),
    Unit(
      name: 'Câu đảo ngữ',
      color: Colors.amber[300],
      set: 'CÁC LOẠI CÂU KHÁC',
    ),
    Unit(
      name: 'Câu mệnh lệnh',
      color: Colors.amber[200],
      set: 'CÁC LOẠI CÂU KHÁC',
    ),
    Unit(
      name: 'Câu cảm thán',
      color: Colors.amber[300],
      set: 'CÁC LOẠI CÂU KHÁC',
    ),
    Unit(
      name: 'Câu đồng tình',
      color: Colors.amber[200],
      set: 'CÁC LOẠI CÂU KHÁC',
    ),
    Unit(
      name: 'Câu hỏi',
      color: Colors.amber[300],
      set: 'CÁC LOẠI CÂU KHÁC',
    ),
    Unit(
      name: 'Câu phủ định (negation)',
      color: Colors.amber[200],
      set: 'CÁC LOẠI CÂU KHÁC',
    ),
    Unit(
      name: 'Câu giả định (subjunctive)',
      color: Colors.amber[300],
      set: 'CÁC LOẠI CÂU KHÁC',
    ),
    Unit(
      name: 'Một số cấu trúc cầu khiến (causative)',
      color: Colors.amber[200],
      set: 'CÁC LOẠI CÂU KHÁC',
    ),
    Unit(
      name: 'Đại từ quan hệ và trạng từ quan hệ',
      color: Colors.amber[300],
      set: 'MỆNH ĐỀ QUAN HỆ',
    ),
    Unit(
      name: 'Rút gọn mệnh đề quan hệ và lược bỏ đại từ quan hệ',
      color: Colors.amber[200],
      set: 'MỆNH ĐỀ QUAN HỆ',
    ),
    Unit(
      name: 'Cấu trúc chung của một câu',
      color: Colors.amber[300],
      set: 'CÁC THÀNH PHẦN CỦA CÂU',
    ),
    Unit(
      name: 'Sự hòa hợp giữa chủ ngữ và động từ',
      color: Colors.amber[200],
      set: 'CÁC THÀNH PHẦN CỦA CÂU',
    ),
    Unit(
      name: 'Noun phrase (Ngữ danh từ)',
      color: Colors.amber[300],
      set: 'CÁC THÀNH PHẦN CỦA CÂU',
    ),
    Unit(
      name: 'Cấu trúc trật tự tính từ',
      color: Colors.amber[200],
      set: 'CÁC THÀNH PHẦN CỦA CÂU',
    ),
    Unit(
      name: 'Đại từ',
      color: Colors.amber[300],
      set: 'CÁC THÀNH PHẦN CỦA CÂU',
    ),
    Unit(
      name: 'Tân ngữ và các vấn đề liên quan',
      color: Colors.amber[200],
      set: 'CÁC THÀNH PHẦN CỦA CÂU',
    ),
    Unit(
      name: 'Tính từ và phó từ',
      color: Colors.amber[300],
      set: 'CÁC THÀNH PHẦN CỦA CÂU',
    ),
    Unit(
      name: 'Liên từ (linking verb)',
      color: Colors.amber[200],
      set: 'CÁC THÀNH PHẦN CỦA CÂU',
    ),
    Unit(
      name: 'Các cụm từ nối mang tính quan hệ nhân quả',
      color: Colors.amber[300],
      set: 'CÁC THÀNH PHẦN CỦA CÂU',
    ),
    Unit(
      name: 'Các trợ động từ (Modal Auxiliaries)',
      color: Colors.amber[300],
      set: 'TRỢ ĐỘNG TỪ',
    ),
    Unit(
      name: 'Cách dùng một số trợ động từ hình thái ở thời hiện tại',
      color: Colors.amber[200],
      set: 'TRỢ ĐỘNG TỪ',
    ),
    Unit(
      name: 'Dùng trợ động từ để diễn đạt tình huống quá khứ',
      color: Colors.amber[300],
      set: 'TRỢ ĐỘNG TỪ',
    ),
    Unit(
      name: 'Công thức viết lại câu',
      color: Colors.amber[300],
      set: 'MỘT SỐ NGỮ PHÁP KHÁC',
    ),
    Unit(
      name: 'Lối nói phụ họa',
      color: Colors.amber[200],
      set: 'MỘT SỐ NGỮ PHÁP KHÁC',
    ),
    Unit(
      name: 'Lối nói bao hàm (inclusive)',
      color: Colors.amber[300],
      set: 'MỘT SỐ NGỮ PHÁP KHÁC',
    ),
    Unit(
      name: 'Một số động từ đặc biệt',
      color: Colors.amber[300],
      set: 'ĐỘNG TỪ',
    ),
    Unit(
      name: 'Một số động từ thường gặp',
      color: Colors.amber[200],
      set: 'ĐỘNG TỪ',
    ),
    Unit(
      name: 'Những động từ dễ gây nhầm lẫn',
      color: Colors.amber[300],
      set: 'ĐỘNG TỪ',
    ),
    Unit(
      name: 'Động từ (V-ing, V-ed) dùng làm tính từ',
      color: Colors.amber[200],
      set: 'ĐỘNG TỪ',
    ),
    Unit(
      name: 'Sử dụng V-ing, to + Verb để mở đầu một câu',
      color: Colors.amber[300],
      set: 'ĐỘNG TỪ',
    ),
    Unit(
      name: 'Cách sử dụng một số cấu trúc P1',
      color: Colors.amber[200],
      set: 'ĐỘNG TỪ',
    ),
    Unit(
      name: 'Cách sử dụng một số cấu trúc P2',
      color: Colors.amber[300],
      set: 'ĐỘNG TỪ',
    ),
    Unit(
      name: 'Cách sử dụng to say, to tell',
      color: Colors.amber[200],
      set: 'ĐỘNG TỪ',
    ),
    Unit(
      name: 'Cách sử dụng to know, to know how',
      color: Colors.amber[300],
      set: 'ĐỘNG TỪ',
    ),
  ];

  List<Unit> _retrieveUnitList(String grammarOption) {
    List units = List<Unit>();
    for (var i = 0; i < _GrammarUnits.length; i++) {
      if (_GrammarUnits[i].set == grammarOption) {
        units.add(_GrammarUnits[i]);
      }
    }
    return units;
  }

  ListView listView = ListView();
  final options = <GrammarOption>[];

  @override
  void initState() {
    for (var i = 0; i < _grammarOptions.length; i++) {
      options.add(GrammarOption(
        name: _grammarOptions[i],
        units: _retrieveUnitList(_grammarOptions[i]),
        color: _optionColors[i % 2],
      ));
    }
    listView = ListView.builder(
      itemBuilder: (BuildContext context, int index) => options[index],
      itemCount: options.length,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.pinkAccent,
        child: new Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              height: 550.0,
              decoration: BoxDecoration(
                  color: Colors.yellow[200],
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Container(
                margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                decoration: BoxDecoration(
                    color: Colors.blueGrey[400],
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: new Column(
                  children: [
                    Container(
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: Colors.orange[400],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0)),
                      ),
                      child: Center(
                        child: Text(
                          'NGỮ PHÁP',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: 24.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    new Container(
                      margin:
                          EdgeInsets.only(right: 5.0, left: 5.0, bottom: 10.0, top: 10.0),
                      child: SizedBox(
                        height: 450.0,
                        child: listView,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 330.0,
              height: 70.0,
              child: new Row(
                children: [
                  BackButton(),
                  new Padding(padding: EdgeInsets.only(left: 70.0)),
                  PlayButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
