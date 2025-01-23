export const container = {
  xs: { width: "36px", height: "36px" },
  sm: { width: "56px", height: "56px" },
  md: { width: "78px", height: "78px" },
  lg: { width: "160px", height: "160px" },
  half: { width: "50%", height: "100%" },
};

export type ContainerSize = keyof typeof container;

export const radius = {
  sm: "8px",
  md: "10px",
  lg: "16px",
  xl: "20px",
  half: "50%",
};

export type RadiusSize = keyof typeof radius;
