import 'package:equatable/equatable.dart';
import 'package:quiztest/models/models.dart';
import 'package:meta/meta.dart';

abstract class TopicState extends Equatable {
  const TopicState();

  @override
  List<Object> get props => [];
}

class TopicInitState extends TopicState {}

class TopicLoadingState extends TopicState {}

class TopicLoadedState extends TopicState {
  final List<Topic> topics;
  TopicLoadedState({@required this.topics}) : assert(topics != null);

  @override
  List<Object> get props => [topics];
}

class TopicErrorState extends TopicState {
  final String message;
  TopicErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}
