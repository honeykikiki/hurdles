import Wrapper from "@components/shared/Wrapper";
import globalStyles from "@styles/globalStyles";
import { StrictMode } from "react";
import { Global } from "@emotion/react";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { createRoot } from "react-dom/client";

import { BrowserRouter as Router } from "react-router-dom";
import App from "./App.tsx";
import { AlertContextProvider } from "./context/AlertContext.tsx";
import { BottomSheetProvider } from "./context/BottomSheetContext.tsx";
import { LoaderContextProvider } from "./context/LoaderContext.tsx";

const queryClient = new QueryClient();

createRoot(document.getElementById("root")!).render(
  <StrictMode>
    <QueryClientProvider client={queryClient}>
      <Wrapper>
        <Global styles={globalStyles} />
        <LoaderContextProvider>
          <AlertContextProvider>
            <BottomSheetProvider>
              <Router>
                <App />
              </Router>
            </BottomSheetProvider>
          </AlertContextProvider>
        </LoaderContextProvider>
      </Wrapper>
    </QueryClientProvider>
  </StrictMode>,
);
