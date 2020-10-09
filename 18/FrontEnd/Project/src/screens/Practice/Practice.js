import React from 'react';
import { View, StyleSheet, Text, Dimensions, ScrollView } from 'react-native';
import {Container, Row, Col } from 'native-base';
import ItemPractice from '../../components/ItemPractice';
import HeaderPractice from '../../components/HeaderPractice';

const data = [1,3,5,7,9,11,13,15,17,19,21,23,25,27,29];
const data2 = [2,4,6,8,10,12,14,16,18,20,22,24,26,28,30];
const Practice = () => {
  return (
    <Container style={styles.body}>
      <View style={styles.header}>
        <HeaderPractice label={'Luyện tập'}></HeaderPractice>
      </View>

      <ScrollView style={styles.content}>
        <Row>
          <Col style={styles.collums}>
          {data.map((item) => (
            <ItemPractice label={`Unit ${item}`} />
          ))}
          </Col>
          <Col style={styles.collums}>
          {data2.map((item) => (
            <ItemPractice label={`Unit ${item}`} />
          ))}
          </Col>
        </Row>
      </ScrollView>
      
    </Container>
  )
}
const screen = Dimensions.get('screen');

const styles = StyleSheet.create({
  body: {
    backgroundColor: '#F3F3F3'
  },
  content: {
    marginLeft: -10,
  },
  header_home: {
    width: screen.width,
    height: screen.height * 0.2,
    alignItems: "center",
    justifyContent: 'center',
    resizeMode: 'stretch'
  },
  header: {
    backgroundColor: '#F3F3F3',
    borderBottomColor: '#000000'
  },
  container: {
    margin: 20,
    backgroundColor: '#fff',
    borderRadius: 15,
    height: screen.height * 0.27,
  },
  text_header: {
    color: '#00CDDA',
    fontSize: 18,
    fontWeight: "700",
    textAlign: 'center',
    marginTop: 60
  },
  collums: {
    marginLeft: 20
  },
  text_title: {
    fontSize: 16,
    fontWeight: "800",
    color: '#000',
    marginLeft: 15,
    marginTop: 10,
    marginBottom: 10
  },

})

export default Practice;
