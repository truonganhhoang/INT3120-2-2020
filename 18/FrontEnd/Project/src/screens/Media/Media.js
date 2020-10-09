import React from 'react';
import { View, StyleSheet, Text, Dimensions, ScrollView } from 'react-native';
import { Container, Row, Col, Body, Tab, Tabs, TabHeading } from 'native-base';
import HeaderMedia from '../../components/HeaderMedia';
import AudioScreen from './AudioScreen';
import VideoScreen from './VideoScreen';

const Media = () => {
  return (
    <Container style={styles.body}>
      <View style={styles.header}>
        <HeaderMedia />
      </View>

      <Tabs>
        <Tab
          textStyle={{ color: '#000', fontWeight: '400' }}
          tabStyle={{ backgroundColor: '#fff' }}
          activeTabStyle={{ backgroundColor: '#4bd6f2' }}
          heading="Audio"
        >
          <ScrollView style={styles.content}>
            <AudioScreen />
          </ScrollView>
        </Tab>
        <Tab
          textStyle={{ color: '#000', fontWeight: '400' }}
          tabStyle={{ backgroundColor: '#fff' }}
          activeTabStyle={{ backgroundColor: '#4bd6f2' }}
          heading="Video"
        >
          <ScrollView style={styles.content}>
            <VideoScreen />
          </ScrollView>
        </Tab>
      </Tabs>
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
    height: screen.height * 0.27,
  },
  content: {
    marginLeft: -5,
  },
  text_header: {
    color: '#00CDDA',
    fontSize: 18,
    fontWeight: '700',
    textAlign: 'center',
    marginTop: 60,
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

export default Media;
