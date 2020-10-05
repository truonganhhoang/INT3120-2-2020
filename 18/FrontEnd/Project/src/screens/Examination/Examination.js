import React from 'react';
import { View, StyleSheet, Text, Dimensions, ScrollView } from 'react-native';
import {
    Container,
    Row, Col, Body, Tab, Tabs
} from 'native-base';

import HeaderMedia from 'components/HeaderMedia';
const Examination = ({icon, label, onClick, ...props}) => {
    return (
        <Container style={styles.body}>
            <View style={styles.header}>
                <HeaderMedia/>
            </View>
            <ScrollView>
                <Row>
                    
                </Row>
               
            </ScrollView>
        </Container>
    )
}

export default Examination;