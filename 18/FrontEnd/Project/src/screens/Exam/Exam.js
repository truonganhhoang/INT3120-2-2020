import React, { useEffect, useState } from 'react';
import { View, StyleSheet, Dimensions, ScrollView } from 'react-native';
import {Container, Row, Col } from 'native-base';
import { useNavigation } from '@react-navigation/native';
import axios from 'axios';

import ItemExam from '../../components/ItemExam';
import HeaderMedia from '../../components/HeaderMedia';

const Exam = () => {
  const [data, setData] = useState(null);
  useEffect(() => {
    axios.get('https://hacknao-api.herokuapp.com/units')
      .then(res => setData(res.data))
      .catch(er => console.log(er.response))
      .finally(() => console.log('ket thuc'))
  }, []);

  const navigation = useNavigation();
  return (
    <Container style={styles.body}>
      <View style={styles.header}>
        <HeaderMedia></HeaderMedia>
      </View>

      <ScrollView style={styles.content}>
        <Row>
          <Col style={styles.collums}>
          {!!data && data.data.map((item, index) => {return (index%2==0) ? item : null}).filter(n => n).map((item) => (
            <ItemExam label={`${item.name}`} key={item.id} exam_id={item.id}
              onClickVA={() => navigation.navigate('Exam Unit')} 
              onClickAV={() => navigation.navigate('Exam Unit')} 
              onClickAT={() => navigation.navigate('Exam Unit')}/>
          ))}
          </Col>
          <Col style={styles.collums}>
          {!!data && data.data.map((item, index) => {return (index%2==1) ? item : null}).filter(n => n).map((item) => (
            <ItemExam label={`${item.name}`} key={item.id} exam_id={item.id}
              onClickVA={() => navigation.navigate('Exam Unit')} 
              onClickAV={() => navigation.navigate('Exam Unit')} 
              onClickAT={() => navigation.navigate('Exam Unit')}/>
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

export default Exam;
