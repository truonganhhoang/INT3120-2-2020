import { Button, Row, Col } from 'native-base';
import React from 'react';
import { View, Text, StyleSheet, Dimensions, Image } from 'react-native';
const option = ["Việt-Anh", "Anh-Việt", "Âm thanh"];

const TestItem = ({label, onClick, ...props }) => {
  return (
    <View style={styles.item}>
      <Row style={styles.rowTitle}>
        <Text>
          {label}
        </Text>
      </Row>
      <View>
        {option.forEach((item, index) => {
          <Row style={styles.optionTest}>
            <Text>{item}</Text>
          </Row>
        })}
      </View>
    </View>
  )
};
const screen = Dimensions.get('screen');
const styles = StyleSheet.create({
  rowTitle: {
    color: '#00CDDA',
    textAlign: 'center'
  },
  item: {
    marginLeft: '20px',
    width: screen.width * 0.3
  },
  optionTest: {
    borderRadius: 5,
    height: 20,
    color: '#000',
    backgroundColor: '#fff'


  }
})

export default TestItem;
