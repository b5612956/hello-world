// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.sut.th.domain.we;

import com.sut.th.domain.Apply;
import com.sut.th.domain.we.ApplicationConversionServiceFactoryBean;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    public Converter<Apply, String> ApplicationConversionServiceFactoryBean.getApplyToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.sut.th.domain.Apply, java.lang.String>() {
            public String convert(Apply apply) {
                return "(no displayable fields)";
            }
        };
    }
    
    public Converter<Long, Apply> ApplicationConversionServiceFactoryBean.getIdToApplyConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.sut.th.domain.Apply>() {
            public com.sut.th.domain.Apply convert(java.lang.Long id) {
                return Apply.findApply(id);
            }
        };
    }
    
    public Converter<String, Apply> ApplicationConversionServiceFactoryBean.getStringToApplyConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.sut.th.domain.Apply>() {
            public com.sut.th.domain.Apply convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Apply.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getApplyToStringConverter());
        registry.addConverter(getIdToApplyConverter());
        registry.addConverter(getStringToApplyConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}