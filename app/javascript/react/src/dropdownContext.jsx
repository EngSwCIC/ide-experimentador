import React, { createContext, useContext, useState } from "react";

const DropdownCardContext = createContext();

function DropdownCardProvider({ children }) {
  const [open, setOpen] = useState(false);

  value = { open, setOpen };
  return (
    <DropdownCardContext.Provider value={value}>
      {children}
    </DropdownCardContext.Provider>
  );
}

function useModal() {
  return useContext(DropdownCardContext);
}

export { DropdownCardProvider, useModal };
