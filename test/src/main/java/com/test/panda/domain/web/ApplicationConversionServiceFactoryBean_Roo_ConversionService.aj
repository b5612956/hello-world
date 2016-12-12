// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.test.panda.domain.web;

import com.test.panda.domain.Positions;
import com.test.panda.domain.web.ApplicationConversionServiceFactoryBean;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    public Converter<Positions, String> ApplicationConversionServiceFactoryBean.getPositionsToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.test.panda.domain.Positions, java.lang.String>() {
            public String convert(Positions positions) {
                return "(no displayable fields)";
            }
        };
    }
    
    public Converter<Long, Positions> ApplicationConversionServiceFactoryBean.getIdToPositionsConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.test.panda.domain.Positions>() {
            public com.test.panda.domain.Positions convert(java.lang.Long id) {
                return Positions.findPositions(id);
            }
        };
    }
    
    public Converter<String, Positions> ApplicationConversionServiceFactoryBean.getStringToPositionsConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.test.panda.domain.Positions>() {
            public com.test.panda.domain.Positions convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Positions.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getPositionsToStringConverter());
        registry.addConverter(getIdToPositionsConverter());
        registry.addConverter(getStringToPositionsConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}