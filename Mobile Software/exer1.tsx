//간e단한 Input 받기 및 제출 시 Alert출력

import React from 'react';
import { SafeAreaView, TouchableHighlight, TouchableOpacity, Button, Alert, Text, TextInput, StyleSheet, Dimensions } from 'react-native';

let name = "";
let phone = "";
let email = "";

const { width, height } = Dimensions.get("window");

const styles = StyleSheet.create({
  labelStyle: {
    position: "absolute",
    left: 10
  },
  inputStyle: {
    position: "absolute",
    left: 150,
    width: 230,
    height: 35,
    borderWidth: 1
  },
  nameStyle: {
    color: "black",
    top: 50
  },
  phoneStyle: {
    color: "blue",
    top: 150
  },
  emailStyle: {
    color: "green",
    top: 250
  },
  button1: {
    position: "absolute",
    top: 350,
    width: width * 0.5
  },
  button2: {
    position: "absolute",
    top: 350,
    left: width * 0.5,
    width: width * 0.5
  },
  btn_text:{
    color: "blue",
    textAlign: "center"
  }
})

const ac_submit = () => {
  Alert.alert("알림", "Name: " + name + "\n" + "Phone: " + phone + "\n" + "Email: " + email,
    [{ text: "OK" }]
  )
};
const ac_analysis = () => {
  Alert.alert("알림", "Name: " + name?.length + "\n" + "Phone: " + phone?.length + "\n" + "Email: " + email?.length,
    [{ text: "OK" }]
  )
};

const App = () => {

  return (
    <SafeAreaView>
      <Text style={[styles.labelStyle, styles.nameStyle]}>Your Name: </Text>
      <TextInput style={[styles.inputStyle, styles.nameStyle]}
        placeholder="Enter your name"
        onChangeText={(text: string) => { name = text; }}
        onEndEditing={() => { console.log(name); }}
        keyboardType="default">
      </TextInput>

      <Text style={[styles.labelStyle, styles.phoneStyle]}>Phone Number: </Text>
      <TextInput style={[styles.inputStyle, styles.phoneStyle]}
        placeholder="Phone number"
        onChangeText={(text: string) => { phone = text; }}
        onEndEditing={() => { console.log(phone); }}
        keyboardType="default">
      </TextInput>

      <Text style={[styles.labelStyle, styles.emailStyle]}>Email: </Text>
      <TextInput style={[styles.inputStyle, styles.emailStyle]}
        placeholder="Email address"
        onChangeText={(text: string) => { email = text; }}
        onEndEditing={() => { console.log(email); }}
        keyboardType="default">
      </TextInput>

      <TouchableHighlight style={[styles.button1]} onPress={ac_submit}><Text style={[styles.btn_text]}>Submit</Text></TouchableHighlight>
      <TouchableHighlight style={[styles.button2]} onPress={ac_analysis}><Text style={[styles.btn_text]}>Analysis</Text></TouchableHighlight>

    </SafeAreaView>
  );
};
export default App;
