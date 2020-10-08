import React from 'react';
import { Container, Row, Col } from 'native-base';
import { StyleSheet } from 'react-native';
import { useNavigation } from '@react-navigation/native';

import ItemMedia from '../../../components/ItemMedia';

const dataItemLeft = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19];
const dataItemRight = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20];

const AudioScreen = () => {
  const navigation = useNavigation();

  return (
    <Container>
      <Row>
        <Col style={styles.collums}>
          {dataItemLeft.map((item, index) => (
            <ItemMedia label={`Audio Unit ${item}`} key={index} onClick={() => navigation.navigate('Audio Unit')} />
          ))}
        </Col>
        <Col style={styles.collums}>
          {dataItemRight.map((item, index) => (
            <ItemMedia label={`Audio Unit ${item}`} key={index} onClick={() => navigation.navigate('Audio Unit')} />
          ))}
        </Col>
      </Row>
    </Container>
  );
};

const styles = StyleSheet.create({
  collums: {
    marginLeft: 20,
  },
});

export default AudioScreen;
