import { Row, Col } from 'native-base';
import React from 'react';
import { View, Text, StyleSheet, Dimensions } from 'react-native';
import Icon from 'react-native-vector-icons/FontAwesome5';

const HeaderPractice = ({ icon, label, score, onClick, ...props }) => {
  return (
    <View style={styles.container} bordered info>
      <Row style={{ paddingTop: 15 }}>
        <Col style={{ width: '30%', height: 50, paddingLeft: 10 }}>
          <Icon name={icon} size={30} color="#00CDDA" onPress={onClick} {...props} />
        </Col>
        <Col style={{ width: '40%', height: 50 }}>
          <Text style={styles.header_text}>{label}</Text>
        </Col>
        <Col style={{ width: '30%', height: 50 }}>
          <Text style={styles.score}>{score}</Text>
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
  },
  header_text: {
    fontSize: 14,
    fontWeight: 'bold',
    color: '#00CDDA',
    textAlign: 'center',
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
  score: {
    fontSize: 16,
    fontWeight: 'bold',
    color: '#2C8E14',
    textAlign: 'center',
  }
});

export default HeaderPractice;
