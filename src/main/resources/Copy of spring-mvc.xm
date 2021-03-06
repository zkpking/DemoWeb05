<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:p="http://www.springframework.org/schema/p"
	xmlns:context="http://www.springframework.org/schema/context"
	xmlns:mvc="http://www.springframework.org/schema/mvc"
	xsi:schemaLocation="http://www.springframework.org/schema/beans  
                        http://www.springframework.org/schema/beans/spring-beans-3.1.xsd  
                        http://www.springframework.org/schema/context  
                        http://www.springframework.org/schema/context/spring-context-3.1.xsd  
                        http://www.springframework.org/schema/mvc  
                        http://www.springframework.org/schema/mvc/spring-mvc-4.0.xsd">
                        
	<!-- 自动扫描该包，使SpringMVC认为包下用了@controller注解的类是控制器 -->
	<context:component-scan base-package="com.*.controller" />
	<!--避免IE执行AJAX时，返回JSON出现下载文件 -->
	<bean id="mappingJacksonHttpMessageConverter"
		class="org.springframework.http.converter.json.MappingJacksonHttpMessageConverter">
		<property name="supportedMediaTypes">
			<list>
				<value>text/html;charset=UTF-8</value>
			</list>
		</property>
	</bean>
	<!-- 启动SpringMVC的注解功能，完成请求和注解POJO的映射 -->
	<bean
		class="org.springframework.web.servlet.mvc.annotation.AnnotationMethodHandlerAdapter">
		<property name="messageConverters">
			<list>
				<ref bean="mappingJacksonHttpMessageConverter" />	<!-- JSON转换器 -->
			</list>
		</property>
	</bean>
	<!-- 定义跳转的文件的前后缀 ，视图模式配置-->
	<!-- 设置JSP的配置文件路径 -->
    <bean id="jspViewResolver" class="org.springframework.web.servlet.view.InternalResourceViewResolver"> 
        <property name="viewClass" value="org.springframework.web.servlet.view.JstlView"/>
        <property name="viewNames" value="*.jsp" />
          <property name="prefix" value="/WEB-INF/jsp"/> 
        <property name="suffix" value=".jsp"/>
          <property name="order" value="1"/>   
    </bean>
     
    <!-- 设置freeMarker的配置文件路径 -->
    <bean id="freemarkerConfiguration"
        class="org.springframework.beans.factory.config.PropertiesFactoryBean">
        <property name="location" value="classpath:freemarker.properties"/>
    </bean>
    <!-- 配置freeMarker的模板路径 -->
    <bean id="freemarkerConfig"
        class="org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer">
        <property name="freemarkerSettings" ref="freemarkerConfiguration"/>
        <property name="templateLoaderPath" value="classpath:html"/>
        <property name="freemarkerVariables">
            <map>
                <entry key="xml_escape" value-ref="fmXmlEscape" />
            </map>
        </property>
    </bean>
 
    <bean id="fmXmlEscape" class="freemarker.template.utility.XmlEscape" />
    <!-- 配置freeMarker视图解析器 -->
    <bean id="viewResolver"
        class="org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver">
        <property name="viewNames" value="*.ftl" />
        <property name="contentType" value="text/html; charset=utf-8" />
        <property name="cache" value="true" />
        <property name="prefix" value=""/> 
        <property name="suffix" value=".ftl"/> 
        <property name="order" value="0"/> 
        <property name="exposeRequestAttributes" value="true" />
        <property name="allowSessionOverride" value="true" />
        <property name="exposeSessionAttributes" value="true" />
        <property name="exposeSpringMacroHelpers" value="true" />
    </bean>
	
	<!-- 配置文件上传，如果没有使用文件上传可以不用配置，当然如果不配，那么配置文件中也不必引入上传组件包 -->
	<bean id="multipartResolver"  
        class="org.springframework.web.multipart.commons.CommonsMultipartResolver">  
        <!-- 默认编码 -->
        <property name="defaultEncoding" value="utf-8" />  
        <!-- 文件大小最大值 -->
        <property name="maxUploadSize" value="10485760000" />  
        <!-- 内存中的最大值 -->
        <property name="maxInMemorySize" value="40960" />  
    </bean> 

</beans>