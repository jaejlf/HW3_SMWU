//잘되는 세팅
import React, { useState } from 'react';
import { View, StyleSheet, Text, Switch, TouchableOpacity } from "react-native";
import { useTheme } from "react-native-paper";
import { FtSizeProvider } from '../FontSizeProvider';
import { useToggleContext } from "../ToggleThemeContext";

const Setting = () => {
    const theme = useTheme();
    const { colors } = theme;
    const toggleTheme = useToggleContext();

    const [ftSize, modify] = useState(20);
    const increaseVal = function () {
        modify((a: number) => { return ++a; });
    }
    const decreaseVal = function () {
        modify((a: number) => { return --a; });
    }

    return (<View style={[styles.view, { backgroundColor: colors.background }]}>
        <View style={[styles.bar, { backgroundColor: colors.backdrop }]}>
            <TouchableOpacity onPress={toggleTheme}><Text style={[styles.text, { color: colors.text, flex: 1, fontSize: ftSize }]}>Dark Mode</Text></TouchableOpacity>
            <View><Switch value={theme.dark} onValueChange={toggleTheme} /></View>
        </View>

        <View style={[styles.bar, { backgroundColor: colors.backdrop }]}>
            <Text style={[{ color: colors.text, flex: 1, fontSize: ftSize }]}>Font Size</Text>
            <TouchableOpacity onPress={decreaseVal}><Text style={[styles.text, { color: colors.text, flex: 1, fontSize: ftSize }]}>-</Text></TouchableOpacity>
            <Text style={[styles.text, { color: colors.text, fontSize: ftSize }]}>{ftSize}</Text>
            <TouchableOpacity onPress={increaseVal}><Text style={[styles.text, { color: colors.text, flex: 1, fontSize: ftSize }]}>+</Text></TouchableOpacity>
        </View>
    </View>);
}
const styles = StyleSheet.create({
    view: { flex: 1 },
    bar: {
        height: 50, flexDirection: "row", padding: 5, justifyContent: "space-around"
    },
    text: {
        margintLeft: 20,
        marginRight: 20
    }
})

export default Setting;