import 'package:bloc/bloc.dart';
import 'package:quiztest/models/models.dart';
import 'topic_event.dart';
import 'topic_state.dart';
import 'package:quiztest/services/api_manager.dart';
import 'package:meta/meta.dart';

class TopicBloc extends Bloc<TopicEvent, TopicState> {
  final API_Manager api;
  TopicBloc({@required this.api}) : assert(api != null),
      super(TopicInitState());

  TopicState get initialState => TopicInitState();

  @override
  Stream<TopicState> mapEventToState(TopicEvent event) async* {
    if (event is FetchTopicEvent) {
      yield TopicLoadingState();
      try {
        List<Topic> topics = await api.fetchTopic();
        yield TopicLoadedState(topics: topics);
      } catch (e) {
        yield TopicErrorState(message: e.toString());
      }
    }
  }
}
