package kr.or.ddit.util;

import java.lang.reflect.Array;
import java.lang.reflect.Field;

import jakarta.servlet.http.HttpServletRequest;

public class RequestToVoMapper {

    public static <T> T mapRequestToVo(HttpServletRequest request, Class<T> clazz) {
        try {
            // VO 객체 생성
            T instance = clazz.getDeclaredConstructor().newInstance();

            // VO의 모든 필드를 가져옴
            Field[] fields = clazz.getDeclaredFields();

            for (Field field : fields) {
                field.setAccessible(true); // private 필드 접근 허용

                // HttpServletRequest에서 VO 필드와 동일한 이름의 파라미터 값 가져오기
                if (field.getType().isArray()) {
                    // 배열 타입 처리
                    String[] paramValues = request.getParameterValues(field.getName());
                    if (paramValues != null) {
                        Object array = convertToFieldTypeArray(field.getType().getComponentType(), paramValues);
                        field.set(instance, array);
                    }
                } else {
                    // 단일 값 처리
                    String paramValue = request.getParameter(field.getName());
                    if (paramValue != null) {
                        Object value = convertToFieldType(field.getType(), paramValue);
                        field.set(instance, value);
                    }
                }
            }
            return instance;
        } catch (Exception e) {
            throw new RuntimeException("VO 매핑 중 에러 발생", e);
        }
    }

    private static Object convertToFieldType(Class<?> fieldType, String value) {
        if (value == null || value.trim().isEmpty()) {
            return null; // 빈 값일 경우 null 반환
        }

        if (fieldType == String.class) {
            return value.isEmpty() ? null : value;
        }
        if (fieldType == int.class || fieldType == Integer.class) {
            return Integer.parseInt(value.trim()); // trim()을 사용하여 공백 제거 후 파싱
        }
        if (fieldType == double.class || fieldType == Double.class) {
            return Double.parseDouble(value.trim()); // trim()을 사용하여 공백 제거 후 파싱
        }
        if (fieldType == boolean.class || fieldType == Boolean.class) {
            return Boolean.parseBoolean(value.trim()); // trim()을 사용하여 공백 제거 후 파싱
        }

        throw new IllegalArgumentException("지원하지 않는 필드 타입입니다: " + fieldType.getName());
    }


    private static Object convertToFieldTypeArray(Class<?> componentType, String[] values) {
        Object array = Array.newInstance(componentType, values.length);
        for (int i = 0; i < values.length; i++) {
            Array.set(array, i, convertToFieldType(componentType, values[i]));
        }
        return array;
    }
}
