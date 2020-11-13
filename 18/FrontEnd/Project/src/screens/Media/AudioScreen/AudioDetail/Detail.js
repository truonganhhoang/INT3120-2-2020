import React, { useEffect, useState, useRef } from 'react';
import { Container, Row, Col, Spinner, TouchableHighlight } from 'native-base';
import { useNavigation, useRoute } from '@react-navigation/native';
import { StyleSheet, View, Text } from 'react-native';
import axios from 'axios';
import Icon from 'react-native-vector-icons/FontAwesome5';
import TimeSlider from "react-input-slider";

import HeaderPractice from '../../../../components/HeaderPractice';

const Detail = ({navigation, route}) => {
  // const navigation = useNavigation();
  // const route = useRoute();
  const audioRef = useRef();
  const [audioIndex, setAudioIndex] = useState(0);
  const [loading, setLoading] = useState(true);
  const [data, setData] = useState(null);
  const [isPlaying, setIsPlaying] = useState(false)
  const [currentTime, setCurrentTime] = useState(0);
  const [duration, setDuration] = useState(50);

  const handleTimeSliderChange = ({ x }) => {
    audioRef.current.currentTime = x;
    setCurrentTime(x);

    if (!isPlay) {
      setPlay(true);
      audioRef.current.play();
    }
  };

  useEffect(() => {
    axios
      .get("https://hacknao-api.herokuapp.com/new_words", {params: {q: {unit_id_eq: route.params.id}}})
      .then((res) => {
        setData(res.data);
        setLoading(false);
      })
      .catch((er) => console.log(er.response))
      .finally(() => setLoading(false));
  }, []);

  console.log(route.params.id)
  return (
    <Container>
      <HeaderPractice icon="times" onClick={() => navigation.goBack()} />
      {loading && <Spinner />}

      <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center', marginTop: 150 }}>
        <Row>
          <Col style={styles.column_left}>
            {!!data &&
              data.data
                .map((item) => (
                  <Text style={styles.word_en}>{item.word_en}</Text>
                  // <Text>Phat am</Text>
                ))}
          </Col>
          <Col style={styles.column_right}>
            {!!data &&
              data.data
                .map((item) => (
                  <Text style={styles.word_vi}>{item.word_vi}</Text>
                ))}
          </Col>
        </Row>
        
        <View style={styles.controls}>
          <View style={styles.control_option_left} onPress={() => alert('')}>
            <Icon name='snowflake' size={30} color='#000' />
          </View>
          <View style={styles.control_ward} onPress={() => alert('')}>
            <Icon name='backward' size={50} color='#00C2ED' />
          </View>
          <View style={styles.control_play} onPress={() => alert('???')}>
            {isPlaying ? (
              <Icon name='pause' size={80} color='#00C2ED' />
                ) : (
              <Icon name='play-circle' size={80} color='#00C2ED' />
            )}
          </View>
          <View style={styles.control_ward} onPress={() => alert('')}>
            <Icon name='forward' size={50} color='#00C2ED' />
          </View>
          <View style={styles.control_option_right} onPress={() => alert('')}>
            <Icon name='reply' size={30} color='#000' />
          </View>
        </View>
      </View>
    </Container>
  );
};

const styles = StyleSheet.create({
  column_left: {
    marginLeft: 40,
  },
  column_right: {
    marginRight: 40,
    textAlign: 'left'
  },
  word_en: {
    marginTop: 20,
    color: "#077B83",
    fontSize: 12,
    fontWeight: 'bold'
  },
  word_vi: {
    marginTop: 20,
    color: "#C8940D",
    fontSize: 12,
    fontWeight: 'bold',
    textAlign: 'right'
  },
  controls: {
    flexDirection: 'row'
  },
  control_ward: {
    marginVertical: 20,
    marginTop: 35
  },
  control_play: {
    margin: 20
  },
  control_option_right: {
    marginLeft: 30,
    marginTop: 45
  },
  control_option_left: {
    marginRight: 30,
    marginTop: 45
  }
});

export default Detail;
