import axios from "axios";

// export const url = "http://39.119.222.230:8080/";
export const URL = import.meta.env.VITE_SERVER_URL ?? "";

export const IMAGE_URL = URL + "api/images";

// axios 인스턴스 생성
const apiClient = axios.create({
  baseURL: URL, // API 기본 URL 설정
  timeout: 10000, // 요청 타임아웃 설정
  headers: {
    "Content-Type": "application/json",
  },
  withCredentials: true,
});

// 요청 인터셉터 추가
apiClient.interceptors.request.use(
  (config) => {
    // 요청이 보내지기 전에 수행할 작업

    return config;
  },
  (error) => {
    // 요청 오류가 있는 경우 수행할 작업

    return Promise.reject(error);
  },
);

// 응답 인터셉터 추가
apiClient.interceptors.response.use(
  (response) => {
    // 응답 데이터 처리

    return response;
  },
  (error) => {
    // 응답 오류 처리
    if (error.response && error.response.status === 401) {
      // 예를 들어, 인증 오류 시 로그아웃 처리
      console.log("Unauthorized access - logging out");
      // 로그아웃 처리를 수행하거나 리다이렉션 처리
    }

    return Promise.reject(error);
  },
);

export default apiClient;
