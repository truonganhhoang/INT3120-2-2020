class Post {
  String id; //random id
  int type; // 0 : find student; 1 = find teacher
  bool accepted; // is accepted or not
  String whoPostUid; // post owner
  String whoAcceptUid; //post acceptor
  int grade; // class's grade
  String subject; // subject
  String address; // class address
  List<bool> days; // learn or teach days of week; true is chosen
  String session; // length of a session
  String course; // length of a course
  String gender; // required gender for acceptor
  String requiredComment; //some addition required comment
  double salary;

  Post.fromJson(Map<String, dynamic>json){
    this.id = json['DocumentID'];
    this.type = json['Type'];
    this.accepted = json['Accepted'];
    this.whoPostUid = json['Owner'];
    this.whoAcceptUid = json['Acceptor'];
    this.grade = json['Grade'];
    this.subject = json['Subject'];
    this.address = json['Address'];
    this.days = json['Days'].values.toList().cast<bool>();
    this.session = json['Session'];
    this.course = json['Course'];
    this.gender = json['Gender'];
    this.requiredComment = json['RequiredComment'];
    this.salary = json['Salary'];
  }

  Map toJson() =>
      {
        'DocumentID': this.id,
        'Type': this.type,
        'Accepted': this.accepted,
        'Owner': this.whoPostUid,
        'Acceptor': this.whoAcceptUid,
        'Grade': this.grade,
        'Subject': this.subject,
        'Address': this.address,
        'Session': this.session,
        'Course': this.course,
        'Gender': this.gender,
        'RequiredComment': this.requiredComment,
        'Salary': this.salary,
      };


// all must be not null except requiredComment
}