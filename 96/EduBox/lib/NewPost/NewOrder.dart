import '../NewPost/DaysOfWeek.dart';
import '../package/widget.dart';

class NewOrderTeacher extends StatefulWidget {
  @override
  _NewOrderTeacherState createState() => _NewOrderTeacherState();
}

class _NewOrderTeacherState extends State<NewOrderTeacher> {
  static var divider = Divider(height: 10, color: Colors.transparent);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm yêu cầu mới'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: ListView(
            children: [
              Container(
                height: 60,
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                margin: EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 4,
                        blurRadius: 2,
                        color: Colors.black12,
                      ),
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Image.asset(
                        'lib/assests/teacher-and-student.png',
                        height: 30,
                        width: 30,
                      ),
                    ),
                    Text(
                      'Học tại nhà',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  LabelText(text: 'Lớp'),
                  ADropDownMenu(
                      listOfItems: List.generate(
                          12, (index) => 'Lớp ' + (index + 1).toString())),
                ],
              ),
              divider,
              Column(
                children: [
                  LabelText(text: 'Môn'),
                  ADropDownMenu(listOfItems: [
                    'Toán',
                    'Lý',
                    'Hóa',
                    'Văn',
                    'Sinh',
                    'Anh',
                    'Tin'
                  ]),
                ],
              ),
              divider,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelText(text: 'Địa chỉ'),
                  InputBox(
                    hintText: 'Địa chỉ của bạn',
                    maxLine: 3,
                  ),
                ],
              ),
              divider,
              Column(
                children: [
                  LabelText(text: 'Ngày học trong tuần'),
                  DaysOfWeek(),
                ],
              ),
              divider,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 140,
                    child: Column(
                      children: [
                        LabelText(text: 'Thời gian'),
                        InputBox(
                            hintText: DateTime.now().hour.toString() + ':00',
                            dateTime: true),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward, size: 33),
                  Container(
                    height: 80,
                    width: 140,
                    alignment: Alignment.bottomCenter,
                    child: InputBox(
                        hintText: DateTime.now()
                                .add(Duration(hours: 2))
                                .hour
                                .toString() +
                            ':00',
                        dateTime: true),
                  ),
                ],
              ),
              divider,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 140,
                    child: Column(
                      children: [
                        LabelText(text: 'Thời gian bắt đầu'),
                        InputBox(
                            hintText: DateTime.now().day.toString() +
                                '-' +
                                DateTime.now().month.toString() +
                                '-' +
                                DateTime.now().year.toString(),
                            dateTime: true),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward, size: 33),
                  Container(
                    height: 80,
                    width: 140,
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        LabelText(text: 'Thời gian kết thúc'),
                        InputBox(
                            hintText: DateTime.now()
                                    .add(Duration(days: 30))
                                    .day
                                    .toString() +
                                '-' +
                                DateTime.now()
                                    .add(Duration(days: 30))
                                    .month
                                    .toString() +
                                '-' +
                                DateTime.now()
                                    .add(Duration(days: 30))
                                    .year
                                    .toString(),
                            dateTime: true),
                      ],
                    ),
                  ),
                ],
              ),
              divider,
              Column(
                children: [
                  LabelText(text: 'Giới tính'),
                  ADropDownMenu(
                    listOfItems: ['Nam/Nữ', 'Nam', 'Nữ'],
                  )
                ],
              ),
              divider,
              Column(
                children: [
                  LabelText(text: 'Mô tả yêu cầu'),
                  InputBox(
                      hintText:
                          'Nhập mô tả của bạn \nVui lòng nhập chi tiết mô tả (nếu có)',
                      maxLine: 4)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
