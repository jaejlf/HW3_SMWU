import React, { createContext, useContext } from 'react';
import type { FC } from "react";

export type FtSizeContextType = {
    pftSize: number
};
const defaultContext = {
    pftSize: 20
};
const FtSizeContext = createContext<FtSizeContextType>(defaultContext);
type FtSizeContextProperties = {
    pftSize: number
};
export const FtSizeProvider: FC<FtSizeContextProperties> = ({ children, pftSize }) => {
    const value = { pftSize };
    return (
        <FtSizeContext.Provider value={value}>
            {children}
        </FtSizeContext.Provider>
    );
};
export const useFtSizeContext = () => {
    var { pftSize } = useContext(FtSizeContext);
    return pftSize;
};