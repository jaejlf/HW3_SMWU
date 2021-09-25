//view 적용 예제

import React from 'react';
import { SafeAreaView, View, StyleSheet } from 'react-native';
import { Colors } from "react-native-paper";

const styles = StyleSheet.create({
  view1:{
    backgroundColor: Colors.indigo200,
    height: 300,
    width: 200
  },
  view2:{
    backgroundColor: Colors.yellow200,
    height: 300,
    width: 200
  }
});

export default function App(){
  return(
    <SafeAreaView style={{flex:1}}>
      <View style={styles.view1}/>
      <View style={styles.view2}/>
    </SafeAreaView>
  );
};
