/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

import React from 'react';
import {
  SafeAreaView,
  StyleSheet,
  View,
  Text,
  StatusBar,
  Button,
  Image,
  TextInput,
} from 'react-native';

const App: () => React$Node = () => {
  return (
    <>
      <StatusBar barStyle="dark-content" backgroundColor="teal"/>
      <SafeAreaView>
        <View style={styles.appBar}>
          <Text style={styles.appBarText}>Example 1</Text>
        </View>
        <View style={styles.imageRow}>
          <Image style={styles.exampleImage} source={require('./example1.png')} />
        </View>
        <View style={styles.buttonRow}>
          <Button title="BUTTON" color="gray"/>
          <Button title="BUTTON" color="gray"/>
        </View>
        <View style={styles.buttonRow}>
          <Button title="BUTTON" color="gray"/>
          <Button title="BUTTON" color="gray"/>
        </View>
        <View style={styles.emailRow}>
          <Text>Email</Text>
          <TextInput style={styles.emailInput} dataDetectorTypes='address' selectionColor={'mediumvioletred'} />
        </View>
      </SafeAreaView>
    </>
  );
};

const styles = StyleSheet.create({
  appBar: {
    flexDirection: 'row',
    justifyContent: 'flex-start',
    alignItems: 'center',
    height: 50,
    backgroundColor: 'teal',
    color: 'teal',
  },
  appBarText: {
    fontSize: 20,
    fontWeight: "bold",
    color: "white",
    marginStart: 10,
  },
  imageRow: {
    flexDirection: 'row',
    justifyContent: 'center',
    paddingTop: 5,
    paddingBottom: 20,
  },
  exampleImage: {
    flexDirection: 'row',
    justifyContent: 'center'
  },
  buttonRow: {
    flexDirection: 'row',
    justifyContent: 'space-evenly',
    padding: 15,
  },
  emailRow: {
    flexDirection: 'row',
    justifyContent: 'flex-start',
    alignItems: 'center',
    paddingTop: 40,
  },
  emailInput: {
    flexGrow: 1,
    borderColor: 'mediumvioletred',
    fontSize: 12,
    borderBottomWidth: 1,
    marginHorizontal: 80,
    padding: 0,
  },
});

export default App;
