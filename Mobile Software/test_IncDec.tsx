//Increase, Decrease 예제

import React, { useEffect, useState } from 'react';
import { StyleSheet, SafeAreaView, Text, Button } from 'react-native';

export default function App() {
  const [value, modify] = useState(0);
  const increaseVal = function () {
    modify((a: number) => { return ++a; });
  }
  const decreaseVal = function () {
    modify((a: number) => { return --a; });
  }
  return (
    <SafeAreaView>
      <Text>{value}</Text>
      <Button title='Increase' onPress={increaseVal} />
      <Button title='Decrease' onPress={decreaseVal} />
    </SafeAreaView>);
}
