// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.sut.dow.web;

import com.sut.dow.domain.Sell;
import com.sut.dow.web.ApplicationConversionServiceFactoryBean;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    public Converter<Sell, String> ApplicationConversionServiceFactoryBean.getSellToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.sut.dow.domain.Sell, java.lang.String>() {
            public String convert(Sell sell) {
                return new StringBuilder().append(sell.getName()).toString();
            }
        };
    }
    
    public Converter<Long, Sell> ApplicationConversionServiceFactoryBean.getIdToSellConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.sut.dow.domain.Sell>() {
            public com.sut.dow.domain.Sell convert(java.lang.Long id) {
                return Sell.findSell(id);
            }
        };
    }
    
    public Converter<String, Sell> ApplicationConversionServiceFactoryBean.getStringToSellConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.sut.dow.domain.Sell>() {
            public com.sut.dow.domain.Sell convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Sell.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getSellToStringConverter());
        registry.addConverter(getIdToSellConverter());
        registry.addConverter(getStringToSellConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}
