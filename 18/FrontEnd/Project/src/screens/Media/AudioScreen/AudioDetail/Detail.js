import React from 'react';
import { Container } from 'native-base';
import { useNavigation, useRoute } from '@react-navigation/native';
import { View, Text } from 'react-native';

import HeaderPractice from '../../../../components/HeaderPractice';

const Detail = ({navigation, route}) => {
  // const navigation = useNavigation();
  // const route = useRoute();
  console.log(route.params.id)
  return (
    <Container>
      <HeaderPractice icon="times" label="Việt - Anh" onClick={() => navigation.goBack()} />

      <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
        <Text>Audio Unit!</Text>
      </View>
    </Container>
  );
};

export default Detail;
