import { Button, Row, Col } from 'native-base';
import React from 'react';
import {View, Text, StyleSheet, Dimensions, Image} from 'react-native';
import avatar from '../../constants/images/avatar.png';

const HeaderCommon = ({icon, label, onClick, ...props}) => {
  return (
    <View style={styles.container} onPress={onClick} {...props} bordered info>
      <Row style={{paddingTop: 15}} >
        <Col style={{width: '20%', height: 50}}>
          <Image source={avatar} style={{width: 40, height: 40, marginLeft: 20}}/>
        </Col>
        <Col style={{width: '80%',height: 50}}>
        <Text style={styles.text}>Hack não 1500 từ bản 2020</Text>
        </Col>       
      </Row>
    </View>
  )
};
const screen = Dimensions.get('screen');
const styles = StyleSheet.create({
  container: {
    height: screen.height * 0.15,
    backgroundColor: '#fff',
    textAlign: 'center'
  },
  text: {
    fontSize: 14,
    fontWeight: "bold",
    color: '#000',
    textAlign: 'left'
  },
  option:{
    margin: 20,
    flex: 1, 
    flexDirection: 'row'
  }
})

export default HeaderCommon;
