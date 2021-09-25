//시계 예제

import React, { useEffect, useState } from 'react';
import { StyleSheet, SafeAreaView, Text } from 'react-native';

export default function App() {
  const [time, setTime] = useState(new Date());
  useEffect(() => {
    const id = setInterval(() => {
      setTime(new Date());
    }, 1000);
    return () => { clearInterval(id); }
  }, []);
  return (
    <SafeAreaView style={styles.safeAreaView}>
      <Text style={[styles.digitFont, styles.time]}>
        {time.toLocaleTimeString()}
      </Text>
      <Text style={styles.digitFont}>
        {time.toLocaleDateString()}
      </Text>
    </SafeAreaView>
  );
}
const styles = StyleSheet.create({
  safeAreaView: { flex: 1, alignItems: 'center', justifyContent: 'center' },
  digitFont: { fontFamily: 'MajorMonoDisplay-Regular', fontWeight: '400' },
  time: { fontSize: 50 }
});
