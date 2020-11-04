import React, { useEffect, useState } from 'react';
import { Container, Row, Col } from 'native-base';
import { StyleSheet } from 'react-native';
import { useNavigation } from '@react-navigation/native';
import axios from 'axios';

// import { useQuery } from '../../../hooks/axios.hook';
import ItemMedia from '../../../components/ItemMedia';

const AudioScreen = () => {
  const navigation = useNavigation();
//   const {data, loading} = useQuery({
//     url: '/units',
//   });
// console.log(!loading && data)

  const [data, setData] = useState(null);

  useEffect(() => {
    axios.get('https://hacknao-api.herokuapp.com/units')
      .then(res => setData(res.data))
      .catch(er => console.log(er.response))
      .finally(() => console.log('ket thuc'))
  }, []);

  return (
    <Row>
      <Col style={styles.collums}>
        {!!data && data.data.map((item, index) => {return (index%2==0) ? (item.name) : null}).filter(n => n).map((item, index) => (
          <ItemMedia label={`Audio ${item}`} key={index} onClick={() => navigation.navigate('Audio Unit')} />
        ))}
      </Col>
      <Col style={styles.collums}>
        {!!data && data.data.map((item, index) => {return (index%2==1) ? (item.name) : null}).filter(n => n).map((item, index) => (
          <ItemMedia label={`Audio ${item}`} key={index} onClick={() => navigation.navigate('Audio Unit')} />
        ))}
      </Col>
    </Row>
  );
};

const styles = StyleSheet.create({
  collums: {
    marginLeft: 20,
  },
});

export default AudioScreen;
