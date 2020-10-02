import React from 'react';
import { View, StyleSheet, Text, Dimensions, ScrollView } from 'react-native';
import {
  Container,
  Row, Col, Body, Tab, Tabs
} from 'native-base';
import ItemMedia from '../../components/ItemMedia';
import HeaderMedia from '../../components/HeaderMedia';

const data = [1,3,5,7,9,11,13,15,17,19];
const data2 = [2,4,6,8,10,12,14,16,18,20];
const Media = () => {
  return (
    <Container style={styles.body}>
      <View style={styles.header}>
        <HeaderMedia></HeaderMedia>
      </View>

        <ScrollView style={styles.content}>
          <Row>
            <Col style={styles.collums}>
            {data.map((item) => (
              <ItemMedia label={`Audio Unit ${item}`} />
            ))}
            </Col>
            <Col style={styles.collums}>
            {data2.map((item) => (
              <ItemMedia label={`Audio Unit ${item}`} />
            ))}
            </Col>
          </Row>
          {/* <Row>
            <Col style={styles.collums}>
              <ItemMedia label={"Audio Unit 3"} />
            </Col>
            <Col style={styles.collums}>
              <ItemMedia label={"Audio Unit 4"} />
            </Col>
          </Row> */}
        </ScrollView>
      
    </Container>
  )
}
const screen = Dimensions.get('screen');

const styles = StyleSheet.create({
  body: {
    backgroundColor: '#F3F3F3'
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

export default Media;
