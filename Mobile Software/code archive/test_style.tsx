//style 적용 예제

import React from 'react';
import { SafeAreaView, View, StyleSheet, Text, Platform, ImageBackground, Dimensions } from 'react-native';
import { Colors } from "react-native-paper";
import Color from 'color';
import Icon from 'react-native-vector-icons/MaterialCommunityIcons';

const { width, height } = Dimensions.get('window');
const iconSize = width * 0.1;
const styles = StyleSheet.create({
  safeView: {
    flex: 1,
    padding: Platform.select({ ios: 0, android: 30 }),
    backgroundColor: Colors.amber200
  },
  view1: {
    backgroundColor: Colors.indigo200,
    height: '20%',
    width: '80%',
    borderWidth: 10,
    marginTop: Platform.select({
      ios: 20,
      android: 0
    }),
    marginLeft: Platform.select({
      ios: 20,
      android: 0
    })
  },
  view2: {
    backgroundColor: Color(Colors.indigo200).lighten(0.2).string(),
    height: '20%',
    width: '80%',
    borderWidth: 20
  },
  view3: {
    backgroundColor: Colors.white,
    height: '10%',
    width: '10%'
  },
  font: {
    fontFamily: 'Aa¸¶Æ÷»ê½º¹Ìµã'
  },
  icon: {
    left: '10%',
    top: '10%',
    color: Colors.orange200
  }
});

export default function App() {
  return (
    <SafeAreaView style={styles.safeView}>
      <ImageBackground style={{ flex: 1 }} source={require("./images/bg.jpg")}>
        <View style={styles.view1}><Text style={[styles.font, { fontSize: 50 }]}>¾È³çÇÏ¼¼¿ä</Text></View>
        <View style={styles.view2} />
        <View style={styles.view3}><Icon name="home" style={styles.icon} size={iconSize}></Icon></View>
      </ImageBackground>
    </SafeAreaView>
  );
};
