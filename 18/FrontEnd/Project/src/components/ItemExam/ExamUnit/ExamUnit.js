import React, { useEffect, useState } from 'react';
import {Dimensions, Text, StyleSheet, View} from 'react-native';
import axios from 'axios';
import {Container, Button } from 'native-base';
import HeaderPractice from '../../HeaderPractice/HeaderPractice';
import { useNavigation } from '@react-navigation/native';

const ExamUnit = ({exam_id, type, onClickVA, onClickAV, onClickAT, ...props}) => {
  const navigation = useNavigation();
  const [data, setData] = useState(null);
  useEffect(() => {
    axios.get('https://hacknao-api.herokuapp.com/new_words')
      .then(res => setData(res.data))
      .catch(er => console.log(er.response))
      .finally(() => console.log('ket thuc'))
  }, []);

  return (
    <Container>
      <HeaderPractice icon="times" label="Việt - Anh" onClick={() => navigation.goBack()} />

      <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
        <Text></Text>
      </View>
    </Container>
  )
};
const screen = Dimensions.get('screen');

export default ExamUnit;
