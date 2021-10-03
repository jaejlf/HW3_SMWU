import React, { useState } from 'react';
import { View, SafeAreaView, Text, TouchableOpacity } from 'react-native';
import { styles } from './styles';

let tmp = "0";
export default function App() {
  const [num, updateNum] = useState<string>('0');

  const clickNum = (cNum: string) => {
    if (tmp != '0') {
      tmp += cNum;
    }
    else {
      tmp = cNum;
    }
    updateNum(tmp);
  };

  const clear = () => {
    tmp = "0";
    updateNum("0");
  };

  return (
    <SafeAreaView>
      <Text style={styles.inputbox}>{num}</Text>
      <View style={styles.col1}>
        <TouchableOpacity onPress={() => clickNum("7")} style={styles.btn}><Text style={styles.num}>7</Text></TouchableOpacity>
        <TouchableOpacity onPress={() => clickNum("4")} style={styles.btn}><Text style={styles.num}>4</Text></TouchableOpacity>
        <TouchableOpacity onPress={() => clickNum("1")} style={styles.btn}><Text style={styles.num}>1</Text></TouchableOpacity>
        <TouchableOpacity onPress={() => clickNum("0")} style={styles.btn}><Text style={styles.num}>0</Text></TouchableOpacity>
      </View>

      <View style={styles.col2}>
        <TouchableOpacity onPress={() => clickNum("8")} style={styles.btn}><Text style={styles.num}>8</Text></TouchableOpacity>
        <TouchableOpacity onPress={() => clickNum("5")} style={styles.btn}><Text style={styles.num}>5</Text></TouchableOpacity>
        <TouchableOpacity onPress={() => clickNum("2")} style={styles.btn}><Text style={styles.num}>2</Text></TouchableOpacity>
        <TouchableOpacity style={styles.btn}><Text style={styles.num}>=</Text></TouchableOpacity>
      </View>

      <View style={styles.col3}>
        <TouchableOpacity onPress={() => clickNum("9")} style={styles.btn}><Text style={styles.num}>9</Text></TouchableOpacity>
        <TouchableOpacity onPress={() => clickNum("6")} style={styles.btn}><Text style={styles.num}>6</Text></TouchableOpacity>
        <TouchableOpacity onPress={() => clickNum("3")} style={styles.btn}><Text style={styles.num}>3</Text></TouchableOpacity>
        <TouchableOpacity onPress={() => clear()} style={styles.btn}><Text style={styles.num}>C</Text></TouchableOpacity>
      </View>
    </SafeAreaView>
  );
}
