import { StatusBar } from 'expo-status-bar';
import React, {Component} from 'react';
import {View, Platform, StyleSheet, Text, TouchableOpacity} from 'react-native';
import Header from '../Header';
import Quiz from '../Quiz';
import { FlatList } from 'react-native-gesture-handler';
import StatusTab from './statusTab';

const dataList = [{key: '1'}, {key: '2'}, {key: '3'}, {key: '4'}, {key: '5'}]

export default class Running extends Component {
    constructor(props){
        super(props);
        this.state = {
            nameTab: 'Activity'
        }
    }
    _renderItem = ({item, index}) => {
        return (
            <View style={styles.itemQuiz}>
                <Quiz>
                </Quiz>
            </View>
        );
    }
    render() {
        return (
             <View style = {styles.container}>
                 <Header nameTab={this.state.nameTab}></Header>
                 <StatusTab></StatusTab>
                 <View>
                    <FlatList
                        data={dataList}
                        renderItem={this._renderItem}
                        keyExtractor={(item, index) => index.toString()}
                        numColumns= {2}
                    >

                    </FlatList>
                 </View>
             </View>
        );
    }
}

const styles = StyleSheet.create({
    container: {
        marginTop: Platform.OS === 'ios' ? 20 : 0,
    },
    itemQuiz: {
        marginTop: 20,
        justifyContent: 'center',
        flex: 1
    }
})