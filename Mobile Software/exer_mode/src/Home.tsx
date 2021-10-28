import React from 'react';
import { View, StyleSheet, Text } from "react-native";
import { useTheme } from "react-native-paper";
import { useFtSizeContext } from "../FontSizeProvider";

const Home = () => {
	const theme = useTheme();
	const ftSize = useFtSizeContext();
	const { colors } = theme;

	return (	
		<View style={[styles.view, { backgroundColor: colors.background }]}>
			<Text style={[{ color: colors.text, flex: 1, fontSize: ftSize }]}>Hello World !</Text>
		</View>
	);
}
const styles = StyleSheet.create({
	view: { flex: 1 }
})
export default Home;

