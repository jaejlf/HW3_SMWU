import React, { createContext, useContext } from "react";
import type { FC } from "react";

export type ToggleContextType = {
    toggle: () => void
};
const defaultContext = {
    toggle: () => { }
};
const ToggleContext = createContext<ToggleContextType>(defaultContext);
type ToggleContextProperties = {
    toggle: () => void
};
export const ToggleProvider: FC<ToggleContextProperties> = ({ children, toggle }) => {
    const value = { toggle };
    return (
        <ToggleContext.Provider value={value}>
            {children}
        </ToggleContext.Provider>
    );
};
export const useToggleContext = () => {
    const { toggle } = useContext(ToggleContext);
    return toggle;
};
