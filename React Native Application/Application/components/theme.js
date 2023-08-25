/* 

    The theme for the application. Defines the rules
    which control the styling for the different screens
    within the application.

    Intent is to provide a consistent theme and feel throughout
    the application.
    
    AUTHOR: Kane Kennedy

*/

import { StyleSheet } from 'react-native';

const theme = StyleSheet.create({

    mainContainer: {

        flex: 1,
        flexDirection: "column",
        justifyContent: "space-evenly",
        backgroundColor: "steelblue",

    },

    largeTitle: {

        color: "white",
        fontFamily: "monospace",
        fontSize: 40,

    },

    standardTitle: {

        color: "white",
        fontFamily: "monospace",
        fontSize: 30,

    },

    textInput: {

        backgroundColor: "white",
        borderRadius: 2.5,
        width: 200,
        height: 40,
        padding: 5,

    },

    standardButton: {

        alignItems: 'center',
        justifyContent: 'center',
        backgroundColor: "lightskyblue",
        borderRadius: 10,
        width: 100,
        height: 30,
        padding: 5,

    },

    largeButton: {

        alignItems: 'center',
        justifyContent: 'center',
        backgroundColor: "lightskyblue",
        borderRadius: 5,
        width: 125,
        height: 37.5,
        padding: 2.5,

    },

    extraLargeButton: {

        alignItems: 'center',
        justifyContent: 'center',
        backgroundColor: "lightskyblue",
        borderRadius: 5,
        width: 200,
        height: 60,
        padding: 2.5,

    },

    standardText: {

        color: "white",

    },

    buttonText: {

        color: "white",
        fontFamily: "Roboto",
        letterSpacing: 0.25,

    }

});

export default theme;