import { StyleSheet } from 'react-native';

export const styles = StyleSheet.create({
  inputbox: {
    width: 340,
    height: 80,
    left: 10,
    top: 30,
    margin: 10,
    padding: 10,
    backgroundColor: "#9C9C9C",
    borderColor: "#717171",
    borderWidth: 2,
    fontSize: 45,
    color: "#000000",
    textAlign: "right"
  },
  col1: {
    position: "absolute",
    left: 10,
    top: 150
  },
  col2: {
    position: "absolute",
    left: 130,
    top: 150
  },
  col3: {
    position: "absolute",
    left: 250,
    top: 150
  },
  num: {
    height: "100%",
    textAlign: "center",
    textAlignVertical: "center",
    fontSize: 40,
    color: "#BF3103"
  },
  btn: {
    width: 100,
    height: 100,
    margin: 10,
    borderWidth: 4,
    backgroundColor: "#FACB7C",
    borderColor: "#BF3103",
    borderRadius: 20
  }
});
