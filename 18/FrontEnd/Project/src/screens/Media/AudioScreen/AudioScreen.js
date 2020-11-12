import React, { useEffect, useState } from 'react';
import { Container, Row, Col, Spinner } from 'native-base';
import { StyleSheet } from 'react-native';
import { useNavigation } from '@react-navigation/native';
import axios from 'axios';

import ItemMedia from '../../../components/ItemMedia';

const AudioScreen = () => {
  const navigation = useNavigation();

  const [loading, setLoading] = useState(true);
  const [data, setData] = useState(null);

  useEffect(() => {
    axios
      .get('https://hacknao-api.herokuapp.com/units')
      .then((res) => {
        setData(res.data);
        setLoading(false);
      })
      .catch((er) => console.log(er.response))
      .finally(() => setLoading(false));
  }, []);

  return (
    <Container>
      {loading && <Spinner />}
      <Row>
        <Col style={styles.collums}>
          {!!data &&
            data.data
              .map((item, index) => {
                return index % 2 == 0 ? item : null;
              })
              .filter((n) => n)
              .map((item, index) => (
                <ItemMedia
                  label={`Audio ${item.name}`}
                  key={index}
                  onClick={() => navigation.navigate('Audio Unit', { id: item.id })}
                />
              ))}
        </Col>
        <Col style={styles.collums}>
          {!!data &&
            data.data
              .map((item, index) => {
                return index % 2 == 1 ? item.name : null;
              })
              .filter((n) => n)
              .map((item, index) => (
                <ItemMedia
                  label={`Audio ${item}`}
                  key={index}
                  onClick={() => navigation.navigate('Audio Unit', { id: item.id })}
                />
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
