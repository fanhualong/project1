package reflect;

import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.lang.reflect.Type;

public class Demo1 {
    public static void main(String[] args) throws ClassNotFoundException {
        Class class1 = Class.forName("com.daishi.ssm.controller.FanTeacherController");
        Method[] methods = class1.getDeclaredMethods();
        for (Method method : methods) {
            System.out.println(method.getName());
            System.out.println("方法所在的类：" + method.getDeclaringClass());
            System.out.println("注释成员默认值：" + method.getDefaultValue());
            Type[] parameterTypes = method.getGenericParameterTypes();
            for (Type type : parameterTypes) {
                System.out.println("参数的类型：" + type.toString());
            }
            Type returnType = method.getGenericReturnType();
            System.out.println("返回参数的类型：" + returnType.toString());
            int modifiers = method.getModifiers();
            System.out.println("修饰符：" + modifiers);//没懂起
            Annotation[][] annotations2 = method.getParameterAnnotations();
            System.out.println("为空不：" + annotations2.toString());
            for (Annotation[] annotations : annotations2) {
                System.out.println("长度 = " + annotations.length);
                for (Annotation annotation : annotations) {
                    if (annotation == null) {
                        System.out.println("66666666666");
                    }
                    System.out.println("666");
                    System.out.println("这是啥" + annotation.toString());
                }
            }
            Annotation[] annotations = method.getAnnotations();
            for (Annotation annotation : annotations) {
                System.out.println("注释：" + annotation.toString());
            }

            int count = method.getParameterCount();
            System.out.println(count);

            Parameter[] parameters = method.getParameters();
            for (Parameter parameter : parameters) {
                System.out.println(parameter.getName());
            }
            Class<?>[] classes = method.getParameterTypes();
        }

    }
}
