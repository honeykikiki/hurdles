import react from "@vitejs/plugin-react";
import { defineConfig } from "vite";
import tsconfigPaths from "vite-tsconfig-paths";

// https://vite.dev/config/
export default defineConfig({
  base: "/dist", // 또는 '/your-context-path/'
  plugins: [react(), tsconfigPaths()],
  build: {
    outDir: "../../hurdles/src/main/webapp/dist",
  },
});
