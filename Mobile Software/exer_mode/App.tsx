import React, { useState, useCallback } from 'react';
import { SafeAreaView, StyleSheet } from 'react-native';
import { AppearanceProvider, useColorScheme } from "react-native-appearance";
import { Provider as PaperProvider } from "react-native-paper";
import { DefaultTheme, DarkTheme } from 'react-native-paper';
import { ToggleProvider } from './ToggleThemeContext';
import Navigator from './Navigator';

export default function App() {
  const scheme = useColorScheme();
  const [theme, setTheme] = useState(scheme == "dark" ? DarkTheme : DefaultTheme);
  const toggleTheme = useCallback(() => {
    return setTheme((theme) => theme.dark ? DefaultTheme : DarkTheme);
  }, []);

  return (<AppearanceProvider>
    <PaperProvider theme={theme}>
      <ToggleProvider toggle={toggleTheme}>
        <SafeAreaView style={styles.safeAreaView}>
          <Navigator />
        </SafeAreaView>
      </ToggleProvider>
    </PaperProvider>
  </AppearanceProvider>);
}
const styles = StyleSheet.create({
  safeAreaView: { flex: 1 }
})