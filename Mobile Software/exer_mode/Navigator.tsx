import React, { useState } from "react";
import { BottomNavigation } from "react-native-paper";
import Home from "./src/Home";
import Setting from "./src/Setting";

export default function Navigator() {
    const [index, setIndex] = useState<number>(0);
    const [routes] = useState([
        { key: 'scene1', title: 'Home', icon: 'home' },
        { key: 'scene2', title: 'Setting', icon: 'page-layout-header-footer' },
    ]);
    const renderScene = BottomNavigation.SceneMap({
        scene1: Home,
        scene2: Setting
    });
    return <BottomNavigation navigationState={{ index, routes }}
        onIndexChange={setIndex} renderScene={renderScene} />;
}