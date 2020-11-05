import 'package:equatable/equatable.dart';

abstract class TopicEvent extends Equatable {
  const TopicEvent();
}

class FetchTopicEvent extends TopicEvent {

  @override
  List<Object> get props => null;
}
