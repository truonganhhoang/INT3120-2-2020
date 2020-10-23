import { Button, Row, Col } from 'native-base';
import React from 'react';
import { View, Text, StyleSheet, Dimensions, Image } from 'react-native';
import avatar from '../../constants/images/avatar.png';

const HeaderMedia = ({ icon, label, onClick, ...props }) => {
  return (
    <View style={styles.container} onPress={onClick} {...props} bordered info>
      <Row style={{ paddingTop: 8 }}>
        <Col style={{ width: '20%', height: 50 }}>
          <Image source={avatar} style={{ width: 40, height: 40, marginLeft: 20 }} />
        </Col>
        <Col style={{ width: '80%', height: 50 }}>
          <Text style={styles.text}>Hack não 1500 từ bản 2020</Text>
        </Col>
      </Row>
    </View>
  );
};
const screen = Dimensions.get('screen');
const styles = StyleSheet.create({
  container: {
    height: screen.height * 0.07,
    backgroundColor: '#fff',
    textAlign: 'center',
    marginBottom: 8
  },
  text: {
    fontSize: 16,
    fontWeight: 'bold',
    color: '#00CDDA',
    textAlign: 'left',
    marginTop: 10
  },
  option: {
    margin: 20,
    flex: 1,
    flexDirection: 'row',
  },
  button: {
    width: '50%',
    backgroundColor: '#fff',
    borderRadius: 10,
    justifyContent: 'center',
  },
  textButton: {
    textAlign: 'center',
  },
});

export default HeaderMedia;
