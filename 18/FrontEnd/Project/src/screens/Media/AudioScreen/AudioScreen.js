import React, { useEffect, useState } from 'react';
import { View, Row, Col, Spinner } from 'native-base';
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
    <View>
      {loading && <Spinner />}
      <Row>
        <Col style={styles.column_left}>
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
        <Col style={styles.column_right}>
          {!!data &&
            data.data
              .map((item, index) => {
                return index % 2 == 1 ? item : null;
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
      </Row>
    </View>
  );
};

const styles = StyleSheet.create({
  column_left: {
    marginLeft: 20,
    marginRight: 10,
  },
  column_right: {
    marginRight: 20,
    marginLeft: 10
  },
});

export default AudioScreen;
