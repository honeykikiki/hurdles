//package kr.or.ddit.util.factory;
//
//import java.util.Map;
//import java.util.concurrent.ConcurrentHashMap;
//
//import kr.or.ddit.util.anotation.Single;
//
//public class SingletonFactory {
//    private static final Map<Class<?>, Object> instances = new ConcurrentHashMap<>();
//
//    @SuppressWarnings("unchecked")
//    public static <T> T getInstance(Class<T> clazz) {
//        // @Single 애너테이션이 붙은 클래스인지 확인
//        if (!clazz.isAnnotationPresent(Single.class)) {
//            throw new IllegalArgumentException("클래스에 @Single 애너테이션이 없습니다: " + clazz.getName());
//        }
//
//        // 싱글턴 객체 생성 및 반환
//        return (T) instances.computeIfAbsent(clazz, key -> {
//            try {
//                return clazz.getDeclaredConstructor().newInstance(); // 기본 생성자 호출
//            } catch (Exception e) {
//                throw new RuntimeException("싱글턴 객체 생성 실패: " + clazz.getName(), e);
//            }
//        });
//    }
//}
