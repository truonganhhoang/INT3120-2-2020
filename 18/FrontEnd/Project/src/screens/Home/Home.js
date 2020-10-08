import React from 'react';
import { View, StyleSheet, Text, Image, Dimensions, StatusBar, ScrollView } from 'react-native';
import { Container, Thumbnail, Row, Col } from 'native-base';
import { useNavigation } from '@react-navigation/native';

import header_home from '../../constants/images/header_home.png';
import avatar from '../../constants/images/avatar.png';
import ItemHome from '../../components/ItemHome';

const Home = () => {
  const navigation = useNavigation();

  return (
    <Container style={styles.body}>
      <StatusBar hidden={false} />
      <View style={styles.header}>
        <Image source={header_home} style={styles.header_home} />
      </View>
      <View style={styles.avatar}>
        <Thumbnail large source={avatar} />
      </View>

      <View>
        <Text style={styles.text_header}>Hack não 1500 bản 2020</Text>

        <ScrollView style={styles.content}>
          <Text style={styles.text_title}>Học sách</Text>
          <Row>
            <Col style={styles.collums}>
              <ItemHome icon={'headphones'} label={'Audio & Video'} onClick={() => navigation.navigate('Audio')} />
            </Col>
            <Col style={styles.collums}>
              <ItemHome icon={'file-alt'} label={'Kiểm tra'} onClick={() => navigation.navigate('Kiểm tra')} />
            </Col>
            <Col style={styles.collums}>
              <ItemHome icon={'book-open'} label={'Luyện tập'} onClick={() => navigation.navigate('Luyện Tập')} />
            </Col>
          </Row>

          <Text style={styles.text_title}>Học mở rộng</Text>
          <Row>
            <Col style={styles.collums}>
              <ItemHome icon={'music'} label={'Bài hát'} />
            </Col>
            <Col style={styles.collums}>
              <ItemHome icon={'search'} label={'Từ điển tra câu'} />
            </Col>
            <Col style={styles.collums}>
              <ItemHome icon={'puzzle-piece'} label={'Truyện chêm tham khảo'} />
            </Col>
          </Row>
        </ScrollView>
      </View>

      <View style={styles.container}></View>
    </Container>
  );
};
const screen = Dimensions.get('screen');

const styles = StyleSheet.create({
  body: {
    backgroundColor: '#F3F3F3',
  },
  header_home: {
    width: screen.width,
    height: screen.height * 0.2,
    alignItems: 'center',
    justifyContent: 'center',
    resizeMode: 'stretch',
  },
  header: {
    backgroundColor: '#F3F3F3',
    borderBottomColor: '#000000',
  },
  container: {
    margin: 20,
    backgroundColor: '#fff',
    borderRadius: 15,
    height: screen.height * 0.2,
  },
  text_header: {
    color: '#00CDDA',
    fontSize: 18,
    fontWeight: '700',
    textAlign: 'center',
    marginTop: 60,
  },
  avatar: {
    position: 'absolute',
    top: screen.height * 0.15,
    left: 170,
    zIndex: 10,
  },
  collums: {
    marginLeft: 20,
  },
  text_title: {
    fontSize: 16,
    fontWeight: '800',
    color: '#000',
    marginLeft: 15,
    marginTop: 10,
    marginBottom: 10,
  },
});

export default Home;
